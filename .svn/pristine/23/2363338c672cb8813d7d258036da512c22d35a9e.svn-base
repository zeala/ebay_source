package model
{
	import com.ebayproject.model.ISearchManager;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import dto.EbayServiceRequestObject;
	import dto.SearchResultItem;
	
	public class SearchManager extends EventDispatcher implements ISearchManager
	{
		private static var instance : SearchManager;
		
		public static function getInstance():SearchManager
		{
			if ( !instance)
			{
				instance = new SearchManager();
			}
			return instance;
		}
		
		//-------------------------------
		// storedSearchRequestObj
		//------------------------------
		private var _storedSearchRequestObj : EbayServiceRequestObject;
		
		[Bindable("storedSearchRequestObjChange")]
		public function get storedSearchRequestObj() : EbayServiceRequestObject
		{
			return _storedSearchRequestObj;
		}
		public function set storedSearchRequestObj(val:EbayServiceRequestObject):void
		{
			_storedSearchRequestObj = val;
			dispatchEvent( new Event("storedSearchRequestObjChange"));
			
		}
		
		//-------------------------------
		// viewed items
		//-------------------------------
		private var _viewedItems : ArrayCollection;
		
		[Bindable("viewedItemsChange")]
		public function get viewedItems():ArrayCollection
		{
			return _viewedItems;
		}
		public function set viewedItems(val:ArrayCollection):void
		{
			_viewedItems = val;
			dispatchEvent( new Event( "viewedItemsChange" ));
		}
		
		//----------------------------------------------------------------------------------------
		//
		// PUBLIC METHODS
		//
		//----------------------------------------------------------------------------------------
		
		public function sendSearchRequest( requestObj : EbayServiceRequestObject ) : void
		{
			
		}
		
		public function addToViewedItems ( item : SearchResultItem ) : void
		{
			if ( !viewedItems )
			{
				viewedItems = new ArrayCollection();
			}
			
			viewedItems.addItem( item );
			dispatchEvent( new Event("viewedItemsChange"));
		}
	}
}