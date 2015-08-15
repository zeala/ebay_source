
package dto
{

	import dto.results.EBayUser;

	[Bindable]
	public class SellingStatus
	{
		public var bidCount:int;
		public var bidIncrement:Number;
		public var convertedCurrentPrice:Number;
		public var currentPrice:Number;
		public var currency : String;
		public var highBidder:EBayUser;
		public var leadCount:int;
		public var listingStatus:String;
		public var minimumToBid:Number;
		public var quantitySold:int;
		public var reserveMet:Boolean;
		public var secondChanceEligible:Boolean;
		public var sellingState : String // see SellingState
		public var timeLeft : String //in format PnYnMnDTnHnMnS


		public function SellingStatus()
		{
		}  // SellingStatus
	}  // class declaration
}  // package