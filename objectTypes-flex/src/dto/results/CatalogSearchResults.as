package dto.results
{
	import mx.collections.ArrayCollection;

	public class CatalogSearchResults
	{
		
		public var approximatePages : int;
		public var moreResults : Boolean;
		public var pageNumber : int;
		public var totalProducts : int;
		
		[Bindable]
		[ArrayElementType("Product")]
		public var products : ArrayCollection;
	}
}