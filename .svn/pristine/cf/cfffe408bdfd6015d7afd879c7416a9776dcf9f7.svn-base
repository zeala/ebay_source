package model
{
	import com.ebayproject.controllers.ISearchBuilderController;
	import com.ebayproject.dto.ICategory;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	public class SearchBuilderController extends EventDispatcher implements ISearchBuilderController
	{
		
		public static const KEYWORDS_CHANGE : String = "keywordsChange";
		public static const CATEGORY_CHANGE : String = "categoriesChange";
		
		private static var instance:SearchBuilderController;
		public static function getInstance():SearchBuilderController
		{
			if ( !instance)
			{
				instance = new SearchBuilderController();
			}
			return instance;
		}
		
		//-------------------------------
		// keywords
		//-------------------------------
		private var _keywords : ArrayCollection;
		[Bindable("keywordsChange")]
		public function get keywords ():ArrayCollection
		{
			return _keywords;
		}
		public function set keywords(val:ArrayCollection):void
		{
			_keywords = val;
			dispatchEvent(new Event(KEYWORDS_CHANGE));
		}
		
		//--------------------------------
		// categories
		//--------------------------------
		private var _categories : ArrayCollection;
		[Bindable("categoriesChange")]
		public function get categories():ArrayCollection
		{
			return _categories;
		}
		public function set categories(val:ArrayCollection):void
		{
			_categories = val;
			dispatchEvent( new Event(CATEGORY_CHANGE ));
		}
		
		//----------------------------------------------------------------------------------------
		//
		// PUBLIC METHODS
		//
		//----------------------------------------------------------------------------------------
		
		public function addKeyword(val:String):void
		{
			if (!keywords )
			{
				keywords = new ArrayCollection();
			}
			
			if ( keywords.contains( val ) ) return;
			keywords.addItem( val );
			
			dispatchEvent( new Event(KEYWORDS_CHANGE ));
		}
		
		public function removeKeyword (val : String):void
		{
			if ( !keywords ) return;
			
			for ( var i:int = 0; i < keywords.length; i++)
			{
				if ( keywords[i] == val ) 
				{
					keywords.removeItemAt(i);
					return;
				}
			}
		}
		
		public function addCategory(val:ICategory):void
		{
			if (!categories )
			{
				categories = new ArrayCollection();
			}
			
			if ( categories.contains( val ) ) return;
			categories.addItem( val );
			
			dispatchEvent( new Event(CATEGORY_CHANGE ));
		}
		
		public function removeCategory (val : ICategory ):void
		{
			if ( !categories ) return;
			
			for ( var i:int = 0; i < categories.length; i++)
			{
				if ( categories[i] == val ) 
				{
					categories.removeItemAt(i);
					return;
				}
			}
		}
		
	}
}