
package dto
{

	public class ItemSpecific
	{
		[ArrayElementType("NameValueList")]
		public var nameValueList:Array;


		public function ItemSpecific()
		{
			this.nameValueList = new Array();
		}  // ItemSpecific
	}  // class declaration
}  // package