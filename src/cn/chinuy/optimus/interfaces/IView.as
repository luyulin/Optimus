package cn.chinuy.optimus.interfaces {
	
	/**
	 * @author chin
	 */
	public interface IView {
		
		function plugin( pluginName : String ) : IPlugin;
		function hasPlugin( pluginName : String ) : Boolean;
		function installPlugin( plugin : IPlugin ) : void;
		function uninstallPlugin( pluginName : String ) : IPlugin;
	}
}
