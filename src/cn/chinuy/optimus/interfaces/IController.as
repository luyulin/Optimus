package cn.chinuy.optimus.interfaces {
	
	/**
	 * @author chin
	 */
	public interface IController {
		
		function hasWorkflow( workflowName : String ) : Boolean;
		function workflow( workflowName : String ) : IWorkflow;
		function addWorkflow( workflowName : String ) : IWorkflow;
		function removeWorkflow( workflowName : String ) : IWorkflow;
	}
}
