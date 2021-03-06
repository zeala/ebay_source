package com.ebayproject.events
{
	import flash.events.Event;
	
	public class CategoryPickerEvent extends Event
	{
		public static const OPEN_CATEGORY_PICKER : String = "openCategoryPicker";
		public static const SELECT_CATEGORIES : String = "selectCategories";
		
		public var categories : Array;
		public var eventHandler : Function;
		
		
		public function CategoryPickerEvent(type:String, eventHandler : Function = null)
		{
			this.eventHandler = eventHandler;
			super(type, true, cancelable);
		}
		
		override public function clone():Event
		{
			return new CategoryPickerEvent( type, eventHandler );
		}
	}
}