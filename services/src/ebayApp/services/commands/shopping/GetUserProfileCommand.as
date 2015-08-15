package ebayApp.services.commands.shopping
{
	import dto.EbayServiceRequestObject;
	import dto.codeTypes.IncludeSelectors;
	
	import ebayApp.services.EbayServiceAbstract;
	import ebayApp.services.IEbayService;
	import ebayApp.services.ShoppingServiceGET;
	import ebayApp.services.commands.EbayCommand;
	
	public class GetUserProfileCommand extends EbayCommand
	{
		public static const OPERATION_NAME : String = ShoppingServiceOperationName.GET_USER_PROFILE;
		public static const RESPONSE_EVENT_NAME : String = "GetUserProfileResponse";

		
		public function GetUserProfileCommand(service:IEbayService)
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
			url += "&IncludeSelector=" + IncludeSelectors.FEEDBACK_DETAILS + "," + IncludeSelectors.FEEDBACK_HISTORY;
			url += "&UserID=" + "shoes154";
			url += "&MessageID=" + "getUserProfile request";
			return url;
		}
	}
}