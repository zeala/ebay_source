

package dto
{

	public class Item
	{
		public var bestOfferEnabled:Boolean;
		public var buyerProtection:String;
		public var buyItNowPrice:Number;
		public var country:String;
		public var currency:String;
		public var digitalDeliveryDetails:DigitalDeliveryDetails;
		public var distance:Distance;
		public var itemID:String;
		public var listingDetails:ListingDetails;
		public var listingDuration:String;
		[ArrayElementType("String")]
		public var listingEnhancement:Array;
		public var listingType:String;
		public var localListing:Boolean;
		public var motorsGermanySearchable:Boolean;
		[ArrayElementType("String")]
		public var paymentMethods:Array;
		public var pictureDetails:PictureDetails;
		public var postalCode:String;
		public var primaryCategory:Category;
		public var searchDetails:SearchDetails;
		public var secondaryCategory:Category;
		public var seller:String;
		public var sellingStatus:SellingStatus;
		public var shippingDetails:ShippingDetails;
		public var storeFront:StoreFront;
		public var title:String;
		

		/**
		 * Constructor for the Item class.
		 * 
		 * <p>Creates a new Item object.</p>
		 */
		public function Item()
		{
			this.listingEnhancement = new Array();
			this.paymentMethods = new Array();
		}  // Item
	}  // class declaration
}  // package