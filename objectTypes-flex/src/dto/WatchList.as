
package dto
{

	public class WatchList
	{
		[ArrayElementType("WatchListItem")]
		public var watchListItem:Array;
		public var paginationResult:PaginationResult;


		/**
		 * Constructor for the WatchList class.
		 * 
		 * <p>Creates a new WatchList object.</p>
		 */
		public function WatchList()
		{
			this.watchListItem = new Array();
		}  // WatchList
	}  // class declaration
}  // package