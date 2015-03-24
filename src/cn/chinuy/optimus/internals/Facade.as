package cn.chinuy.optimus.internals {
	import cn.chinuy.optimus.interfaces.IController;
	import cn.chinuy.optimus.interfaces.IFacade;
	import cn.chinuy.optimus.interfaces.IModel;
	import cn.chinuy.optimus.interfaces.IPlugin;
	import cn.chinuy.optimus.interfaces.IProxy;
	import cn.chinuy.optimus.interfaces.IView;
	import cn.chinuy.optimus.interfaces.IWorkflow;
	
	import flash.events.EventDispatcher;
	
	/**
	 * @author chin
	 */
	public class Facade extends EventDispatcher implements IFacade {
		
		private var _model : IModel;
		private var _view : IView;
		private var _controller : IController;
		
		public function Facade() {
			super();
			_model = new Model( this );
			_view = new View( this );
			_controller = new Controller( this );
		}
		
		public function get model() : IModel {
			return _model;
		}
		
		public function get view() : IView {
			return _view;
		}
		
		public function get controller() : IController {
			return _controller;
		}
		
		//Model-Proxy
		public function hasProxy( proxyName : String ) : Boolean {
			return model.hasProxy( proxyName );
		}
		
		public function proxy( proxyName : String ) : IProxy {
			return model.proxy( proxyName );
		}
		
		public function registerProxy( proxy : IProxy ) : IProxy {
			return model.registerProxy( proxy );
		}
		
		public function removeProxy( proxyName : String ) : IProxy {
			return model.removeProxy( proxyName );
		}
		
		//View-Plugin
		public function hasPlugin( pluginName : String ) : Boolean {
			return view.hasPlugin( pluginName );
		}
		
		public function plugin( pluginName : String ) : IPlugin {
			return view.plugin( pluginName );
		}
		
		public function installPlugin( plugin : IPlugin ) : void {
			view.installPlugin( plugin );
		}
		
		public function uninstallPlugin( pluginName : String ) : IPlugin {
			return view.uninstallPlugin( pluginName );
		}
		
		//Controller-Flow
		public function hasWorkflow( workflowName : String ) : Boolean {
			return controller.hasWorkflow( workflowName );
		}
		
		public function workflow( workflowName : String ) : IWorkflow {
			return controller.workflow( workflowName );
		}
		
		public function addWorkflow( workflowName : String ) : IWorkflow {
			return controller.addWorkflow( workflowName );
		}
		
		public function removeWorkflow( workflowName : String ) : IWorkflow {
			return controller.removeWorkflow( workflowName );
		}
	
	}
}
