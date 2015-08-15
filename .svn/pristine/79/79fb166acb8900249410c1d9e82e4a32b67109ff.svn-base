package model
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import dto.SimpleUser;
	import dto.results.CatalogSearchResults;
	import dto.results.EBayItem;
	import dto.results.SearchResults;
	
	import ebayApp.services.FindingServiceGET;
	import ebayApp.services.MerchandisingServiceGet;
	import ebayApp.services.ShoppingServiceGET;
	import ebayApp.services.commands.finding.FindCompletedItemsCommand;
	import ebayApp.services.commands.finding.FindItemsAdvancedCommand;
	import ebayApp.services.commands.finding.FindItemsByImageCommand;
	import ebayApp.services.commands.merchandising.GetMostWatchedItemsCommand;
	import ebayApp.services.commands.merchandising.GetSimilarItems;
	import ebayApp.services.commands.merchandising.GetTopSellingProducts;
	import ebayApp.services.commands.shopping.FindPopularItemsCommand;
	import ebayApp.services.commands.shopping.FindPopularSearchesCommand;
	import ebayApp.services.commands.shopping.FindProductsCommand;
	import ebayApp.services.commands.shopping.FindReviewsAndGuidesCommand;
	import ebayApp.services.commands.shopping.GetCategoryInfoCommand;
	import ebayApp.services.commands.shopping.GetSingleItemCommand;
	import ebayApp.services.commands.shopping.GetUserProfileCommand;
	import ebayApp.services.commands.trading.GetSessionIDCommand;
	import ebayApp.services.events.EbayServiceResultEvent;
	import ebayApp.services.util.parsers.EBayResultParser;
	import ebayApp.services.util.parsers.ShoppingServiceParser;
	
	public class EbayServicesManager extends EventDispatcher
	{
		public function EbayServicesManager()
		{
			init();
		}

		//-----------------------------------
		// completed items
		//-----------------------------------
		private var _completedItems:ArrayCollection = new ArrayCollection();
		[Bindable("completedItemsChange")]
		public function get completedItems():ArrayCollection
		{
			return _completedItems;
		}

		
		private function init():void
		{
			// finding service
			
			FindingServiceGET.getInstance().addEventListener( 
				FindCompletedItemsCommand.RESPONSE_EVENT_NAME, findCompletedItemsResultHandler);
			
			FindingServiceGET.getInstance().addEventListener(
				FindItemsAdvancedCommand.RESPONSE_EVENT_NAME, findItemsAdvancedResultHandler );
			
			FindingServiceGET.getInstance().addEventListener(
				FindItemsByImageCommand.RESPONSE_EVENT_NAME, findItemsByImageResultHandler );
			
			
			// merchandising service
			
			MerchandisingServiceGet.getInstance().addEventListener(
				GetMostWatchedItemsCommand.RESPONSE_EVENT_NAME, getMostWatchedItemsResultHandler );
			
			MerchandisingServiceGet.getInstance().addEventListener(
				GetSimilarItems.RESPONSE_EVENT_NAME, getSimilarItemsResultHandler );
			
			MerchandisingServiceGet.getInstance().addEventListener(
				GetTopSellingProducts.RESPONSE_EVENT_NAME, getTopSellingProductsHandler);
			
			// shopping service
			ShoppingServiceGET.getInstance().addEventListener(
				GetSingleItemCommand.RESPONSE_EVENT_NAME, getSingleItemResultHandler );
			
			ShoppingServiceGET.getInstance().addEventListener(
				GetUserProfileCommand.RESPONSE_EVENT_NAME, getUserProfileResultHandler );
			
			ShoppingServiceGET.getInstance().addEventListener(
				FindPopularSearchesCommand.RESPONSE_EVENT_NAME, findPopularSearchesResultHandler);
			
			ShoppingServiceGET.getInstance().addEventListener(
				GetCategoryInfoCommand.RESPONSE_EVENT_NAME, getCategoryInfoResultHandler );
		
			ShoppingServiceGET.getInstance().addEventListener(
				FindReviewsAndGuidesCommand.RESPONSE_EVENT_NAME, findReviewsAndGuidesResponseHandler);
			
			ShoppingServiceGET.getInstance().addEventListener(
				GetSessionIDCommand.RESPONSE_EVENT_NAME, getSessionIdResponseHandler );
			
			ShoppingServiceGET.getInstance().addEventListener(
				FindProductsCommand.RESPONSE_EVENT_NAME, findProductsResponseHandler );
			
			ShoppingServiceGET.getInstance().addEventListener(
				FindPopularItemsCommand.RESPONSE_EVENT_NAME, findPopularItemsResponseHandler);
		}
		
		
		//-------------------------------------------------------------------------------------
		//
		// MERCHANDISING SERVICE RESULT HADNLER
		//
		//-------------------------------------------------------------------------------------
		
		private function getSimilarItemsResultHandler( event : EbayServiceResultEvent ) : void
		{
			var xml : XML = event.resultObj as XML;
			trace("\n similarItems result : " + xml );
		}
		
		private function getMostWatchedItemsResultHandler( event : EbayServiceResultEvent ) : void
		{
			var xml : XML = event.resultObj as XML;
			trace("\n xml : " + xml );
			
			var newNameSpace : Namespace = new Namespace("http://www.ebay.com/marketplace/services");
			
			var results : ArrayCollection = 
				EBayResultParser.parseMerchandisingServiceRequest( xml, "merchandise" );
			//ProductManager.getInstance().itemsSearchResult = searchResults;
			
			var searchResults : SearchResults = new SearchResults();
			searchResults.searchResultItem = results;
			
			trace("results.length : " + results.length );
			ProductManager.getInstance().secondarySearchResult = searchResults;
		}
		
		private function getTopSellingProductsHandler( event :EbayServiceResultEvent ) : void
		{
			var xml : XML = event.resultObj as XML;
			trace("\n topSelling : " + xml );
		}
		
		
		//-----------------------------------------------------------------------------------
		//
		// Shopping service result handlers
		//
		//-----------------------------------------------------------------------------------
		
		private function findPopularItemsResponseHandler( event : EbayServiceResultEvent ) : void
		{
			var xml : XML = event.resultObj;
			trace("\n xml : " + xml );
			
			var searchResults : SearchResults = EBayResultParser.parseOldShoppingServiceSearchResults( xml );
			ProductManager.getInstance().itemsSearchResult = searchResults;
		}
		
		private function findProductsResponseHandler( event : EbayServiceResultEvent ) : void
		{
			var xml : XML = event.resultObj as XML;
			trace("\n xml : " + xml );
			
			var searchResult : CatalogSearchResults = ShoppingServiceParser.parseProductSearchResult( xml );
			ProductManager.getInstance().catalogSearchResult = searchResult;
		}
		
		private function getSessionIdResponseHandler( event : EbayServiceResultEvent ) : void
		{
			var xml : XML = event.resultObj as XML;
			trace("\xml : " + xml);
		}
		
		private function findReviewsAndGuidesResponseHandler ( event : EbayServiceResultEvent) : void
		{
			var xml : XML = event.resultObj as XML;
			trace( "\n xml : " + xml );
		}
		
		private function getCategoryInfoResultHandler( event : EbayServiceResultEvent ): void
		{
			var xml : XML = event.resultObj as XML;
			trace("\n xml : " + xml );
			
			ProductManager.getInstance().processCategories(EBayResultParser.parseCategoryResults( xml ));
			
		}
		
		private function findItemsByImageResultHandler( event : EbayServiceResultEvent ) : void
		{
			var xml : XML = event.resultObj as XML;
			trace("\n xml : " + xml);
			
			var searchResults:SearchResults = EBayResultParser.parseSearchResults( xml );
		}
		
		private function findPopularSearchesResultHandler ( event : EbayServiceResultEvent ) : void
		{
			var xml : XML = event.resultObj as XML;
			trace("\n xml : " + xml );
		}
		
		private function getUserProfileResultHandler( event : EbayServiceResultEvent ):void 
		{
			var xml : XML = event.resultObj as XML;
			trace("\n xml : " + xml );
			
			var user : SimpleUser = EBayResultParser.parseEBayUser( xml );
		}
		private function getSingleItemResultHandler ( event : EbayServiceResultEvent ) : void
		{
			var xml : XML = event.resultObj as XML;
			trace("\n xml : " + xml );
			
			var item : EBayItem = ShoppingServiceParser.parseEBayItem( xml );
			
		}
		
		
		private function findItemsAdvancedResultHandler( event:EbayServiceResultEvent):void
		{
			var xml : XML = event.resultObj as XML ;
			var searchResults : SearchResults = EBayResultParser.parseSearchResults( xml );
			
			if ( ProductManager.getInstance().itemsSearchResult != null )
			{
				ProductManager.getInstance().itemsSearchResult.addSearchResultItems
					( searchResults.searchResultItem );
			}
			else
			{
				ProductManager.getInstance().itemsSearchResult = searchResults;
			}
				
			
			trace("\n xml : " + xml );
		}
		
		private function findCompletedItemsResultHandler(event:EbayServiceResultEvent):void
		{
			
			var xml:XML = event.resultObj as XML;
			var itemsList:XMLList = xml..item;
			var searchResults : SearchResults = EBayResultParser.parseSearchResults( xml );
		}
	}
	

}