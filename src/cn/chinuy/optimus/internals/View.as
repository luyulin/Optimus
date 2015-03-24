package cn.chinuy.optimus.internals {
	import cn.chinuy.optimus.interfaces.IFacade;
	import cn.chinuy.optimus.interfaces.IPlugin;
	import cn.chinuy.optimus.interfaces.IView;
	
	/**
	 * @author chin
	 */
	public class View implements IView {
		
		private var _facade : IFacade;
		
		private var pluginMap : Object = {};
		
		public function View( facade : IFacade ) {
			_facade = facade;
		}
		
		public function plugin( pluginName : String ) : IPlugin {
			return pluginMap[ pluginName ];
		}
		
		public function hasPlugin( pluginName : String ) : Boolean {
			return plugin( pluginName ) != null;
		}
		
		public function installPlugin( p : IPlugin ) : void {
			uninstallPlugin( p.name );
			pluginMap[ p.name ] = p;
			p.onRegister( _facade );
		}
		
		public function uninstallPlugin( pluginName : String ) : IPlugin {
			var p : IPlugin = plugin( pluginName );
			if( p ) {
				p.onRemove();
				delete pluginMap[ p.name ];
			}
			return p;
		}
	}
}
