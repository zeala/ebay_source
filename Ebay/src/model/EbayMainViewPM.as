package model
{
	import com.ebayproject.events.CategoryEvent;
	import com.ebayproject.model.IEbayMainViewPM;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.events.PropertyChangeEvent;
	
	import dto.EbayServiceRequestObject;
	import dto.SearchResultItem;
	import dto.codeTypes.IncludeSelectors;
	import dto.codeTypes.SiteCodeType;
	import dto.SiteObj;
	import dto.histograms.CategoryHistogram;
	import dto.results.SearchResults;
	
	import ebayApp.services.CommandManager;
	import ebayApp.services.commands.finding.FindItemsAdvancedCommand;
	import ebayApp.services.commands.merchandising.GetMostWatchedItemsCommand;
	import ebayApp.services.commands.merchandising.GetSimilarItems;
	import ebayApp.services.commands.shopping.FindPopularItemsCommand;
	import ebayApp.services.commands.shopping.GetCategoryInfoCommand;

	public class EbayMainViewPM extends EventDispatcher implements IEbayMainViewPM
	{
		
		private static var instance : EbayMainViewPM;
		
		public static function getInstance():EbayMainViewPM
		{
			if ( !instance ) 
			{
				instance = new EbayMainViewPM();
			}
			return instance;
		}
		
		
		private var _siteObj : SiteObj;
		[Bindable("siteCodeObjChange")]
		public function get siteObj():SiteObj
		{
			return _siteObj;
		}
		public function set siteObj(val:SiteObj):void
		{
			_siteObj = val;
			dispatchEvent( new Event("siteCodeObjChange"));
			updateSiteId();
		}
		
		/*private var _siteId : String = SiteCodeType.EBAY_US;
		[Bindable("siteIdChange")]
		public function get siteId () : String
		{
			return _siteId;
		}
		public function set siteId(val:String):void
		{
			if (_siteId == val ) return;
			_siteId = val;
			updateSiteId()
			dispatchEvent( new Event("siteIdChange"));
		}
		*/
		
		
		//-------------------------------------------------------------------------------------
		//
		// PUBLIC METHODS
		//
		//-------------------------------------------------------------------------------------
		
		public function sendSearchRequest( event : PropertyChangeEvent ) : void
		{
			var requestObj : EbayServiceRequestObject = event.newValue as EbayServiceRequestObject;
			requestObj.siteId = siteObj != null ? siteObj.siteId : "0";
			requestObj.globalId = siteObj != null ? siteObj.globalId : "EBAY-US";
			CommandManager.getInstance()[FindItemsAdvancedCommand.OPERATION_NAME].execute(requestObj);
			ProductManager.getInstance().itemsSearchResult = null;
			SearchManager.getInstance().storedSearchRequestObj = requestObj;
		}
		
		public function requestSortBy ( event : PropertyChangeEvent, listingType : String = null ) : void
		{
			var requestObj : EbayServiceRequestObject 
			= SearchManager.getInstance().storedSearchRequestObj;
			
			if ( listingType != null )
			{
				requestObj.addItemFilter ( listingType );
			}
			
			requestObj.sortOrder = event.newValue.toString();
			CommandManager.getInstance()[FindItemsAdvancedCommand.OPERATION_NAME].execute(requestObj);
			ProductManager.getInstance().itemsSearchResult = null;
			SearchManager.getInstance().storedSearchRequestObj = requestObj;
		}
		
		public function narrowResultsForCategory( event : PropertyChangeEvent ) : void
		{
			var requestObj : EbayServiceRequestObject 
			= SearchManager.getInstance().storedSearchRequestObj;
			
			var catHistogram : CategoryHistogram = event.newValue as CategoryHistogram;
			requestObj.categoryId = catHistogram.categoryId;
			
			CommandManager.getInstance()[FindItemsAdvancedCommand.OPERATION_NAME].execute(requestObj);
			ProductManager.getInstance().itemsSearchResult = null;
			SearchManager.getInstance().storedSearchRequestObj = requestObj;
		}
		
		public function addToFavorites( event : PropertyChangeEvent ) : void
		{
			var item : SearchResultItem = event.newValue as SearchResultItem;
			SharedObjectController.getInstance().addToFavorites( item );
		}
		
		public function viewItemOnEbay( event : PropertyChangeEvent ) : void
		{
			var item : SearchResultItem = event.newValue as SearchResultItem;
			var requestURL : URLRequest = new URLRequest();
			requestURL.url = item.viewItemURL;
			navigateToURL( requestURL );
			
			SearchManager.getInstance().addToViewedItems( item );
		}
		
		public function fetchMoreItemsHandler (event : Event ):void
		{
			var requestObj : EbayServiceRequestObject 
				= SearchManager.getInstance().storedSearchRequestObj;
				
			var resultObj : SearchResults = ProductManager.getInstance().itemsSearchResult;
			
			var pageNum : int = requestObj.pageNumber;//resultObj.paginationOutput.pageNumber;
			var totalPages : int = resultObj.paginationOutput.totalPages;
			
			trace("\n pageNum : " + pageNum + " totalPages : " + totalPages );
			
			if (pageNum < totalPages )
			{
				requestObj.pageNumber ++;
				CommandManager.getInstance()[FindItemsAdvancedCommand.OPERATION_NAME].execute(requestObj);
			}
			else
			{
				trace("\n no more results ");
			}
		}
		
		public function requestSearchHandler(event:PropertyChangeEvent):void
		{
			var requestObj : EbayServiceRequestObject = new EbayServiceRequestObject();
			//requestObj.siteId = "0";
			requestObj.queryKeywords = event.newValue.toString();
			
			if (siteObj )
			{
				requestObj.siteId = siteObj.siteId;
				requestObj.globalId = siteObj.globalId;
				
			}
			CommandManager.getInstance()[FindItemsAdvancedCommand.OPERATION_NAME].execute(requestObj);
			ProductManager.getInstance().itemsSearchResult = null;
			SearchManager.getInstance().storedSearchRequestObj = requestObj;
			
		}
		
		
		public function updateSiteId( ) : void
		{
			var catEvent : CategoryEvent = new CategoryEvent(
				CategoryEvent.REQUEST_CHILD_CATEGORIES, "-1");
			requestCategoriesHandler( catEvent );
		}
		
		public function requestCategoriesHandler(event:CategoryEvent):void
		{
			var requestObj : EbayServiceRequestObject = new EbayServiceRequestObject();
			//requestObj.siteId = "0";
			requestObj.includeSelector = IncludeSelectors.CHILD_CATEGORIES;
			requestObj.categoryId = event.categoryId;
			
			if (siteObj )
			{
				requestObj.siteId = siteObj.siteId;
				requestObj.globalId = siteObj.globalId;
			}
			
			trace("\n site obj : " + siteObj ) ;
			CommandManager.getInstance()[GetCategoryInfoCommand.OPERATION_NAME].execute(requestObj);
		}
		
		public function requestResultsForCategoryHandler( event : CategoryEvent ) : void
		{
			var requestObj : EbayServiceRequestObject = new EbayServiceRequestObject();
			requestObj.categoryId = event.categoryId;EbayServiceRequestObject
			if (siteObj.siteId )
			{
				requestObj.siteId = siteObj.siteId;
				requestObj.globalId = siteObj.globalId;
			}
			CommandManager.getInstance()[FindItemsAdvancedCommand.OPERATION_NAME].execute(requestObj);
		}
		
		public function changeDomainHandler(event : PropertyChangeEvent ) : void
		{	
			if ( siteObj != SiteObj(event.newValue))
			{
				siteObj = event.newValue as SiteObj;
				
				if ( ProductManager.getInstance().categories )
				{
					ProductManager.getInstance().categories.removeAll();	
					ProductManager.getInstance().categories = null;
				}
			}
		}
		
		public function requestSimilarItemsForCategoryHandler(event:CategoryEvent):void
		{
			var requestObj : EbayServiceRequestObject = new EbayServiceRequestObject();
			requestObj.categoryId = event.categoryId;
			requestObj.itemId = event.itemId;
			if (siteObj.siteId )
			{
				requestObj.siteId = siteObj.siteId;
				requestObj.globalId = siteObj.globalId;
			}
			CommandManager.getInstance()[GetSimilarItems.OPERATION_NAME].execute(requestObj);
		}
		
		public function testMerchandisingService():void
		{
			var requestObj : EbayServiceRequestObject = new EbayServiceRequestObject();
			CommandManager.getInstance()[GetMostWatchedItemsCommand.OPERATION_NAME].execute(requestObj);
		}
		
		public function testFindPopularItems():void
		{
			var requestObj : EbayServiceRequestObject = new EbayServiceRequestObject();
			CommandManager.getInstance()[FindPopularItemsCommand.OPERATION_NAME].execute(requestObj);
		}
		

	}
}