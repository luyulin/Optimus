package cn.chinuy.optimus.internals {
	import cn.chinuy.optimus.interfaces.IFacade;
	import cn.chinuy.optimus.interfaces.IModel;
	import cn.chinuy.optimus.interfaces.IProxy;
	
	import flash.events.Event;
	
	/**
	 * @author chin
	 */
	public class Model implements IModel {
		
		private var _facade : IFacade;
		
		private var proxyMap : Object = {};
		
		public function Model( facade : IFacade ) {
			_facade = facade;
		}
		
		public function registerProxy( p : IProxy ) : IProxy {
			removeProxy( p.name );
			proxyMap[ p.name ] = p;
			p.onRegister( this );
			return p;
		}
		
		public function hasProxy( name : String ) : Boolean {
			return proxy( name ) != null;
		}
		
		public function proxy( name : String ) : IProxy {
			return proxyMap[ name ];
		}
		
		public function removeProxy( name : String ) : IProxy {
			var p : IProxy = proxy( name );
			if( p ) {
				p.onRemove();
				delete proxyMap[ p.name ];
			}
			return p;
		}
		
		public function dispatchEvent( e : Event ) : Boolean {
			return _facade.dispatchEvent( e );
		}
	}
}
