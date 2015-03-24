package cn.chinuy.optimus.interfaces {
	import flash.events.IEventDispatcher;
	
	/**
	 * @author chin
	 */
	public interface IFacade extends IEventDispatcher {
		
		function get model() : IModel;
		function get view() : IView;
		function get controller() : IController;
		
		//Model-Proxy
		function hasProxy( proxyName : String ) : Boolean;
		function proxy( proxyName : String ) : IProxy;
		function registerProxy( proxy : IProxy ) : IProxy;
		function removeProxy( proxyName : String ) : IProxy;
		
		//View-Plugin
		function hasPlugin( pluginName : String ) : Boolean;
		function plugin( name : String ) : IPlugin;
		function installPlugin( plugin : IPlugin ) : void;
		function uninstallPlugin( pluginName : String ) : IPlugin;
		
		//Controller-Flow
		function hasWorkflow( workflowName : String ) : Boolean;
		function workflow( workflowName : String ) : IWorkflow;
		function addWorkflow( workflowName : String ) : IWorkflow;
		function removeWorkflow( workflowName : String ) : IWorkflow;
	}
}
