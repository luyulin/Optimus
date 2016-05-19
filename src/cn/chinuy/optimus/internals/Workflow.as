package cn.chinuy.optimus.internals {
	import cn.chinuy.optimus.interfaces.IFacade;
	import cn.chinuy.optimus.interfaces.IProcessor;
	import cn.chinuy.optimus.interfaces.IService;
	import cn.chinuy.optimus.interfaces.IWorkflow;
	
	import flash.events.EventDispatcher;
	
	/**
	 * @author chin
	 */
	public class Workflow extends EventDispatcher implements IWorkflow {
		
		private var _facade : IFacade;
		private var _name : String;
		private var _processor : IProcessor;
		
		private var serviceMap : Object = {};
		
		public function Workflow( name : String ) {
			super();
			_name = name;
		}
		
		public function get name() : String {
			return _name;
		}
		
		public function get currentProcessor() : IProcessor {
			return _processor;
		}
		
		public function init( facade : IFacade ) : void {
			_facade = facade;
		}
		
		public function destroy() : void {
			endProcessor();
			for( var i : String in serviceMap ) {
				removeService( i );
			}
		}
		
		public function registerService( service : IService ) : void {
			var serviceName : String = service.name;
			removeService( serviceName );
			serviceMap[ serviceName ] = service;
			service.onRegister( _facade, this );
			_facade.dispatchEvent( new ServiceEvent( ServiceEvent.Registered + serviceName, serviceName ));
		}
		
		public function registerMultitonService( serviceName : String, serviceClass : Class ) : void {
			removeService( serviceName );
			serviceMap[ serviceName ] = serviceClass;
			_facade.dispatchEvent( new ServiceEvent( ServiceEvent.Registered + serviceName, serviceName ));
		}
		
		public function removeService( serviceName : String ) : void {
			if( hasService( serviceName )) {
				delete serviceMap[ serviceName ];
				_facade.dispatchEvent( new ServiceEvent( ServiceEvent.Removed + serviceName, serviceName ));
			}
		}
		
		public function hasService( serviceName : String ) : Boolean {
			return serviceMap[ serviceName ] != null;
		}
		
		public function service( serviceName : String ) : IService {
			var serviceSource : * = serviceMap[ serviceName ];
			if( serviceSource != null ) {
				var service : IService = serviceSource;
				if( service == null ) {
					var ServiceClass : Class = serviceSource;
					service = new ServiceClass();
					service.onRegister( _facade, this );
				}
				return service;
			}
			return null;
		}
		
		public function setProcessor( processor : IProcessor ) : void {
			endProcessor();
			_processor = processor;
			if( currentProcessor ) {
				currentProcessor.onStart( _facade, this );
			}
		}
		
		public function endProcessor() : void {
			if( currentProcessor ) {
				currentProcessor.onFinish();
			}
		}
	}
}
