

package dto
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class Category extends EventDispatcher
	{
		public var categoryID:String;
		public var categoryLevel : int;
		public var categoryParentId : int;
		public var categoryName:String;
		public var categoryNamePath : String;
		public var categoryIdPath : String;
		public var leafCategory : Boolean;
		public var categoryVersion : String;
		
		private var _children : ArrayCollection;
		[Bindable("childrenChange")]
		public function get children():ArrayCollection
		{
			return _children;
		}
		public function set children(val:ArrayCollection):void
		{
			_children = val;
			dispatchEvent( new Event("childrenChange"));
		}
		
		public function addChild( val:Category) : void
		{
			if (!children)
			{
				children = new ArrayCollection();
			}
			children.addItem( val );
			dispatchEvent( new Event("childrenChange"));
		}
		
		public function Category()
		{
		}  // Category
	}  // class declaration
}


  // package