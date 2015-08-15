package ebayApp.services.commands.shopping
{
	import dto.EbayServiceRequestObject;
	
	import ebayApp.services.EbayServiceAbstract;
	import ebayApp.services.IEbayService;
	import ebayApp.services.ShoppingServiceGET;
	import ebayApp.services.commands.EbayCommand;
	
	public class FindPopularSearchesCommand extends EbayCommand
	{
		public static const OPERATION_NAME : String = ShoppingServiceOperationName.FIND_POPULAR_SEARCHES;
		public static const RESPONSE_EVENT_NAME : String = "FindPopularSearchesResponse";
		
		
		public function FindPopularSearchesCommand(service:IEbayService)
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
			url += "&MaxKeywords=" + 40;
			url += "&QueryKeywords=" + "mobile";
			
			return url;
		}
	}
}