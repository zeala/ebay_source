

package dto
{

	public class NameValueList
	{
		public var name:String;
		[ArrayElementType("String")]
		public var value:Array;


		public function NameValueList()
		{
			this.value = new Array();
		}  // NameValueList
	}  // class declaration
}  // package