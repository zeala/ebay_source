package com.ebayproject.events
{
	import flash.events.Event;
	
	public class LayoutEvent extends Event
	{
		public static const CHANGE_LAYOUT_TYPE : String = "changeLayoutType";
		
		public var layoutType : String;
		
		public function LayoutEvent(type:String)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new LayoutEvent(type);
		}
	}
}