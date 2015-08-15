package utils
{
	import spark.formatters.NumberFormatter;

	public class NumberFormatterUtils
	{
		private static const CURRENCY_FORMATTER : spark.formatters.NumberFormatter
			= buildCcyFormatter();
		
		private static function buildCcyFormatter():spark.formatters.NumberFormatter
		{
			var formatter : spark.formatters.NumberFormatter = new spark.formatters.NumberFormatter();
			formatter.fractionalDigits = 2;
			return formatter;
		}
		
		public static function formatPrice ( val : Number ) : String
		{
			
			var str : String = CURRENCY_FORMATTER.format( val );
			return str;
		}
	}
}