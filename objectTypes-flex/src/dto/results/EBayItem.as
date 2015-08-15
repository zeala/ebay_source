

package dto.results
{
	import dto.BestOfferDetails;
	import dto.BusinessSellerDetails;
	import dto.Charity;
	import dto.DiscountedPriceInfo;
	import dto.QuantityInfo;
	import dto.ReturnPolicyType;
	import dto.ShippingCostSummary;
	import dto.SimpleUser;
	


	public class EBayItem extends EBayResult
	{
		public var autoPay:Boolean;
		public var bestOfferDetails:BestOfferDetails;
		public var bidCount : int;
		public var businessSellerDetails : BusinessSellerDetails;
		public var buyItNowAvailable : Boolean;
	    public var buyItNowPrice:Number;
		public var charity:Charity;
		public var conditionDescription : String;
		public var conditionDisplayName : String;
		public var conditionId : String;
		public var convertedBuyItNowPrice : Number;
		public var convertedCurrentPrice : Number;
		public var country:String;
		public var currentPrice : Number;
		public var description:String;
		public var discountPriceInfo : DiscountedPriceInfo;
		public var domainName : String;
		public var endTime : Date;
		public var excludeShiptoLocation : String;
		public var galleryURL : String;
		public var globalShipping:Boolean;
		public var halfItemCondition : String ;// HalfItemConditionCodeType
		public var handlingTime : int;
		public var highBidder : SimpleUser;
		public var hitCount:Number;
		public var itemID:String;
		public var itemsSpecifics : Array;// NameValueListArrayType
		public var listingStatus : String; // ListingStatusCodetype
		public var listingType : String ; // ListingTypeCodeType		
		public var location:String;
		public var lotSize:int;
		public var minimumToBid : Number;
		public var paymentAllowedSite : String ;// SiteCodeType
		public var paymentMethods:Array;
		public var pictureURLs : Array ;
		public var postalCode:String;
		public var primaryCategoryId : String;
		public var primaryCategoryIdPath : String;
		public var primaryCategoryName : String;
		public var productId : String;		
		public var quantity:int;
		public var quantityAvailableHint : String ;// QuantityAvailableHintCodeType
		public var quantityInfo : QuantityInfo;
		public var quantitySold : int;
		public var quantityThreshold : int;
		public var reserveMet : Boolean;
		public var returnPolicy : ReturnPolicyType;		
		public var secondaryCategoryId:String;
		public var secondaryCategoryIDPath : String;
		public var secondaryCategoryName : String;		
		public var seller:SimpleUser;
		public var sellerComments : String;
		public var shippingCostSummary : ShippingCostSummary;
		[ArrayElementType("String")]
		public var shipToLocations:Array;
		public var site:String; //SiteCodeType
		public var startTime : Date;
		public var storeFront: String ;// StoreFrontType StoreFront;
		public var subtitle:String;
		public var timeLeft:String;
		public var title:String;
		public var topRatedListing : Boolean;
		public var unitInfo : String; // UnitINfoType;
		public var variations : String ; //VariationsType
		public var vhrAvailable : Boolean;
		public var vhrUrl : String;
		public var viewItemURLForNaturalSearch : String;
		public var watchCount : int;
		
		

		/**
		 * Constructor for the EBayItem class.
		 * 
		 * <p>Creates a new EbayItem object.</p>
		 */
		public function EBayItem()
		{
			
		}  // EBayItem
	}  // class declaration
}  // package