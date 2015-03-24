package cn.chinuy.optimus.internals {
	import flash.events.Event;
	
	/**
	 * @author chin
	 */
	public class ServiceEvent extends Event {
		
		public static const Registered : String = "Optimus.Service.Registered:::";
		public static const Removed : String = "Optimus.Service.Removed:::";
		
		private var _serviceName : String;
		
		public function ServiceEvent( type : String, serviceName : String ) {
			super( type );
			_serviceName = serviceName;
		}
		
		public function get serviceName() : String {
			return _serviceName;
		}
		
		override public function clone() : Event {
			return new ServiceEvent( type, serviceName );
		}
	
	}
}
