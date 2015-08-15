package ebayApp.services.commands.shopping
{
	import dto.EbayServiceRequestObject;
	import dto.codeTypes.IncludeSelectors;
	
	import ebayApp.services.EbayServiceAbstract;
	import ebayApp.services.IEbayService;
	import ebayApp.services.ShoppingServiceGET;
	import ebayApp.services.commands.EbayCommand;
	
	public class FindProductsCommand extends EbayCommand
	{
		public static const OPERATION_NAME : String = ShoppingServiceOperationName.FIND_PRODUCTS;
		public static const RESPONSE_EVENT_NAME : String = "FindProductsResponse";
		
		public function FindProductsCommand(service:IEbayService)
		{
			super(service);
	 	}
		
		//--------------------------------------------------------------------------
		//
		// OVERRIDES
		//
		//--------------------------------------------------------------------------
		
		
		override public function getOperationName():String
		{
			return OPERATION_NAME;
		}
		
		
		override protected function getFullUrl(requestObj : EbayServiceRequestObject = null ):String
		{
			var url : String;
			
			url = ShoppingServiceGET.SHOPPING_URL;
			url += "callname=" + OPERATION_NAME;
			url += "&version=" + ShoppingServiceGET.version;
			url += "&appid=" + EbayServiceAbstract.apiAppName;
			url += "&siteid=" + ShoppingServiceGET.siteId;
			url += "&MessageID=" + "some message id";
			url += "&IncludeSelector=" + IncludeSelectors.SELLER_INFO;
			url += "&AvailableItemsOnly=" + "true";
			url += "&HideDuplicateItems=" + "true";
			url += "&QueryKeywords=" + "iPhone";
			url += "&MaxEntries=" + 20;

			return url;
		}
	}
}