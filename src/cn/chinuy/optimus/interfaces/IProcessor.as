package cn.chinuy.optimus.interfaces {
	
	/**
	 * @author chin
	 */
	public interface IProcessor {
		
		function get name() : String;
		function get workflow() : IWorkflow;
		function get facade() : IFacade;
		function onStart( facade : IFacade, flow : IWorkflow ) : void;
		function onFinish() : void;
	}
}
