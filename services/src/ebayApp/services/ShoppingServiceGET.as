package ebayApp.services
{
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import ebayApp.services.events.EbayServiceResultEvent;

	public class ShoppingServiceGET extends EbayServiceAbstract implements IEbayService
	{
		
		public static var apiAuthToken:String = "";

		public static const SHOPPING_URL:String = "http://open.api.ebay.com/Shopping?";

		public static var version:String = "677";
		
		public static var siteId:String = "0";
		
		public static var categoryId : String = "-1";
		
		public static var includeSelector : String = "ChildCategories";
		
		private static var instance : ShoppingServiceGET;
		
		
		public static function getInstance():ShoppingServiceGET
		{
			if ( !instance )
			{
				instance = new ShoppingServiceGET()
			}
			return instance;
		}
		
		public function ShoppingServiceGET()
		{
			initService();
		}

		
		
		override protected function faultHandler(event:FaultEvent):void
		{
			var faultObj : Fault = event.fault;
			var content: XML = faultObj.content as XML;
			
			trace("\n content : " + content );
		}
		
		override protected function resultHandler(event:ResultEvent ) : void
		{
			var result:XML = event.result as XML;
			
			if ( isFailed( result ))
			{
				return
			}
			var commandResultEvent:EbayServiceResultEvent = new EbayServiceResultEvent( result.localName());
			commandResultEvent.resultObj = event.result;
			dispatchEvent( commandResultEvent );

		}
		
		override protected function isFailed(resultObj:XML):Boolean
		{
			
			var result : Boolean;
			trace("\n isFailed resultobj : " + resultObj );
			return result;
		}

	}
}