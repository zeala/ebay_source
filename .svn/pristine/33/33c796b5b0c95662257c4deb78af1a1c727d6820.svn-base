

package dto.results
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import dto.PaginationOutput;
	import dto.SpellingSuggestion;
	import dto.histograms.AspectHistogramContainer;
	import dto.histograms.CategoryHistogramContainer;


	public class SearchResults extends EBayResult
	{
		
		public var hasMoreResults : Boolean;
		
		
		//----------------------------------------
		// pagination output
		//----------------------------------------
		
		private var _paginationOutput : PaginationOutput;
		[Bindable("paginationOutputChange")]
		public function get paginationOutput():PaginationOutput
		{
			return _paginationOutput;
		}
		public function set paginationOutput(val:PaginationOutput):void
		{
			_paginationOutput = val;
			dispatchEvent( new Event("paginationOutputChange"));
		}
		
		
		//----------------------------------------
		// current page number
		//----------------------------------------
		public var currentPageNumber : int = 1;
		
		//----------------------------------------
		// search result items
		//----------------------------------------
		
		[ArrayElementType("SearchResultItem")]
		private var _searchResultItem : ArrayCollection;
		[Bindable("searchResultItemsChange")]
		public function get searchResultItem():ArrayCollection
		{
			return _searchResultItem;
		}
		public function set searchResultItem(val:ArrayCollection):void
		{
			_searchResultItem = val;
			dispatchEvent( new Event("searchResultItemsChange"));
		}
		
		public var spellingSuggestion:SpellingSuggestion;

		public var aspectHistogramContainer : AspectHistogramContainer;
		
		[Bindable]
		public var categoryHistogramContainer : CategoryHistogramContainer ;//CategoryHistogramContainer;
		
		public var conditionHistorgramContainer : * ;//ConditionHistogramContainer
		
		public function SearchResults()
		{
			this.searchResultItem = new ArrayCollection();
		} 
		
		
		public function addSearchResultItems( val : ArrayCollection ) : void
		{
			searchResultItem.disableAutoUpdate();
			for ( var i : int = 0; i < val.length; i++)
			{
				searchResultItem.addItem( val[i]);
				
			}
			searchResultItem.enableAutoUpdate();
			dispatchEvent( new Event("searchResultItemsChange"));
		}
	}  
}  // package