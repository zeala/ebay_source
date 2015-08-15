package ebayApp.services.commands.shopping
{
	import dto.EbayServiceRequestObject;
	
	import ebayApp.services.EbayServiceAbstract;
	import ebayApp.services.IEbayService;
	import ebayApp.services.ShoppingServiceGET;
	import ebayApp.services.commands.EbayCommand;
	
	public class FindReviewsAndGuidesCommand extends EbayCommand
	{
		public static const OPERATION_NAME : String = ShoppingServiceOperationName.FIND_REVIEWS_AND_GUIDES;
		public static const RESPONSE_EVENT_NAME : String = "FindReviewsAndGuidesResponse";
		
		public function FindReviewsAndGuidesCommand(service:IEbayService)
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
			
			
			return url;
		}
	}
}