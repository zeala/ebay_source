
package com.adobe.webapis.ebay
{
	import com.adobe.webapis.ebay.events.EBayResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	
	import dto.results.AddOrRemoveFromWatchListResult;
	import dto.results.EBayItem;
	import dto.results.EBayUser;
	import dto.results.MyEBayBuyingItems;
	import dto.results.PlaceOfferResult;
	import dto.results.SearchResults;
	
	/** Use the EBay internal namespace for parsing server results */
	use namespace ebay_internal;

	/**
	 * Event broadcast when results have been loaded from the eBay servers
	 * in response to <code>addToWatchList</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>AddOrRemoveFromWatchListResult</code> object - an object containing
	 * 			the results from the AddToWatchList API call.
	 * 		</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType com.adobe.webapis.ebay.events.EBayResultEvent.ON_ADD_TO_WATCH_LIST
	 * 
	 * @see #addToWatchList()
	 * @see com.adobe.webapis.ebay.objects.AddOrRemoveFromWatchListResult
	 */
	[Event(name="onAddToWatchList", type="com.adobe.webapis.ebay.events.EBayResultEvent")]

	/**
	 * Event broadcast when results have been loaded from the eBay servers
	 * in response to <code>getItem</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>EBayItem</code> object - an object containing the
	 * 			results from the GetItem API call.
	 * 		</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType com.adobe.webapis.ebay.events.EBayResultEvent.ON_GET_ITEM
	 * 
	 * @see #getItem()
	 * @see com.adobe.webapis.ebay.objects.EBayItem
	 */
	[Event(name="onGetItem", type="com.adobe.webapis.ebay.events.EBayResultEvent")]

	/**
	 * Event broadcast when results have been loaded from the eBay servers
	 * in response to <code>getMyEBayBuying</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>MyEBayBuyingItems</code> object - an object containing the
	 * 			results from the GetMyEBayBuying API call.
	 * 		</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType com.adobe.webapis.ebay.events.EBayResultEvent.ON_GET_MY_EBAY_BUYING
	 * 
	 * @see #getMyEBayBuying()
	 * @see com.adobe.webapis.ebay.results.MyEBayBuyingItems
	 */
	[Event(name="onGetMyEBayBuying", type="com.adobe.webapis.ebay.events.EBayResultEvent")]
	
	/**
	 * Event broadcast when results have been loaded from the eBay servers
	 * in response to <code>getSearchResults</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>SearchResults</code> object - an object containing
	 * 			the results from the GetSearchResults API call.
	 * 		</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType com.adobe.webapis.ebay.events.EBayResultEvent.ON_GET_SEARCH_RESULTS
	 * 
	 * @see #getSearchResults()
	 * @see com.adobe.webapis.ebay.objects.SearchResults
	 */
	[Event(name="onGetSearchResults", type="com.adobe.webapis.ebay.events.EBayResultEvent")]
	
	/**
	 * Event broadcast when results have been loaded from the eBay servers
	 * in response to <code>getUser</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>EBayUser</code> object - an object containing the
	 * 			results from the GetUser API call.
	 * 		</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType com.adobe.webapis.ebay.events.EBayResultEvent.ON_GET_USER
	 * 
	 * @see #getUser()
	 * @see com.adobe.webapis.ebay.objects.EBayUser
	 */
	[Event(name="onGetUser", type="com.adobe.webapis.ebay.events.EBayResultEvent")]
	
	/**
	 * Event broadcast when results have been loaded from the eBay servers
	 * in response to <code>placeOffer</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>PlaceOfferResult</code> object - an object containing the
	 * 			results from the PlaceOffer API call.
	 * 		</li>
	 * 	</ul>
	 * </p>
	 * 
	 * @eventType com.adobe.webapis.ebay.events.EBayResultEvent.ON_PLACE_OFFER
	 * 
	 * @see #placeOffer()
	 * @see com.adobe.webapis.ebay.objects.PlaceOfferResult
	 */
	[Event(name="onPlaceOffer", type="com.adobe.webapis.ebay.events.EBayResultEvent")]
	
	/**
	 * Event broadcast when results have been loaded from the eBay servers
	 * in response to <code>removeFromWatchList</code> being called.
	 * 
	 * <p>The event contains the following properties:
	 * 	<ul>
	 * 		<li><code>AddOrRemoveFromWatchListResult</code> object - an object containing
	 * 			the results from the RemoveFromWatchList API call.
	 * 		</li>
	 * </p>
	 * 
	 * @eventType com.adobe.webapis.ebay.events.EBayResultEvent.ON_REMOVE_FROM_WATCH_LIST
	 * 
	 * @see #removeFromWatchList()
	 * @see com.adobe.webapis.ebay.objects.AddOrRemoveFromWatchListResult
	 */
	[Event(name="onRemoveFromWatchList", type="com.adobe.webapis.ebay.events.EBayResultEvent")]


	/**
	 * Class that provides an ActionScript 3.0 interface to the remote
	 * eBay XML API (version 483).
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Charles Bihis, Adobe Systems Incorporated
	 * 
	 * @see http://developer.ebay.com/
	 * @see http://developer.ebay.com/DevZone/XML/docs/PDF/eBayXMLAPIGuide.pdf
	 */
	public class EBayService extends URLLoaderBase
	{
		private var headerDevName:URLRequestHeader = new URLRequestHeader("X-EBAY-API-DEV-NAME", AuthAndAuth.apiDevName);
		private var headerAppName:URLRequestHeader = new URLRequestHeader("X-EBAY-API-APP-NAME", AuthAndAuth.apiAppName);
		private var headerCertName:URLRequestHeader = new URLRequestHeader("X-EBAY-API-CERT-NAME", AuthAndAuth.apiCertName);
		private var headerContentType:URLRequestHeader = new URLRequestHeader("Content-Type", AuthAndAuth.CONTENT_TYPE);
		private var headerComLevel:URLRequestHeader = new URLRequestHeader("X-EBAY-API-COMPATIBILITY-LEVEL", AuthAndAuth.API_COM_LEVEL);
		private var headerSiteID:URLRequestHeader = new URLRequestHeader("X-EBAY-API-SITEID", AuthAndAuth.API_SITEID);
		private var headerCallName:URLRequestHeader;
		private var loader:URLLoader;
		private var apiRequest:URLRequest;
		private var ebayResultEvent:EBayResultEvent;
		
		public static const ADD_TO_WATCH_LIST:String = "AddToWatchList";
		public static const GET_ITEM:String = "GetItem";
		public static const GET_MY_EBAY_BUYING:String = "GetMyeBayBuying";
		public static const GET_SEARCH_RESULTS:String = "GetSearchResults";
		public static const GET_USER:String = "GetUser";
		public static const PLACE_OFFER:String = "PlaceOffer";
		public static const REMOVE_FROM_WATCH_LIST:String = "RemoveFromWatchList";
		

		/**
		 * Constructor for the EBayService class.
		 * 
		 * <p>Creates a new EBayService object.</p>
		 */
		public function EBayService()
		{
		}  // EBayService
		
		
		/**
		 * Adds an item with the specified item ID to the users watchlist.
		 * 
		 * <p>Creates and dispatches an <code>EBayResultEvent</code> event of type
		 * <code>onAddToWatchList</code> for the user to catch signifying that the results 
		 * have been returned from the eBay servers.  The result event contains an 
		 * <code>AddOrRemoveFromWatchListResult</code> object, an object containing the results
		 * from the AddToWatchList API call.</p>
		 * 
		 * @param itemID The item ID of the item to be added to the users watchlist.
		 * 
		 * @see #event:onAddToWatchList 
		 * @see com.adobe.webapis.ebay.results.AddOrRemoveFromWatchListResult 
		 */
		public function addToWatchList(itemID:String):void
		{
			headerCallName = new URLRequestHeader("X-EBAY-API-CALL-NAME", ADD_TO_WATCH_LIST);
		
			apiRequest = AuthAndAuth.request;
			apiRequest.requestHeaders.push(headerCallName);
			apiRequest.data = '<?xml version="1.0" encoding="utf-8" ?>'
							 + '<AddToWatchListRequest xmlns="urn:ebay:apis:eBLBaseComponents">'
							 + '	<RequesterCredentials><eBayAuthToken>' + AuthAndAuth.apiAuthToken + '</eBayAuthToken></RequesterCredentials>'
							 + '	<ItemID>' + itemID + '</ItemID>'
							 + '	<DetailLevel>ReturnAll</DetailLevel>'
							 + '</AddToWatchListRequest>';
			
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onAddToWatchList);
			loader.load(apiRequest);
		}  // addToWatchList
		

		/**
		 * Event handler for AddToWatchList API call.
		 */
		private function onAddToWatchList(event:Event):void
		{
			var addToWatchListResult:AddOrRemoveFromWatchListResult = EBayResultParser.parseAddOrRemoveFromWatchListResult(XML(loader.data));
			
			ebayResultEvent = new EBayResultEvent(EBayResultEvent.ON_ADD_TO_WATCH_LIST);
			ebayResultEvent.data = addToWatchListResult;
			dispatchEvent(ebayResultEvent);
		}  // onAddToWatchList
		

		/**
		 * Retrieves information of the item with the specified item ID.
		 * 
		 * <p>Creates and dispatches an <code>EBayResultEvent</code> event of type
		 * <code>onGetItem</code> for the user to catch signifying that the results 
		 * have been returned from the eBay servers.  The result event contains an 
		 * <code>EBayItem</code> object, an object containing the information of the
		 * specified object.</p>
		 * 
		 * @param itemID The item ID of the item for which information to retrieve.
		 * 
		 * @see #event:onGetItem 
		 * @see com.adobe.webapis.ebay.results.EBayItem
		 */
		public function getItem(itemID:String):void
		{
			headerCallName = new URLRequestHeader("X-EBAY-API-CALL-NAME", GET_ITEM);
		
			apiRequest = AuthAndAuth.request;
			apiRequest.requestHeaders.push(headerCallName);
			apiRequest.data = '<?xml version="1.0" encoding="utf-8" ?>'
							 + '<GetItemRequest xmlns="urn:ebay:apis:eBLBaseComponents">'
							 + '	<RequesterCredentials><eBayAuthToken>' + AuthAndAuth.apiAuthToken + '</eBayAuthToken></RequesterCredentials>'
							 + '	<ItemID>' + itemID + '</ItemID>'
							 + '	<DetailLevel>ReturnAll</DetailLevel>'
							 + '</GetItemRequest>';
			
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onGetItem);
			loader.load(apiRequest);
		}  // getItem
		

		/**
		 * Event handler for GetItem API call.
		 */
		private function onGetItem(event:Event):void
		{
			var ebayItem:EBayItem = EBayResultParser.parseEBayItem(XML(loader.data));
			
			ebayResultEvent = new EBayResultEvent(EBayResultEvent.ON_GET_ITEM);
			ebayResultEvent.data = ebayItem;
			dispatchEvent(ebayResultEvent);
		}  // onGetItem
		

		/**
		 * Returns a users "My eBay Buying" items (i.e. WatchList items, LostList items, 
		 * and BidList items).
		 * 
		 * <p>Creates and dispatches an <code>EBayResultEvent</code> event of type
		 * <code>onGetMyEBayBuying</code> for the user to catch signifying that the results
		 * have been returned from the eBay servers.  The result event contains a
		 * <code>MyeBayBuyingItems</code> object, an object containing the WatchList items, 
		 * LostList items, and BidList items of the authenticated user.</p>
		 * 
		 * @see #event:onGetMyEBayBuying
		 * @see com.adobe.webapis.ebay.results.MyEBayBuyingItems
		 */
		public function getMyEBayBuying():void
		{
			headerCallName = new URLRequestHeader("X-EBAY-API-CALL-NAME", GET_MY_EBAY_BUYING);
		
			apiRequest = AuthAndAuth.request;
			apiRequest.requestHeaders.push(headerCallName);
			apiRequest.data = '<?xml version="1.0" encoding="utf-8" ?>'
							 + '<GetMyeBayBuyingRequest xmlns="urn:ebay:apis:eBLBaseComponents">'
							 + '	<RequesterCredentials><eBayAuthToken>' + AuthAndAuth.apiAuthToken + '</eBayAuthToken></RequesterCredentials>'
							 + '	<Version>' + AuthAndAuth.API_COM_LEVEL + '</Version>'
							 + '	<DetailLevel>ReturnAll</DetailLevel>'
							 + '	<WatchList>'
							 + '		<Sort>TimeLeft</Sort>'
							 + '		<IncludeNotes>true</IncludeNotes>'
							 + '	</WatchList>'
							 + '	<BidList>'
							 + '		<Sort>TimeLeft</Sort>'
							 + '		<IncludeNotes>true</IncludeNotes>'
							 + '	</BidList>'
							 + '</GetMyeBayBuyingRequest>';
			
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onGetMyEBayBuying);
			loader.load(apiRequest);
		}  // getMyEBayBuying
		

		/**
		 * Event handler for GetMyEBayBuying API call.
		 */
		private function onGetMyEBayBuying(event:Event):void
		{
			var myEBayBuyingItems:MyEBayBuyingItems = EBayResultParser.parseMyEBayBuyingItems(XML(loader.data));
			
			ebayResultEvent = new EBayResultEvent(EBayResultEvent.ON_GET_MY_EBAY_BUYING);
			ebayResultEvent.data = myEBayBuyingItems;
			dispatchEvent(ebayResultEvent);
		}  // onGetMyEBayBuying
		

		/**
		 * Retrieves the search results using the specified query across all categories.
		 * 
		 * <p>Creates and dispatches an <code>EBayResultEvent</code> event of type
		 * <code>onGetSearchResults</code> for the user to catch signifying that the results
		 * have been returned from the eBay servers.  The result event contains a 
		 * <code>SearchResults</code> object, an object containing the results from
		 * the GetSearchResults API call.</p>
		 * 
		 * @param query The search query.
		 * 
		 * @see #event:onGetSearchResults
		 * @see com.adobe.webapis.ebay.results.SearchResults
		 */
		public function getSearchResults(query:String):void
		{	
			headerCallName = new URLRequestHeader("X-EBAY-API-CALL-NAME", GET_SEARCH_RESULTS);
		
			apiRequest = AuthAndAuth.request;	
			apiRequest.requestHeaders.push(headerCallName);
			apiRequest.data = '<?xml version="1.0" encoding="utf-8" ?>'
							 + '<GetSearchResultsRequest xmlns="urn:ebay:apis:eBLBaseComponents">'
							 + '	<RequesterCredentials><eBayAuthToken>' + AuthAndAuth.apiAuthToken + '</eBayAuthToken></RequesterCredentials>'
							 + '	<Query>' + query + '</Query>'
							 + '	<DetailLevel>ReturnAll</DetailLevel>'
							 + '</GetSearchResultsRequest>';
			
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onGetSearchResults);
			loader.load(apiRequest);
		}  // getSearchResults
		

		/**
		 * Event handler for the GetSearchResults API call.
		 */
		private function onGetSearchResults(event:Event):void
		{
			var searchResults:SearchResults = EBayResultParser.parseSearchResults(XML(loader.data));
			
			ebayResultEvent = new EBayResultEvent(EBayResultEvent.ON_GET_SEARCH_RESULTS);
			ebayResultEvent.data = searchResults;
			dispatchEvent(ebayResultEvent);
		}  // onGetSearchResults
		

		/**
		 * Retrieves the information of the user with the specified user ID.
		 * 
		 * <p>Creates and dispatches an <code>EBayResultEvent</code> event of type 
		 * <code>onGetUser</code> for the user to catch signifying that the results 
		 * have been returned from the eBay servers.  The result event contains an 
		 * <code>EBayUser</code> object, an object containing the information of the 
		 * specified user.</p>
		 * 
		 * @param userID The user ID of the user whose information to retrieve.
		 * 
		 * @see #event:onGetUser
		 * @see com.adobe.webapis.ebay.results.EBayUser
		 */
		public function getUser(userID:String):void
		{
			headerCallName = new URLRequestHeader("X-EBAY-API-CALL-NAME", GET_USER);
		
			apiRequest = AuthAndAuth.request;
			apiRequest.requestHeaders.push(headerCallName);
			apiRequest.data = '<?xml version="1.0" encoding="utf-8" ?>'
							+ '<GetUser xmlns="urn:ebay:apis:eBLBaseComponents">'
							+ '	<RequesterCredentials><eBayAuthToken>' + AuthAndAuth.apiAuthToken + '</eBayAuthToken></RequesterCredentials>'
							+ '	<Version>' + AuthAndAuth.API_COM_LEVEL + '</Version>'
							+ '	<UserID>' + userID + '</UserID>'
							+ '</GetUser>';
			
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onGetUser);
			loader.load(apiRequest);
		}  // getUser
		

		/**
		 * Event handler for the GetUser API call.
		 */
		private function onGetUser(event:Event):void
		{
			var ebayUser:EBayUser = EBayResultParser.parseEBayUser(XML(loader.data));
			
			ebayResultEvent = new EBayResultEvent(EBayResultEvent.ON_GET_USER);
			ebayResultEvent.data = ebayUser;
			dispatchEvent(ebayResultEvent);
		}  // onGetUser

		
		/**
		 * Places a maximum bid on a particular eBay item.
		 * 
		 * <p>Creates and dispatches an <code>EBayResultEvent</code> event of type
		 * <code>onPlaceOffer</code> for the user to catch signifying that the results
		 * have been returned from the eBay servers.  The result event contains a
		 * <code>PlaceOfferResult</code> object, an object containing the results from
		 * PlaceOffer API call.</p>
		 * 
		 * @param itemID The item ID of the item for which to place the bid.
		 * @param maxBid The max bidding amount of the bid.
		 * 
		 * @see #event:onPlaceOffer
		 * @see com.adobe.webapis.ebay.results.PlaceOfferResult
		 */		
		public function placeOffer(itemID:String, maxBid:String):void
		{
			headerCallName = new URLRequestHeader("X-EBAY-API-CALL-NAME", PLACE_OFFER);

			apiRequest = AuthAndAuth.request;
			apiRequest.requestHeaders.push(headerCallName);
			apiRequest.data = '<?xml version="1.0" encoding="utf-8" ?>'
							 + '<PlaceOfferRequest xmlns="urn:ebay:apis:eBLBaseComponents">'
							 + '	<RequesterCredentials><eBayAuthToken>' + AuthAndAuth.apiAuthToken + '</eBayAuthToken></RequesterCredentials>'
							 + '	<Version>' + AuthAndAuth.API_COM_LEVEL + '</Version>'
							 + '	<ItemID>' + itemID + '</ItemID>'
							 + '	<Offer>'
							 + '	<Action>Bid</Action>'
							 + '		<MaxBid currencyID="USD">' + maxBid + '</MaxBid>'
							 + '		<Quantity>1</Quantity>'
							 + '	</Offer>'
							 + '	<EndUserIP>' + AuthAndAuth.endUserIP + '</EndUserIP>'
							 + '</PlaceOfferRequest>';
			
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onPlaceOffer);
			loader.load(apiRequest);
		}  // placeOffer
		

		/**
		 * Event handler for the PlaceOffer API call.
		 */
		private function onPlaceOffer(event:Event):void
		{
			var offer:PlaceOfferResult = EBayResultParser.parsePlaceOfferResult(XML(loader.data));
			
			ebayResultEvent = new EBayResultEvent(EBayResultEvent.ON_PLACE_OFFER);
			ebayResultEvent.data = offer;
			dispatchEvent(ebayResultEvent);
		}  // onPlaceOffer


		/**
		 * Removes an item with the specified item ID from the users watchlist.
		 * 
		 * <p>Creates and dispatches an <code>EBayResultEvent</code> event of type
		 * <code>onRemoveFromWatchList</code> for the user to catch signifying that the
		 * results have been returned from the eBay servers.  The result event contains an
		 * <code>AddOrRemoveFromWatchListResult</code> object, an object containing the results
		 * from the RemoveFromWatchList API call.</p>
		 * 
		 * @param itemID The item ID of the item to be removed from the users watchlist.
		 * 
		 * @see #event:onRemoveFromWatchList
		 * @see com.adobe.webapis.ebay.results.AddOrRemoveFromWatchListResult
		 */		
		public function removeFromWatchList(itemID:String):void
		{
			headerCallName = new URLRequestHeader("X-EBAY-API-CALL-NAME", REMOVE_FROM_WATCH_LIST);
		
			apiRequest = AuthAndAuth.request;
			apiRequest.requestHeaders.push(headerCallName);
			apiRequest.data = '<?xml version="1.0" encoding="utf-8" ?>'
							 + '<RemoveFromWatchList xmlns="urn:ebay:apis:eBLBaseComponents">'
							 + '	<RequesterCredentials><eBayAuthToken>' + AuthAndAuth.apiAuthToken + '</eBayAuthToken></RequesterCredentials>'
							 + '	<ItemID>' + itemID + '</ItemID>'
							 + '	<DetailLevel>ReturnAll</DetailLevel>'
							 + '</RemoveFromWatchList>';
			
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onRemoveFromWatchList);
			loader.load(apiRequest);
		}  // removeFromWatchList
		

		/**
		 * Event handler for the RemoveFromWatchList API call.
		 */
		private function onRemoveFromWatchList(event:Event):void
		{
			var removeFromWatchListResult:AddOrRemoveFromWatchListResult = EBayResultParser.parseAddOrRemoveFromWatchListResult(XML(loader.data));
			
			ebayResultEvent = new EBayResultEvent(EBayResultEvent.ON_REMOVE_FROM_WATCH_LIST);
			ebayResultEvent.data = removeFromWatchListResult;
			dispatchEvent(ebayResultEvent);
		}  // onRemoveFromWatchList
	}  // class declaration
}  // package