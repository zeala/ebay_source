package dto
{
	public class FeedbackHistory
	{
		
		[ArrayElementType("AverageRatingDetailsType")]
		public var averageRatingDetails : Array;
		
		[ArrayElementType("FeedbackPeriod")]
		public var bidRetractionFeedbackPeriods : Array ;//FeedbackPeriod;
		
		[ArrayElementType("FeedbackPeriod")]
		public var negativeFeedbackPeriods : Array;// FeedbackPeriod; 
		
		public var neutralCommentCountFromSuspendedUsers :Number;
		
		[ArrayElementType("FeedbackPeriod")]
		public var neutralFeedbackPeriods : Array;
		
		[ArrayElementType("FeedbackPeriod")]
		public var positiveFeedbackPeriods : Array;
		
		[ArrayElementType("FeedbackPeriod")]
		public var totalFeedbackPeriods : Array; 
		
		public var uniqueNegativeFeedbackCount : Number ;
		
		public var uniqueNeutralFeedbackCount : Number ;
		
		public var uniquePositiveFeedbackCount : Number;
	}
}