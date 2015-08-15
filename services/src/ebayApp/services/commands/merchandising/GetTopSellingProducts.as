package ebayApp.services.commands.merchandising
{
	import dto.EbayServiceRequestObject;
	
	import ebayApp.services.EbayServiceAbstract;
	import ebayApp.services.IEbayService;
	import ebayApp.services.MerchandisingServiceGet;
	import ebayApp.services.commands.EbayCommand;
	
	public class GetTopSellingProducts extends EbayCommand
	{
		public static const OPERATION_NAME : String = MerchandisingServiceOperationName.GET_TOP_SELLING_PRODUCTS;
		public static const RESPONSE_EVENT_NAME : String = "getTopSellingProductsResponse";
		
		
		public function GetTopSellingProducts(service:IEbayService=null)
		{
			this.service = MerchandisingServiceGet.getInstance();
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
			
			url = MerchandisingServiceGet.ROOT_URL;
			url += "OPERATION-NAME=" + OPERATION_NAME;
			url += "&SERVICE-NAME=" + "MerchandisingService";
			url += "SERVICE-VERSION=" + "1.1.0";
			url += "&CONSUMER-ID=" + EbayServiceAbstract.apiAppName;
			url += "&RESPONSE-DATA-FORMAT=" + "XML";
			url += "&REST-PAYLOAD";
			
			return url;
		}
	}
}