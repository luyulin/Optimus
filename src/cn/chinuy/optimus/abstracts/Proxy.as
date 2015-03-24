package cn.chinuy.optimus.abstracts {
	import cn.chinuy.optimus.interfaces.IModel;
	import cn.chinuy.optimus.interfaces.IProxy;
	
	import flash.events.Event;
	
	/**
	 * @author chin
	 */
	public class Proxy implements IProxy {
		
		private var _name : String;
		private var _data : *;
		private var _model : IModel;
		
		public function Proxy( name : String, data : * = null ) {
			super();
			_name = name;
			this.data = data;
		}
		
		public function get name() : String {
			return _name;
		}
		
		public function get data() : * {
			return _data;
		}
		
		public function set data( value : * ) : void {
			_data = value;
		}
		
		public function get model() : IModel {
			return _model;
		}
		
		final public function onRegister( model : IModel ) : void {
			_model = model;
			onInit();
		}
		
		final public function onRemove() : void {
			onDestroy();
		}
		
		public function dispatchEvent( event : Event ) : Boolean {
			return model.dispatchEvent( event );
		}
		
		protected function onInit() : void {
		}
		
		protected function onDestroy() : void {
		}
	
	}
}
