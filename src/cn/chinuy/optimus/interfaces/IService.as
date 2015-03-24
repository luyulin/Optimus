package cn.chinuy.optimus.interfaces {
	
	/**
	 * @author chin
	 */
	public interface IService {
		
		function get name() : String;
		function get workflow() : IWorkflow;
		function get facade() : IFacade;
		function onRegister( facade : IFacade, flow : IWorkflow ) : void;
		function remove() : void;
	}
}
