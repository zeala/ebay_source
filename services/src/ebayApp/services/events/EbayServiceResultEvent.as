package ebayApp.services.events
{
	import flash.events.Event;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	public class EbayServiceResultEvent extends ResultEvent
	{
		public var resultObj : *;
		public var asyncToken : AsyncToken;
		
		public function EbayServiceResultEvent( type : String, resultObj : * = null , token : AsyncToken = null )
		{
			this.resultObj = resultObj;
			this.asyncToken = token; 
			super(type, false, true, resultObj, token );
		}
		
		override public function clone():Event
		{
			return new EbayServiceResultEvent(
				type, this.resultObj, this.asyncToken);
		}
	}
}