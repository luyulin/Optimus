package cn.chinuy.optimus.abstracts {
	import cn.chinuy.optimus.interfaces.IFacade;
	import cn.chinuy.optimus.interfaces.IService;
	import cn.chinuy.optimus.interfaces.IWorkflow;
	
	/**
	 * @author chin
	 */
	public class Service implements IService {
		
		private var _name : String;
		private var _facade : IFacade;
		private var _flow : IWorkflow;
		
		public function Service( name : String ) {
			super();
			_name = name;
		}
		
		public function get name() : String {
			return _name;
		}
		
		public function get workflow() : IWorkflow {
			return _flow;
		}
		
		public function get facade() : IFacade {
			return _facade;
		}
		
		final public function onRegister( facade : IFacade, flow : IWorkflow ) : void {
			_facade = facade;
			_flow = flow;
			onInit();
		}
		
		final public function remove() : void {
			onDestroy();
		}
		
		protected function onInit() : void {
		}
		
		protected function onDestroy() : void {
		}
	
	}
}
