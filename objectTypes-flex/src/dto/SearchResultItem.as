
package dto
{

	[Bindable]
	public class SearchResultItem
	{
		[ArrayElementType("ItemAttribute")]
		public var itemAttributes : Array;
		
		public var autoPay : Boolean;
		
		public var buyItNowPrice : String;
		
		public var charityId : String;
		
		[ArrayElementType("String")]
		public var compatibilities : Array

		public var condition : Condition;
		
		[ArrayElementType("String")]
		public var countries:Array;
		
		public var country : String;
		
		public var currency : String;
		
		public var discountPriceInfo : DiscountedPriceInfo;
		
		public var distance : Distance;
		
		public var galleryInfoContainer : GalleryInfoContainer;
		
		[ArrayElementType("String")]
		public var galleryPlusPictureURLs:Array;
		
		public var galleryURL:String;
		
		public var imageURL:String ; //thumbnail - sometimes other images are missing
		
		public var globalId : String; // in other APIs - site Id
		
		public var isMultiVariationListing:Boolean;
		
		public var itemId : String;
		
		public var listingInfo : ListingInfo ;// ListingInfo
		
		public var location : String;
		
		[ArrayElementType("String")]
		public var paymentMethods : Array;
		
		public var paymentMethod : String;
		
		public var pictureURLLarge : String;
		
		public var pictureURLSuperSize : String;
		
		public var postalCode : String;
		
		public var primaryCategory : Category;
		
		public var productId : String; // ProductId
		
		public var returnsAccepted : Boolean;
		
		public var secondaryCategory : Category;
		
		public var sellerInfo : * ;// SellerInfo
		
		public var sellingStatus : SellingStatus;
		
		public var shippingInfo : ShippingInfo;
		
		public var storeInfo : *;// Storefront
		
		public var subtitle : String;
		
		public var title : String;
		
		public var topRatedListing:Boolean;
		
		public var unitPrice : * ;// UnitPriceInfo
		
		public var viewItemURL : String;
		
		public var watchCount : String;
		
		
		
		public function SearchResultItem()
		{
			//this.searchResultValues = new Array();
		}  // SearchResultItem
	}  // class declaration
}  // package