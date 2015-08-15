

package dto
{

	public class EBayError
	{
		public var errorClassification:String;
		public var errorCode:String;
		[ArrayElementType("ErrorParameter")]
		public var errorParameters:Array;
		public var longMessage:String;
		public var severityCode:String;
		public var shortMessage:String;


		public function EBayError()
		{
			this.errorParameters = new Array();
		}  // EBayError
	}  // class declaration
}  // package