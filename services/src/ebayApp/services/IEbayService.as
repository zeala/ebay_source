package ebayApp.services
{
	import flash.events.IEventDispatcher;

	public interface IEbayService extends IEventDispatcher
	{
		
		function callService( urlWithParams : String):void;
	}
}