

package dto
{

	public class PictureDetails
	{
		public var galleryType:String;
		public var galleryURL:String;
		public var photoDisplay:String;
		public var pictureSource:String;
		[ArrayElementType("String")]
		public var pictureURL:Array;
		
		public function PictureDetails()
		{
			this.pictureURL = new Array();
		}  // PictureDetails
	}  // class declaration
}  // package