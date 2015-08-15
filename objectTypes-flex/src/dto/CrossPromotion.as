

package dto
{
	
	public class CrossPromotion
	{
		public var itemID:String;
		public var primaryScheme:String;
		[ArrayElementType("PromotedItem")]
		public var promotedItem:Array;
		public var promotionMethod:String;
		public var sellerID:String;
		public var sellerKey:String;
		public var shippingDiscount:Boolean;
		public var storeName:String;		


		public function CrossPromotion()
		{
			this.promotedItem = new Array();
		}  // CrossPromotion
	}  // class declaration
}  // package