package ebayApp.services.commands.finding
{
	import dto.PaginationInput;
	import dto.EbayServiceRequestObject;
	
	import ebayApp.services.EbayServiceAbstract;
	import ebayApp.services.FindingServiceGET;
	import ebayApp.services.IEbayService;
	import ebayApp.services.commands.EbayCommand;

	public class FindCompletedItemsCommand extends EbayCommand
	{
		public static const OPERATION_NAME : String = FindingServiceOperationName.FIND_COMPLETED_ITEMS;
		public static const RESPONSE_EVENT_NAME : String = "findCompletedItemsResponse";
		
		public function FindCompletedItemsCommand( service : IEbayService )
		{
			super(service);
			//this.service.addEventListener( FindingServiceOperationName.FIND_COMPLETED_ITEMS, commandCallHandler );
			this.service.addEventListener( RESPONSE_EVENT_NAME, serviceResultHandler );
		}
		
		
		override public function getOperationName():String
		{
			return OPERATION_NAME;
		}

		override protected function getFullUrl(requestObj : EbayServiceRequestObject = null ):String
		{

			var keywords : String = "mobile";
			
			var paginationInput:PaginationInput = new PaginationInput();
			paginationInput.entriesPerPage = 4;
			paginationInput.pageNumber = 1;
			
			var url:String = FindingServiceGET.SEARCH_URL + "/?";
			url += "OPERATION-NAME=" + FindingServiceOperationName.FIND_COMPLETED_ITEMS;
			url += "&SERVICE-VERSION=1.0.0";
			url += "&SECURITY-APPNAME=" + EbayServiceAbstract.apiAppName;
			url += "&keywords=" + keywords; 
			if ( paginationInput )
			{
				url += "&paginationInput.entriesPerPage=" + paginationInput.entriesPerPage;
				url += "&paginationInput.pageNumber=" + paginationInput.pageNumber;
			}
			
			
			return url;
		}
	}
}