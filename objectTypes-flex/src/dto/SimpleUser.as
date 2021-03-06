package dto
{
	import dto.results.EBayResult;

	public class SimpleUser extends EBayResult
	{
		
		public var aboutMeURL : String;
		public var feedbackDetailsURL : String;
		public var feebackPrivate : Boolean;
		public var feedbackRatingStar : String;// FeedbackratingStarCodeType
		public var feedbackScore : int;
		public var myWorldLargeImage : String;
		public var myWorldSmallImage : String;
		public var newUser : Boolean;
		public var positiveFeedbackPercent : Number;
		public var registrationDate : Date;
		public var registrationSite : String ;//SiteCodeType
		public var reviewAndGuidesURL:String;
		public var sellerBusinessType : String ;// SellerBusinessCodeType
		public var sellerItemsURL : String;
		public var sellerLevel : String ;// SellerLevelCodeType
		public var status : String; // UserStatusCodeType
		public var storeName : String;
		public var storeURL:String;
		public var topRatedSeller : Boolean;
		public var userAnonymized : Boolean;
		public var userId : String;
		
		public var feebackDetails : FeedbackDetails;
		public var feedbackHistory : FeedbackHistory;
	}
}