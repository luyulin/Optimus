package cn.chinuy.optimus.interfaces {
	import flash.events.IEventDispatcher;
	
	/**
	 * @author chin
	 */
	public interface IPlugin extends IEventDispatcher {
		
		function get name() : String;
		function get facade() : IFacade;
		function onRegister( facade : IFacade ) : void;
		function onRemove() : void;
	}
}
