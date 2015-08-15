


package dto.results
{
	/**
	 * Contains the results from an AddToWatchList or RemoveFromWatchList
	 * API call.
	 * 
	 * <p>Extends EBayResult class, inheriting standard output fields.</p>
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Charles Bihis, Adobe Systems Incorporated
	 * 
	 * @see com.adobe.webapis.ebay.EBayService#addToWatchList()
	 * @see com.adobe.webapis.ebay.EBayService#removeFromWatchList()
	 * @see com.adobe.webapis.ebay.results.EBayResult
	 */
	public class AddOrRemoveFromWatchListResult extends EBayResult
	{
		public var watchListCount:int;
		public var watchListMaximum:int;


		/**
		 * Constructor for the AddOrRemoveFromWatchListResult class.
		 * 
		 * <p>Creates a new AddOrRemoveFromWatchListResult object.</p>
		 */
		public function AddOrRemoveFromWatchListResult()
		{
		}  // AddOrRemoveFromWatchListResult
	}  // class declaration
}  // package