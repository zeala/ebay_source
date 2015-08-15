package model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.SharedObject;
	
	import mx.collections.ArrayCollection;
	
	import dto.SearchResultItem;
	
	public class SharedObjectController extends EventDispatcher
	{
		public static const FAVORITES_CHANGE : String = "favoritesChange";
		
		//------------------------------
		// shared object
		//------------------------------
		public var so : SharedObject;
		
		//------------------------------
		// instance
		//------------------------------
		private static var instance : SharedObjectController;
		
		//------------------------------
		//  favorites
		//------------------------------
		private var _favorites : ArrayCollection;
		
		[Bindable("favoritesChange")]
		public function get favorites():ArrayCollection
		{
			return _favorites;
		}
		
		public function set favorites(val:ArrayCollection ) : void
		{
			_favorites = val;
			dispatchEvent( new Event( FAVORITES_CHANGE ));
		}
		
		
		public static function getInstance():SharedObjectController
		{
			if ( !instance)
			{
				instance = new SharedObjectController()
			}
			
			return instance;
		}
		
		public function SharedObjectController()
		{
			init();
		}
		
		private function init():void
		{
			so = SharedObject.getLocal("ebayApp");
		}
		
		
		//-------------------------------------------------------------------------------------
		//
		// PUBLIC METHODS
		//
		//-------------------------------------------------------------------------------------
		
		public function addToFavorites( val : SearchResultItem ) : void
		{
			if (!favorites )
			{
				favorites = new ArrayCollection();
			}
			
			if ( favorites.contains( val )) return ;
			
			favorites.addItem( val );
			
			dispatchEvent( new Event ( FAVORITES_CHANGE ));
		}
		
		public function removeFromFavorites ( val : SearchResultItem ) : void
		{
			if ( !favorites ) return;
			for ( var i : int = 0; i < favorites.length; i++)
			{
				if ( val.itemId = SearchResultItem(favorites[i]).itemId )
				{
					favorites.removeItemAt(i);
					dispatchEvent( new Event( FAVORITES_CHANGE ));
					return;
				}
			}
		}
		
	}
}