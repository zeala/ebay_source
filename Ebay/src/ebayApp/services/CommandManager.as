package ebayApp.services
{
	import flash.events.EventDispatcher;
	
	import ebayApp.services.commands.finding.FetchMoreResults;
	import ebayApp.services.commands.finding.FindCompletedItemsCommand;
	import ebayApp.services.commands.finding.FindItemsAdvancedCommand;
	import ebayApp.services.commands.finding.FindItemsByImageCommand;
	import ebayApp.services.commands.merchandising.GetMostWatchedItemsCommand;
	import ebayApp.services.commands.merchandising.GetSimilarItems;
	import ebayApp.services.commands.merchandising.GetTopSellingProducts;
	import ebayApp.services.commands.shopping.FindPopularItemsCommand;
	import ebayApp.services.commands.shopping.FindPopularSearchesCommand;
	import ebayApp.services.commands.shopping.FindProductsCommand;
	import ebayApp.services.commands.shopping.FindReviewsAndGuidesCommand;
	import ebayApp.services.commands.shopping.GetCategoryInfoCommand;
	import ebayApp.services.commands.shopping.GetSingleItemCommand;
	import ebayApp.services.commands.shopping.GetUserProfileCommand;
	import ebayApp.services.commands.trading.GetSessionIDCommand;
	
	
	public class CommandManager extends EventDispatcher
	{
		// --------------- FINDING API -------------------------------//
		public var findCompletedItems:FindCompletedItemsCommand 
			= new FindCompletedItemsCommand ( FindingServiceGET.getInstance() );
			
		public var findItemsAdvanced:FindItemsAdvancedCommand
			= new FindItemsAdvancedCommand (FindingServiceGET.getInstance() );
			
		public var findItemsByImage : FindItemsByImageCommand
			 = new FindItemsByImageCommand( FindingServiceGET.getInstance());
		
		public var fetchMoreItems : FetchMoreResults
			= new FetchMoreResults( FindingServiceGET.getInstance() );
			 
		//-------------------- MERCHANDISING API ---------------------//
		
		public var getMostWatchedItems : GetMostWatchedItemsCommand
			 = new GetMostWatchedItemsCommand();
	
		public var getSimilarItems : GetSimilarItems
			= new GetSimilarItems();
			
		public var getTopSellingProducts : GetTopSellingProducts
			= new GetTopSellingProducts();
		//----------------------- SHOPPING API -----------------------//
		public var GetSingleItem : GetSingleItemCommand
			= new GetSingleItemCommand( ShoppingServiceGET.getInstance() );
			
		public var FindProducts : FindProductsCommand
			= new FindProductsCommand( ShoppingServiceGET.getInstance() );
			
		public var GetUserProfile : GetUserProfileCommand
			= new GetUserProfileCommand( ShoppingServiceGET.getInstance() );
			
		public var FindPopularSearches : FindPopularSearchesCommand
			= new FindPopularSearchesCommand ( ShoppingServiceGET.getInstance() );
		
		public var GetCategoryInfo : GetCategoryInfoCommand
			= new GetCategoryInfoCommand ( ShoppingServiceGET.getInstance() );

		public var FindReviewsAndGuides : FindReviewsAndGuidesCommand
		 	= new FindReviewsAndGuidesCommand ( ShoppingServiceGET.getInstance() );
		
		public var FindPopularItems : FindPopularItemsCommand
			= new FindPopularItemsCommand();
			
		//----------------------- TRADING API -----------------------//
		public var GetSessionID : GetSessionIDCommand
			= new  GetSessionIDCommand( ShoppingServiceGET.getInstance() );
			
		//==============================================================//
		private static var instance:CommandManager
		
		public static function getInstance():CommandManager
		{
			if ( !instance )
			{
				instance = new CommandManager();
			}
			return instance;
		}
		
	}
	
}