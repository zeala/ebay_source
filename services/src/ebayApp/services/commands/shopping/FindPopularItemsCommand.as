package ebayApp.services.commands.shopping
{
	import dto.EbayServiceRequestObject;
	
	import ebayApp.services.EbayServiceAbstract;
	import ebayApp.services.IEbayService;
	import ebayApp.services.ShoppingServiceGET;
	import ebayApp.services.commands.EbayCommand;
	
	public class FindPopularItemsCommand extends EbayCommand
	{
		public static const OPERATION_NAME : String = ShoppingServiceOperationName.FIND_POPULAR_ITEMS;
		public static const RESPONSE_EVENT_NAME : String = "FindPopularItemsResponse";
		
		
		public function FindPopularItemsCommand(service:IEbayService=null)
		{
			this.service = ShoppingServiceGET.getInstance();
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
			url += "&QueryKeywords=" + "best";
			url += "&MaxEntries=" + 10;
			
			return url;
		}
	}
}