
package dto
{
	public class LostList
	{
		[ArrayElementType("LostListItem")]
		public var lostListItem:Array;
		public var paginationResult:PaginationResult;

		public function LostList()
		{
			this.lostListItem = new Array();
		}  // LostList
	}  // class declaration
}  // package