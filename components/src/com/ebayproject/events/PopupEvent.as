package com.ebayproject.events
{
	import flash.events.Event;
	
	public class PopupEvent extends Event
	{
		public static const ADD_POPUP : String = "addPopup";
		public static const REMOVE_POPUP : String = "removePopup";
		
		public var popupDataObj : Object ;
		public function PopupEvent(
			type:String, popupDataObj : Object)
		{
			this.popupDataObj = popupDataObj
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new PopupEvent( type, popupDataObj );
		}
	}
}