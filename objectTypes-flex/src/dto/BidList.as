

package dto
{
	

	public class BidList
	{
		[ArrayElementType("BidListItem")]
		public var bidListItem:Array;
		public var paginationResult:PaginationResult;
		

		public function BidList()
		{
			this.bidListItem = new Array();
		}  // BidList
	}  // class declaration
}  // package