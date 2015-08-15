package ebayApp.services.commands
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import dto.EbayServiceRequestObject;
	
	import ebayApp.services.IEbayService;
	import ebayApp.services.events.EbayServiceResultEvent;

	public class EbayCommand extends EventDispatcher
	{
		
		public var service:IEbayService;
		
		public function EbayCommand( service:IEbayService = null )
		{
			this.service = service;
			//this.service.addEventListener( FindingServiceOperationName.FIND_COMPLETED_ITEMS, callServiceHandler );
		}
		
		public function execute( requestObj : EbayServiceRequestObject ):void
		{
			commandCallHandler( requestObj );
		}
		
		protected function serviceResultHandler(event:EbayServiceResultEvent):void
		{
			dispatchEvent( event );
		}
		
		protected function commandCallHandler ( requestObj : EbayServiceRequestObject, event : Event = null ) : void
		{
			service.callService( getFullUrl( requestObj ) );
		}
		
		
		protected function getFullUrl( requestObj : EbayServiceRequestObject = null):String
		{
			throw new Error("abstract method ");
		}
		
		public function getOperationName():String
		{
			throw new Error("abstract method ");
		}
	}
}