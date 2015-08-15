package ebayApp.services.util.parsers
{
	import dto.AverageRatingDetailsType;
	import dto.FeedbackHistory;
	import dto.FeedbackPeriod;

	public class FeedbackParser
	{
		
		public static function parseFeedbackHistory( xmlData : XMLList ) : FeedbackHistory
		{
			
			namespace shoppingNs = "urn:ebay:apis:eBLBaseComponents";
			use namespace shoppingNs;
			
			var h : FeedbackHistory = new FeedbackHistory();
			
			h.uniqueNegativeFeedbackCount = Number(xmlData.UniqueNegativeFeedbackCount);
			h.uniquePositiveFeedbackCount = Number(xmlData.UniquePositiveFeedbackCount);
			h.uniqueNeutralFeedbackCount = Number ( xmlData.UniqueNeutralFeedbackCount );
			
			var xmlNode:XML;
			
			if ( xmlData.AverageRatingDetails.length() > 0 )
			{
				h.averageRatingDetails = [];
				
				for each ( xmlNode in xmlData.AverageRatingDetails )
				{
					h.averageRatingDetails.push( parseAverageRatingDetails( xmlNode ));
				}
			}
			
			if ( xmlData.BidRetractionFeedbackPeriods.length() > 0 )
			{
				h.bidRetractionFeedbackPeriods = [];
				for each ( xmlNode in xmlData.BidRetractionFeedbackPeriods)
				{
					h.bidRetractionFeedbackPeriods.push( parseFeedbackPeriod( xmlNode ));
				}
			}
			
			if ( xmlData.NegativeFeedbackPeriods.length() > 0 )
			{
				h.negativeFeedbackPeriods = [];
				for each ( xmlNode in xmlData.NegativeFeedbackPeriods)
				{
					h.negativeFeedbackPeriods.push( parseFeedbackPeriod( xmlNode ));
				}
			}
			
			
			if ( xmlData.NeutralFeedbackPeriods.length() > 0 )
			{
				h.neutralFeedbackPeriods = [];
				for each (xmlNode  in xmlData.NeutralFeedbackPeriods)
				{
					h.neutralFeedbackPeriods.push( parseFeedbackPeriod( xmlNode ));
				}
			}
			
			if ( xmlData.PositiveFeedbackPeriods.length() > 0 )
			{
				h.positiveFeedbackPeriods = [];
				for each ( xmlNode in xmlData.PositiveFeedbackPeriods)
				{
					h.positiveFeedbackPeriods.push( parseFeedbackPeriod( xmlNode ));
				}
			}
			
			if ( xmlData.TotalFeedbackPeriods.length() > 0 )
			{
				h.totalFeedbackPeriods = [];
				for each ( xmlNode in xmlData.TotalFeedbackPeriods)
				{
					h.totalFeedbackPeriods.push( parseFeedbackPeriod( xmlNode ));
				}
			}
			
			
			return h;
		}
		
		public static function parseFeedbackPeriod( xmlData : XML ) : FeedbackPeriod
		{
			namespace shoppingNs = "urn:ebay:apis:eBLBaseComponents";
			use namespace shoppingNs;
			
			
			var fp : FeedbackPeriod = new FeedbackPeriod;
			
			fp.count = xmlData.Count;
			fp.periodInDays = xmlData.PeriodInDays;
			
			return fp;
		}
		
		public static function parseAverageRatingDetails( xmlData : XML ) : AverageRatingDetailsType
		{
			namespace shoppingNs = "urn:ebay:apis:eBLBaseComponents";
			use namespace shoppingNs;
			
			var ard : AverageRatingDetailsType = new AverageRatingDetailsType();
			
			ard.rating = Number ( xmlData.Rating );
			ard.ratingCount = Number ( xmlData.RatingCount );
			ard.ratingDetails = xmlData.RatingDetail;
			return ard;
		}
	}
}