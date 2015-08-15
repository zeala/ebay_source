package ebayApp.services.commands.finding
{
	import mx.collections.ArrayCollection;

	public class FindingServiceOperationName
	{
		public static const FIND_COMPLETED_ITEMS:String = "findCompletedItems";
		public static const FIND_ITEMS_ADVANCED:String = "findItemsAdvanced";
		public static const FIND_ITEMS_BY_CATEGORY:String = "findItemsByCategory";
		public static const FIND_ITEMS_BY_IMAGE:String = "findItemsByImage";
		public static const FIND_ITEMS_BY_KEYWORDS:String = "findItemsByKeywords";
		public static const FIND_ITEMS_BY_PRODUCT:String = "findItemsByProduct";
		public static const FIND_ITEMS_IN_EBAY_STORES:String = "findItemsIneBayStores";
		public static const GET_HISTOGRAMS:String = "getHistograms";
		public static const GET_SEARCH_KEYWORDS_RECOMMENDATION:String = "getSearchKeywordsRecommendation";
		public static const GET_VERSION:String = "getVersion";
		
		
		public static const FINDING_SERVICE_OPERATIONS_FIND:ArrayCollection = new ArrayCollection( 
			[
				{label:"Find completed items", value:FIND_COMPLETED_ITEMS},
				{label:"Find items - advanced", value:FIND_ITEMS_ADVANCED},
				{label:"Find items by category", value:FIND_ITEMS_BY_CATEGORY},
				{label:"Find items by image", value:FIND_ITEMS_BY_IMAGE},
				{label:"Find items by keywords", value:FIND_ITEMS_BY_KEYWORDS},
				{label:"Find items by product", value:FIND_ITEMS_BY_PRODUCT},
				{label:"Find items in eBay store", value:FIND_ITEMS_IN_EBAY_STORES}
			]);
		
		public static const FINDING_SERVICE_OPERATIONS_GET:ArrayCollection = new ArrayCollection( 
			[
				{label:"Get histograms", value:FIND_COMPLETED_ITEMS},
				{label:"Get search keywords recommendation", value:FIND_ITEMS_ADVANCED},
				{label:"Get version", value:FIND_ITEMS_BY_CATEGORY}
			]);
	}
}