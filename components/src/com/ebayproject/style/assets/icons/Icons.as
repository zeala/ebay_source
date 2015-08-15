package com.ebayproject.style.assets.icons
{
	import flash.utils.Dictionary;
	
	import dto.codeTypes.Site;

	public class Icons
	{
		
		//--------------------------------------------------------------------------
		// Icons
		//--------------------------------------------------------------------------
		[Embed(source="zoomIn.png")]
		public static const ICON_ZOOM_IN : Class;
		
		[Embed(source="zoomIn16.png")]
		public static const ICON_ZOOM_IN_SMALL : Class;
		
		[Embed(source="favorite16.png")]
		public static const ICON_FAVORITE : Class;
		
		[Embed(source="info16.png")]
		public static const ICON_INFO : Class;
		
		[Embed(source="addBookmark.png")]
		public static const ADD_BOOKMARK : Class;
		
		[Embed(source="icon_watching.gif")]
		public static const ICON_WATCHING : Class;
		
		[Embed(source="list_view.jpg")]
		public static const LIST_VIEW : Class;
		
		[Embed(source="book_view.png")]
		public static const BOOK_VIEW :Class;
		
		[Embed(source="large_thumbnail_view.png")]
		public static const LARGE_THUMBNAIL_VIEW : Class;
		
		[Embed(source="small_thumbnail_view.png")]
		public static const SMALL_THUMBNAIL_VIEW : Class;
		
		[Embed(source="close.png")]
		public static const ICON_CLOSE_SMALL : Class;
		
		[Embed(source="sortDescending2.png")]
		public static const ICON_SORT_DESCENDING : Class;
		
		[Embed(source="ebay32.png")]
		public static const ICON_EBAY : Class;
		
		[Embed(source="../images/EBay_logo_small.png")]
		public static const EBAY_LOGO : Class;
		//==============================
		// search options icons
		//==============================
		
		[Embed(source="search16.png")]
		public static const ICON_SEARCH : Class;
		
		[Embed(source="documentTree.png")]
		public static const ICON_HIERARCHY_STRUCTURE : Class;
		
		[Embed(source="search24.png")]
		public static const ICON_SEARCH_24 : Class;
		
		[Embed(source="editSearch24.png")]
		public static const ICON_EDIT_SEARCH : Class;
		
		//--------------------------------------------------------------------------
		// misc graphics
		//--------------------------------------------------------------------------
		[Embed(source="green_bubble.png")]
		public static const GREEN_BUBBLE : Class;
		
		[Embed(source="separator.png")]
		public static const SEPARATOR : Class;
		
		[Embed(source="../images/imageNotAvailable.png")]
		public static const NO_IMAGE_AVAILABLE : Class;
		//--------------------------------------------------------------------------
		// Categories
		//--------------------------------------------------------------------------
		[Embed(source="art32.png")]
		public static const ART_CATEGORY : Class;
		
		[Embed(source="baby.jpg")]
		public static const BABY_CATEGORY : Class;
		
		[Embed(source="folder_green.png")]
		public static const FOLDER_GREEN : Class;
		
		//--------------------------------------------------------------------------
		// Flags
		//--------------------------------------------------------------------------
		[Embed(source="Australia.png")]
		public static const AUSTRALIA_FLAG : Class;
		
		[Embed(source="Canada.png")]
		public static const CANADA_FLAG : Class;
		
		[Embed(source="Ireland.png")]
		public static const IRELAND_FLAG : Class;
		
		[Embed(source="UK.png")]
		public static const UK_FLAG : Class;
		
		[Embed(source="USA.png")]
		public static const USA_FLAG : Class;
		
		public static const FLAG_MAP : Dictionary = buildFlagMap();
		
		private static function buildFlagMap():Dictionary
		{
			trace("\n australia flag : " + AUSTRALIA_FLAG );
			
			var map : Dictionary = new Dictionary();
			
			map[Site.AUSTRALIA] = AUSTRALIA_FLAG;
			map[Site.CANADA] = CANADA_FLAG;
			map[Site.IRELAND] = IRELAND_FLAG;
			map[Site.UK] = UK_FLAG;
			map[Site.US] = USA_FLAG;
			
			return map;
		}
		
	}
}