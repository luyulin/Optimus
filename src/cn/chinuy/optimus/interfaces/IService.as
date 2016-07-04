package cn.chinuy.optimus.interfaces {
	
	/**
	 * @author chin
	 */
	public interface IService {
		
		function get name() : String;
		function onRegister( facade : IFacade, flow : IWorkflow ) : void;
		function onRemove() : void;
	}
}
