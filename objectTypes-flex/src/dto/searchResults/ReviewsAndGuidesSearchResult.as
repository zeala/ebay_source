package dto.searchResults
{
	import dto.BuyingGuideDetails;
	import dto.ReviewDetails;

	public class ReviewsAndGuidesSearchResult
	{
		public var buyingGuideDetails : dto.BuyingGuideDetails;
		public var reviewDetail : dto.ReviewDetails;
		public var buyingGuideCount : int;
		public var pageNumber : int;
		public var positiveHelpfulnessVotes : int;
		public var productId : String;
		public var reviewCount : int;
		public var reviewsAndGuidesUrl : String;
		public var totalHelfulnessVotes : int;
		public var totalPages : int;
		
	}
}