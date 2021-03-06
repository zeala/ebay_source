package model
{
	import com.ebayproject.events.CategoryEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class BootstrapController extends EventDispatcher
	{
		private var _productManager : ProductManager;
		public function get productManager():ProductManager
		{
			return _productManager;
		}
		public function set productManager(val : ProductManager ) : void
		{
			_productManager = val;
			_productManager.addEventListener( ProductManager.CATEGORIES_CHANGE, categoriesChangeHandler );
			requestCategories();
		}
		
		
		public function BootstrapController()
		{
			init();
		}
		
		private function init():void
		{
			this.productManager = ProductManager.getInstance();
			
			if ( productManager.categories == null || productManager.categories.length == 0)
			{
				var catEvent : CategoryEvent = new CategoryEvent(
					CategoryEvent.REQUEST_CHILD_CATEGORIES, "-1");
				EbayMainViewPM.getInstance().requestCategoriesHandler( catEvent );
			}
		}
		
		private function categoriesChangeHandler(event:Event):void
		{
			if (!productManager) return;
			if ( productManager.categories == null || productManager.categories.length == 0 ) return;
			
		}
		
		private function requestCategories():void
		{
			
			if ( !productManager )
			{
				throw new Error(" No product manager ");
			}
			if ( productManager.categories == null || productManager.categories.length == 0)
			{
				var catEvent : CategoryEvent = new CategoryEvent(
					CategoryEvent.REQUEST_CHILD_CATEGORIES, "-1");
				dispatchEvent( catEvent );
			}
		}
	}
}