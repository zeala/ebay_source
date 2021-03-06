
package dto
{
	

	public class ShippingDetails
	{
		public var applyShippingDiscount:Boolean;
		public var calculatedShippingRate:CalculatedShippingRate;	
		public var defaultShippingCost:Number;
		public var getItFast:Boolean;
		public var insuranceDetails:InsuranceDetails;
		public var insuranceFee:Number;
		public var insuranceOption:String;
		public var internationalInsuranceDetails:InsuranceDetails;
		[ArrayElementType("ShippingServiceOption")]
		public var internationalShippingServiceOption:Array;
		public var paymentInstructions:String;
		public var salesTax:SalesTax;
		public var sellingManagerSalesRecordNumber:int;
		public var shippingRateType:String;
		[ArrayElementType("ShippingServiceOption")]
		public var shippingServiceOptions:Array;
		public var shippingType:String;
		public var taxTable:TaxTable;
		public var thirdPartyCheckout:Boolean;

		
		public function ShippingDetails()
		{
			this.internationalShippingServiceOption = new Array();
			this.shippingServiceOptions = new Array();
		}  // ShippingDetails
	}  // class declaration
}  // package