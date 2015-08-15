package model
{
	import com.ebayproject.controllers.IProductManager;
	import com.ebayproject.services.results.ISearchResults;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	
	import dto.Category;
	import dto.SearchResultItem;
	import dto.EbayServiceRequestObject;
	import dto.results.CatalogSearchResults;
	import dto.results.SearchResults;

	public class ProductManager extends EventDispatcher implements IProductManager
	{
		public static const CATEGORIES_CHANGE : String = "categoriesChange";
		public static const CATALOG_SEARCH_RESULT_CHANGE : String = "catalogSearchResultChange";
		public static const ITEM_SEARCH_RESULT_CHANGE : String = "itemsSearchResultChange";
		public static const SECONDARY_SEARCH_RESULT_CHANGE : String = "secondarySearhcResultChange";
		
		private static var instance : ProductManager
		
		public static function getInstance():ProductManager
		{
			if ( !instance )
			{
				instance = new ProductManager();
			}
			
			return instance;
		}
		
		
		//-------------------------------------------------------------------------
		//
		// Properties
		//
		//-------------------------------------------------------------------------
		
		
		//-----------------------------
		// categoryMap
		//-----------------------------
		public var categoryMap : Dictionary = new Dictionary();
		
		//-----------------------------
		// categories
		//-----------------------------
		private var _categories : ArrayCollection;
		[Bindable("categoriesChange")]
		public function get categories():ArrayCollection
		{
			trace("\n getcategories called ");
			return _categories;
		}
		public function set categories(val:ArrayCollection):void
		{
			trace("\n set categories called ");
			if ( _categories != val )
			{
				_categories = val;
				trace("\n new categories AC ");	
			}
			dispatchEvent(new Event(CATEGORIES_CHANGE));
		}
		
		
		//-----------------------------
		// secondarySearchResults
		//-----------------------------
		private var _secondarySearchResults : SearchResults;
		
		[Bindable("secondarySearhcResultChange")]
		public function get secondarySearchResult():SearchResults
		{
			return _secondarySearchResults;
		}
		public function set secondarySearchResult(val : SearchResults ) : void
		{
			_secondarySearchResults = val;
			dispatchEvent( new Event( SECONDARY_SEARCH_RESULT_CHANGE ));
		}
		
		//-----------------------------
		// itemsSearchResult
		//-----------------------------
		private var _itemsSearchResult : SearchResults;
		
		[Bindable("itemsSearchResultChange")]
		public function get itemsSearchResult():SearchResults
		{
			return _itemsSearchResult;
		}
		public function set itemsSearchResult(val:SearchResults):void
		{
			_itemsSearchResult = val;
			_currentItemsSearchResult = _itemsSearchResult;
			dispatchEvent( new Event( ITEM_SEARCH_RESULT_CHANGE ));
		}
		
		//-----------------------------
		// currentSearchResult
		//-----------------------------
		private var _currentItemsSearchResult : SearchResults;
		[Bindable("currentItemsSearchResultChange")]
		public function get currentItemsSearchResult():SearchResults
		{
			return _currentItemsSearchResult;
		}
		public function set currentItemsSearchResult(val:SearchResults):void
		{
			_currentItemsSearchResult = val;
			dispatchEvent( new Event("currentItemsSearchResultChange"));
		}
		
		
		
		//-----------------------------
		// catalogSearchResult
		//-----------------------------
		private var _catalogSearchResult : CatalogSearchResults;
		[Bindable("catalogSearchResultChange")]
		public function get catalogSearchResult():CatalogSearchResults
		{
			return _catalogSearchResult;
		}
		public function set catalogSearchResult(val:CatalogSearchResults):void
		{
			_catalogSearchResult = val;
			dispatchEvent(new Event(CATALOG_SEARCH_RESULT_CHANGE ));
		}
		
		//-------------------------------------------------------------------------
		//
		// METHODS
		//
		//--------------------------------------------- ----------------------------

		public function getPreviousItem ( val : SearchResultItem ) : SearchResultItem
		{
			var newItem : SearchResultItem;
			
			var currentIndex : int;
			
			for ( var i:int = 0; i < this.itemsSearchResult.searchResultItem.length; i++)
			{
				var item : SearchResultItem = this.itemsSearchResult.searchResultItem[i];
				if ( item.itemId == val.itemId )
				{
					currentIndex = i;
					break;
				}
			}
			
			var newIndex : int = currentIndex - 1;
			if ( newIndex < 0 ) return null;
			
			newItem = 
				itemsSearchResult.searchResultItem.getItemAt( newIndex ) as SearchResultItem;
				
			return newItem;
		}
		
		public function getNextItem(val:SearchResultItem ) : SearchResultItem
		{
			var newItem : SearchResultItem;
			
			var currentIndex : int;
			
			for ( var i:int = 0; i < this.itemsSearchResult.searchResultItem.length; i++)
			{
				var item : SearchResultItem = this.itemsSearchResult.searchResultItem[i];
				if ( item.itemId == val.itemId )
				{
					currentIndex = i;
					break;
				}
			}
			
			var newIndex : int = currentIndex + 1;
			if ( newIndex >= itemsSearchResult.searchResultItem.length ) return null;
			
			newItem =
				itemsSearchResult.searchResultItem.getItemAt( newIndex ) as SearchResultItem;
			
			return newItem;
		}
		
		
		public function processCategories ( ac : ArrayCollection ) : void
		{
			if ( categories )
			{
				//categories.disableAutoUpdate();
			}
			var cat:Category
			
			if ( !categories )
			{
				categories = ac;
			}
			else
			{
				for ( i = 0; i < ac.length; i++)
				{
					cat = ac[i];
					var catPathIdArray : Array = cat.categoryIdPath.split(":");
					
					if ( catPathIdArray.length > 1 )
					{
						var newArray : Array = catPathIdArray.slice(0, catPathIdArray.length-1);
						var parentCatPath : String = newArray.join(":");
						//trace("\n newArray : " + newArray + " parentCatPath : " + parentCatPath );
						var parentCat : Category = categoryMap[ parentCatPath ];
						if ( parentCat )
						{
							parentCat.addChild( ac[i] );
						}
					} 
				}
			}
			//categories.enableAutoUpdate();
			dispatchEvent( new Event(CATEGORIES_CHANGE ));
			for ( var i : int = 0; i < ac.length; i ++)
			{
				cat = ac[i];
				categoryMap [ cat.categoryIdPath ] = cat;
			}
			
		}
		
		
		private function addChildCategory( newCat : Category ) : void
		{
			var catPath : String = newCat.categoryIdPath;
			var catPathArray : Array = catPath.split(":");
			
		}

	}
}