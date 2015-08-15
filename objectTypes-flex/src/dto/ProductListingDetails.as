

package dto
{

	public class ProductListingDetails
	{
		[ArrayElementType("String")]
		public var copyright:Array;
		public var includePrefilledItemInformation:Boolean;
		public var includeStockPhotoURL:Boolean;
		public var productID:String;
		public var stockPhotoURL:String;
		public var useStockPhotoURLAsGallery:Boolean;
	
		public function ProductListingDetails()
		{
			this.copyright = new Array();
		}  // ProductListingDetails
	}  // class declaration
}  // package