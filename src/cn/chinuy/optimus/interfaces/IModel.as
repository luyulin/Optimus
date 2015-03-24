package cn.chinuy.optimus.interfaces {
	import flash.events.Event;
	
	/**
	 * @author chin
	 */
	public interface IModel {
		
		function proxy( name : String ) : IProxy;
		function hasProxy( name : String ) : Boolean;
		function registerProxy( proxy : IProxy ) : IProxy;
		function removeProxy( name : String ) : IProxy;
		function dispatchEvent( event : Event ) : Boolean;
	}
}
