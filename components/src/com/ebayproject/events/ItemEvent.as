package com.ebayproject.events
{
	import flash.events.Event;
	
	import dto.SearchResultItem;

	public class ItemEvent extends Event
	{
		public static const VIEW_ITEM_ON_EBAY : String = "viewItemOnEbay";
		
		public var searchResultItem : SearchResultItem;
		
		public function ItemEvent(
			type:String, item : SearchResultItem)
		{
			this.searchResultItem = item;
			super(type, true, cancelable);
		}
		
		override public function clone():Event
		{
			return new ItemEvent( type, searchResultItem );
		}
	}
}