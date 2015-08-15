package dto.codeTypes
{
	public class SiteCodeType
	{
		//=============================================================================
		//  CONSTANTS
		//=============================================================================
		
		public static const AUSTRALIA : String = "Australia";
		public static const AUSTRIA : String = "Austria";
		public static const BELGIUM_DUTCH : String = "Belgium_Dutch";
		public static const BELGIUM_FRENCH : String = "Belgium_French";
		public static const CANADA : String = "Canada";
		public static const CANADA_FRENCH : String = "CanadaFrench";
		public static const CHINA : String = "China";
		public static const EBAY_MOTORS : String = "eBayMotors";
		public static const FRANCE : String = "France";
		public static const GERMANY : String = "Germany";
		public static const HONG_KONG : String = "HongKong";
		public static const INDIA : String = "India";
		public static const IRELAND : String = "Ireland";
		public static const ITALY : String = "Italy";
		public static const MALAYSIA : String = "Malaysia";
		public static const NETHERLANDS : String = "Netherlands";
		public static const PHILIPPINES : String = "Philippines";
		public static const POLAND : String = "Poland";
		public static const SINGAPORE : String = "Singapore";
		public static const SPAIN : String = "Spain";
		public static const SWEDEN : String = "Sweden";
		public static const SWITZERLAND : String = "Switzerland";
		public static const TAIWAN : String = "Taiwan";
		public static const UK : String = "United Kingdom";
		public static const US : String = "USA";

		
		//global Ids
		public static const EBAY_US : String = "EBAY-US";
		public static const EBAY_ENCA : String = "EBAY-ENCA";
		public static const EBAY_GB : String = "EBAY-GB"; 
		public static const EBAY_AU : String = "EBAY-AU";
		public static const EBAY_AT : String = "EBAY-AT";
		public static const EBAY_FRBE : String = "EBAY-FRBE";
		public static const EBAY_FR : String = "EBAY-FR";
		public static const EBAY_DE : String = "EBAY-DE";
		public static const EBAY_MOTOR : String = "EBAY-MOTOR"; 
		public static const EBAY_IT : String = "EBAY-IT";
		public static const EBAY_NLBE : String = "EBAY-NLBE";
		public static const EBAY_NL : String = "EBAY-NL"; 
		public static const EBAY_ES : String = "EBAY-ES";
		public static const EBAY_CH : String = "EBAY-CH";
		public static const EBAY_HK : String = "EBAY-HK"; 
		public static const EBAY_IN : String = "EBAY-IN"; 
		public static const EBAY_IE : String = "EBAY-IE";
		public static const EBAY_MY : String = "EBAY-MY";
		public static const EBAY_FRCA : String = "EBAY-FRCA";
		public static const EBAY_PH : String = "EBAY-PH";
		public static const EBAY_PL : String = "EBAY-PL";
		public static const EBAY_SG : String = "EBAY-SG";
		
			
		
		public static const sites : Array =
			[
				{ value : AUSTRALIA, siteName : "Australia", siteId : "15", abbreviation : "AU", currency : "AUD", globalId : EBAY_AU, isEng : true },
				{ value : AUSTRIA, siteName : "Austria", siteId : "16", abbreviation : "AT", currency : "EUR", globalId : EBAY_AT},
				{ value : BELGIUM_DUTCH, siteName : "Belgium (Dutch)", siteId : "123", abbreviation : "BENL", currency : "EUR", globalId : EBAY_NLBE},
				{ value : BELGIUM_FRENCH, siteName : "Belgium (French)", siteId : "123", abbreviation : "BEFR", currency : "EUR", globalId : EBAY_FRBE},
				{ value : CANADA, siteName : "Canada", siteId : "2", abbreviation : "CA", currency : "CAD", globalId : EBAY_ENCA, isEng : true },
				{ value : CANADA_FRENCH, siteName : "CanadaFrench", siteId : "210", abbreviation : "CAFR", currency : "CAD", globalId : EBAY_FRCA},
				{ value : EBAY_MOTORS, siteName : "eBay Motors", siteId : "100", abbreviation : "", currency : "USD", globalId : EBAY_MOTOR, isEng : true},
				{ value : FRANCE, siteName : "France", siteId : "71", abbreviation : "FR", currency : "EUR", globalId : EBAY_FR},
				{ value : GERMANY, siteName : "Germany", siteId : "77", abbreviation : "DE", currency : "EUR", globalId : EBAY_DE},
				{ value : HONG_KONG, siteName : "Hong Kong", siteId : "201", abbreviation : "HK", currency : "HKD", globalId : EBAY_HK},
				{ value : INDIA, siteName : "India", siteId : "203", abbreviation : "IN", currency : "INR", globalId : EBAY_IN},
				{ value : IRELAND, siteName : "Ireland", siteId : "205", abbreviation : "IE", currency : "EUR", globalId : EBAY_IE, isEng : true },
				{ value : ITALY, siteName : "Italy", siteId : "101", abbreviation : "IT", currency : "EUR", globalId : EBAY_IT},
				{ value : MALAYSIA, siteName : "Malaysia", siteId : "207", abbreviation : "MY", currency : "MYR", globalId : EBAY_MY},
				{ value : NETHERLANDS, siteName : "Netherlands", siteId : "146", abbreviation : "NL", currency : "EUR", globalId : EBAY_NL},
				{ value : PHILIPPINES, siteName : "Philippines", siteId : "211", abbreviation : "PH", currency : "PHP", globalId : EBAY_PH},
				{ value : POLAND, siteName : "Poland", siteId : "212", abbreviation : "PL", currency : "PLN", globalId : EBAY_PL},
				{ value : SINGAPORE, siteName : "Singapore", siteId : "216", abbreviation : "SG", currency : "SGD", globalId : EBAY_SG},
				{ value : SPAIN, siteName : "Spain", siteId : "186", abbreviation : "ES", currency : "EUR", globalId : EBAY_ES},
				{ value : SWITZERLAND, siteName : "Switzerland", siteId : "193", abbreviation : "CH", currency : "CHF", globalId : EBAY_CH},
				{ value : UK, siteName : "UK", siteId : "3", abbreviation : "UK", currency : "GBP", globalId : EBAY_GB, isEng : true },
				{ value : US, siteName : "US", siteId : "0", abbreviation : "US", currency : "USD", globalId : EBAY_US, isEng : true },		
			];
	}
} 