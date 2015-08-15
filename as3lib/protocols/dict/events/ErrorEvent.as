

package com.adobe.protocols.dict.events
{
	import flash.events.Event;
	
	public class ErrorEvent extends Event
	{
		public static const ERROR:String = "error";
		
		private var _code:uint;
		private var _message:String;
		
		public function ErrorEvent(type:String, bubbles:Boolean = false,
													cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		public function set code(code:uint):void
		{
			this._code = code;
		}

		public function set message(message:String):void
		{
			this._message = message;
		}

		public function get code():uint
		{
			return this._code;
		}

		public function get message():String
		{
			return this._message;
		}
		
		public override function clone():Event
		{
			var out:ErrorEvent = new ErrorEvent(type, bubbles, cancelable);
			
			out.message = _message;
			out.code = _code;
			
			return out;
		}
	}
}