package cn.chinuy.optimus.internals {
	import cn.chinuy.optimus.interfaces.IController;
	import cn.chinuy.optimus.interfaces.IFacade;
	import cn.chinuy.optimus.interfaces.IWorkflow;
	
	/**
	 * @author chin
	 */
	public class Controller implements IController {
		
		private var facade : IFacade;
		private var workflowMap : Object = {};
		
		public function Controller( facade : IFacade ) {
			this.facade = facade;
		}
		
		public function hasWorkflow( workflowName : String ) : Boolean {
			return workflow( workflowName ) != null;
		}
		
		public function workflow( workflowName : String ) : IWorkflow {
			return workflowMap[ workflowName ];
		}
		
		public function addWorkflow( workflowName : String ) : IWorkflow {
			removeWorkflow( workflowName );
			var flow : IWorkflow = new Workflow( workflowName );
			workflowMap[ workflowName ] = flow;
			flow.init( facade );
			return flow;
		}
		
		public function removeWorkflow( workflowName : String ) : IWorkflow {
			var flow : IWorkflow = workflow( workflowName );
			if( flow ) {
				flow.destroy();
				delete workflowMap[ workflowName ];
			}
			return flow;
		}
	}
}
