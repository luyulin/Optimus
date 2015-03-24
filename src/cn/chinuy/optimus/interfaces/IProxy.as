package cn.chinuy.optimus.interfaces {
	import flash.events.Event;
	
	/**
	 * @author chin
	 */
	public interface IProxy {
		
		function get name() : String;
		function get model() : IModel;
		
		function get data() : *;
		function set data( value : * ) : void;
		
		function onRegister( model : IModel ) : void;
		function onRemove() : void;
		function dispatchEvent( event : Event ) : Boolean;
	}
}
