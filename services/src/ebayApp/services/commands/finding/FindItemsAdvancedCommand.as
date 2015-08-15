package ebayApp.services.commands.finding
{
	import dto.EbayServiceRequestObject;
	import dto.PaginationInput;
	
	import ebayApp.services.EbayServiceAbstract;
	import ebayApp.services.FindingServiceGET;
	import ebayApp.services.IEbayService;
	import ebayApp.services.commands.EbayCommand;
	
	public class FindItemsAdvancedCommand extends EbayCommand
	{
		public static const OPERATION_NAME : String = FindingServiceOperationName.FIND_ITEMS_ADVANCED;
		public static const RESPONSE_EVENT_NAME : String = "findItemsAdvancedResponse";
		
		public function FindItemsAdvancedCommand(service:IEbayService)
		{
			super(service);
			this.service.addEventListener( RESPONSE_EVENT_NAME, serviceResultHandler );
		}
		
		override public function getOperationName():String
		{
			return OPERATION_NAME;
		}
		
		override protected function getFullUrl(requestObj : EbayServiceRequestObject = null ):String
		{
			
			var keywords : String = requestObj.queryKeywords;
			
			var paginationInput:PaginationInput = new PaginationInput();
			paginationInput.entriesPerPage = 40;
			paginationInput.pageNumber = requestObj.pageNumber > 0 ? requestObj.pageNumber : 1;
			
			var url:String = FindingServiceGET.SEARCH_URL + "/?";
			url += "OPERATION-NAME=" + FindingServiceOperationName.FIND_ITEMS_ADVANCED;
			if ( requestObj.globalId )
			{
				url += "&GLOBAL-ID=" + requestObj.globalId;
			}
			else
			{
				throw new Error(" No site id specified ");
			}
			url += "&SERVICE-VERSION=1.0.0";
			url += "&SECURITY-APPNAME=" + EbayServiceAbstract.apiAppName;
			if ( keywords )
			{	
				url += "&keywords=" + keywords; 
			}
			if ( requestObj.categoryId != "-1")
			{
				url += "&categoryId=" + requestObj.categoryId;
			}
			url += "&outputSelector[0]=GalleryInfo";
			url += "&outputSelector[1]=PictureURLLarge";
			url += "&outputSelector[2]=PictureURLSuperSize";
			url += "&outputSelector[3]=CategoryHistogram";
			if ( paginationInput )
			{
				url += "&paginationInput.entriesPerPage=" + paginationInput.entriesPerPage;
				url += "&paginationInput.pageNumber=" + paginationInput.pageNumber;
			}
			
			if ( requestObj.sortOrder )
			{
				url += "&sortOrder=" + requestObj.sortOrder;
			}
			
			/*url += "&itemFilter(0).name=HideDuplicateItems";
			url += "&itemFilter(0).value=true";*/
			for ( var i : int = 0; i < requestObj.itemFilers.length; i++)
			{
				url += "&itemFilter(" + i + ").name=" + requestObj.itemFilers[i].name;
				url += "&itemFilter(" + i + ").value=" + requestObj.itemFilers[i].value;
			}
			
			trace("\n findItemsAdvancedURL " + url );
			return url;
		}
	}
}