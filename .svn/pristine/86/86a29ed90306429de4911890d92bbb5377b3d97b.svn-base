package ebayApp.services
{
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;

	public class MerchandisingServiceGet extends EbayServiceAbstract
	{
		
		public static const ROOT_URL : String = "http://svcs.ebay.com/MerchandisingService?";
		
		private static var instance : MerchandisingServiceGet;
		
		public static function getInstance():MerchandisingServiceGet
		{
			if ( !instance)
			{
				instance = new MerchandisingServiceGet();
			}
			return instance;
		}
		
		public function MerchandisingServiceGet()
		{
			initService();
		}
		
		override protected function initService():void
		{
			this.method = "GET";
			this.resultFormat = "e4x";
			super.initService();
			
		}
		
		//--------------------------------------------------------------------------
		//
		// EVENT HANDLERS OVERRIDES
		//
		//--------------------------------------------------------------------------
		override protected function faultHandler(event:FaultEvent):void
		{
			var faultObj : Fault = event.fault;
			var content: XML = faultObj.content as XML;
			
			trace("\n content : " + content );
		}
		
		override protected function isFailed(resultXML:XML):Boolean
		{
			var failed : Boolean;
			
			trace("\n isFailed resultobj : " + resultXML );
			return failed
		}
	}
}