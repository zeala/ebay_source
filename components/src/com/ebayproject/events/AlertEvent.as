package com.ebayproject.events
{
	import flash.events.Event;
	
	public class AlertEvent extends Event
	{
		
		public static const OPEN_ALERT_WINDOW : String = "openAlertWindow";
		
		public var callback : Function;
		
		public var data : Object;
		
		public var message : String;
		
		public function AlertEvent(type:String, message : String,
								   data : Object= null, callback : Function = null)
		{
			super(type, true, cancelable);
			this.message = message;
			this.callback = callback;
			this.data = data;
		}
		
		override public function clone():Event
		{
			return new AlertEvent( type, message, data, callback );
		}
	}
}