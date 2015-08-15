

package dto.results
{
	import dto.Address;
	import dto.BuyerInfo;
	import dto.Seller;


	public class EBayUser extends EBayResult
	{
		public var aboutMePage:Boolean;
		public var buyerInfo:BuyerInfo;
		[ArrayElementType("String")]
		public var charityAffiliations:Array;
		public var eBayGoodStanding:Boolean;
		public var eBayWikiReadOnly:Boolean;
		public var eiasToken:String;
		public var email:String;
		public var feedbackPrivate:Boolean;
		public var feedbackRatingStar:String;
		public var feedbackScore:int;
		public var idVerified:Boolean;
		public var motorsDealer:Boolean;
		public var newUser:Boolean;
		public var payPalAccountLevel:String;
		public var payPalAccountStatus:String;
		public var payPalAccountType:String;
		public var positiveFeedbackPercent:Number;
		public var registrationAddress:Address;
		public var registrationDate:Date;
		public var registrationSite : String;
		public var restToken:String;
		public var sellerInfo:Seller;
		public var sellerPaymentMethod:String;
		public var site:String;
		[ArrayElementType("String")]
		public var skypeID:Array;
		public var status:String;
		public var tuvLevel:int;
		public var uniqueNegativeFeedbackCount:int;
		public var uniquePositiveFeedbackCount:int;
		public var userID:String;
		public var userIDChanged:Boolean;
		public var userIDLastChanged:Date;
		[ArrayElementType("String")]
		public var userSubscription:Array;
		public var vatID:String;
		public var vatStatus:String;
		

		/**
		 * Constructor for the EBayUser class.
		 * 
		 * <p>Creates a new EBayUser object.</p>
		 */
		public function EBayUser()
		{
			this.charityAffiliations = new Array();
			this.skypeID = new Array();
			this.userSubscription = new Array();
		}  // EBayUser
	}  // class declaration
}  // package