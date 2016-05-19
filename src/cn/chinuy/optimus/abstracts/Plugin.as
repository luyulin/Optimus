package cn.chinuy.optimus.abstracts {
	import cn.chinuy.optimus.interfaces.IFacade;
	import cn.chinuy.optimus.interfaces.IPlugin;
	import cn.chinuy.optimus.interfaces.IWorkflow;
	import cn.chinuy.optimus.internals.ServiceEvent;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	/**
	 * @author chin
	 */
	public class Plugin implements IPlugin {
		
		private var _name : String;
		private var _facade : IFacade;
		
		private var listenerMap : Dictionary = new Dictionary();
		
		public function Plugin( name : String ) {
			super();
			_name = name;
		}
		
		public function get name() : String {
			return _name;
		}
		
		public function get facade() : IFacade {
			return _facade;
		}
		
		final public function onRegister( facade : IFacade ) : void {
			_facade = facade;
			onInit();
		}
		
		final public function onRemove() : void {
			cleanAllEventListener();
			onDestroy();
		}
		
		public function willTrigger( type : String ) : Boolean {
			return hasEventListener( type );
		}
		
		public function addEventListener( type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false ) : void {
			attachEventListener( facade, type, listener );
		}
		
		public function removeEventListener( type : String, listener : Function, useCapture : Boolean = false ) : void {
			unattachEventListener( facade, type );
		}
		
		public function hasEventListener( type : String ) : Boolean {
			var eventMap : Object = listenerMap[ facade ];
			if( eventMap != null ) {
				return eventMap[ type ] != null;
			}
			return false;
		}
		
		public function dispatchEvent( event : Event ) : Boolean {
			return facade.dispatchEvent( event );
		}
		
		final protected function listenServiceChange( workflowName : String, serviceName : String, listener : Function ) : void {
			var workflow : IWorkflow = facade.workflow( workflowName );
			if( workflow )
				if( workflow.hasService( serviceName )) {
					listener( true );
				}
			attachEventListener( this, ServiceEvent.Registered + serviceName, getServiceChangeHandler( listener, true ));
			attachEventListener( this, ServiceEvent.Removed + serviceName, getServiceChangeHandler( listener, false ));
		}
		
		private function getServiceChangeHandler( listener : Function, init : Boolean ) : Function {
			return function( e : ServiceEvent ) : void {
				listener( init );
			};
		}
		
		final protected function cleanAllEventListener() : void {
			for( var target : * in listenerMap ) {
				cleanEventListener( target );
			}
		}
		
		final protected function cleanEventListener( target : IEventDispatcher ) : void {
			var eventMap : Object = listenerMap[ target ];
			for( var type : String in eventMap ) {
				unattachEventListener( target, type );
			}
			delete listenerMap[ target ];
		}
		
		final protected function unattachEventListener( target : IEventDispatcher, type : String ) : void {
			if( target == null ) {
				return;
			}
			var eventMap : Object = listenerMap[ target ];
			if( eventMap != null ) {
				var handler : Function = eventMap[ type ];
				if( handler != null ) {
					target.removeEventListener( type, handler );
					delete eventMap[ type ];
				}
			}
		}
		
		final protected function attachEventListener( target : IEventDispatcher, type : String, handler : Function ) : void {
			if( target == null ) {
				return;
			}
			var eventMap : Object = listenerMap[ target ];
			if( eventMap == null ) {
				eventMap = listenerMap[ target ] = {};
			}
			
			unattachEventListener( target, type );
			eventMap[ type ] = handler;
			target.addEventListener( type, handler );
		}
		
		protected function onInit() : void {
		}
		
		protected function onDestroy() : void {
		}
	
	}
}
