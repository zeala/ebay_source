package ebayApp.services.util.parsers
{		

	import mx.collections.ArrayCollection;
	
	import spark.formatters.NumberFormatter;
	
	import dto.Address;
	import dto.BidList;
	import dto.BidListItem;
	import dto.BiddingDetails;
	import dto.BuyerInfo;
	import dto.BuyerRequirements;
	import dto.BuyingSummary;
	import dto.CalculatedShippingRate;
	import dto.Category;
	import dto.Condition;
	import dto.ContactDetails;
	import dto.CrossPromotion;
	import dto.DigitalDeliveryDetails;
	import dto.Distance;
	import dto.EBayError;
	import dto.ErrorParameter;
	import dto.ExpressItemRequirements;
	import dto.ExpressSellerRequirements;
	import dto.GalleryInfoContainer;
	import dto.InsuranceDetails;
	import dto.ItemSpecific;
	import dto.ListingCheckoutRedirectPreference;
	import dto.ListingDesigner;
	import dto.ListingDetails;
	import dto.ListingInfo;
	import dto.LostList;
	import dto.LostListItem;
	import dto.MaximumItemRequirements;
	import dto.NameValueList;
	import dto.PaginationOutput;
	import dto.PaginationResult;
	import dto.PaymentDetails;
	import dto.PictureDetails;
	import dto.ProductListingDetails;
	import dto.PromotedItem;
	import dto.ReviseStatus;
	import dto.SalesTax;
	import dto.SchedulingInfo;
	import dto.SearchDetails;
	import dto.SearchResultItem;
	import dto.Seller;
	import dto.SellingStatus;
	import dto.ShippingDetails;
	import dto.ShippingInfo;
	import dto.ShippingServiceOption;
	import dto.SimpleUser;
	import dto.StoreFront;
	import dto.TaxJurisdiction;
	import dto.TaxTable;
	import dto.VATDetails;
	import dto.VerifiedUserRequirements;
	import dto.WatchList;
	import dto.WatchListItem;
	import dto.results.AddOrRemoveFromWatchListResult;
	import dto.results.EBayResult;
	import dto.results.EBayUser;
	import dto.results.MyEBayBuyingItems;
	import dto.results.PlaceOfferResult;
	import dto.results.SearchResults;

	import utils.DateUtil;
	
	
	public final class EBayResultParser
	{
		namespace ns = "http://www.ebay.com/marketplace/search/v1/services";
		use namespace ns;

		/**
		 * Creates an AddOrRemoveFromWatchListResult object.
		 * 
		 * @param resultData The XML relevant to the AddOrRemoveFromWatchListResult object
		 * @return A new AddOrRemoveFromWatchListResult object
		 */
		public static function parseAddOrRemoveFromWatchListResult(resultData:XML):AddOrRemoveFromWatchListResult
		{
			var callResult:AddOrRemoveFromWatchListResult = new AddOrRemoveFromWatchListResult();

			parseStandardFieldsFindingAPI(resultData, callResult);
			
			if (callResult.ack != "Success" && callResult.ack != "Warning")
				return callResult;

			callResult.watchListCount = int(resultData.WatchListCount);
			callResult.watchListMaximum = int(resultData.WatchListMaximum);

			return callResult;
		}  // parseAddOrRemoveFromWatchListResult


		/**
		 * Creates an Address object.
		 * 
		 * @param addressData The XML relevant to the Address object
		 * @return A new Address object
		 */
		public static function parseAddress(addressData:XMLList):Address
		{
			var address:Address = new Address();

			address.cityName = addressData.CityName;
			address.name = addressData.Name;
			address.phone = addressData.Phone;
			address.postalCode = addressData.PostalCode;
			address.stateOrProvince = addressData.StateOrProvince;
			address.street = addressData.Street;
			address.street1 = addressData.Street1;
			address.street2 = addressData.Street2;

			return address;
		}  // parseAddress


		

		/**
		 * Creates a BiddingDetails object.
		 * 
		 * @param detailsData The XML relevant to the BiddingDetails object
		 * @return A new BiddingDetails object.
		 */
		public static function parseBiddingDetails(detailsData:XMLList):BiddingDetails
		{
			var biddingDetails:BiddingDetails = new BiddingDetails();

			biddingDetails.convertedMaxBid = Number(detailsData.ConvertedMaxBid);
			biddingDetails.maxBid = Number(detailsData.MaxBid);
			biddingDetails.quantityBid = int(detailsData.QuantityBid);
			biddingDetails.quantityWon = int(detailsData.QuantityWon);

			return biddingDetails;
		}  // parseBiddingDetails


		/**
		 * Creates a BidList object.
		 * 
		 * @param listData The XML relevant to the BidList object
		 * @return A new BidList object
		 */
		public static function parseBidList(listData:XMLList):BidList
		{
			var bidList:BidList = new BidList();

			for each (var bidListNode:XML in listData.ItemArray.Item)
				bidList.bidListItem.push(parseBidListItem(XMLList(bidListNode)));
			bidList.paginationResult = parsePaginationResult(listData.PaginationResult);

			return bidList;
		}  // parseBidList


		/**
		 * Creates a BidListItem object.
		 * 
		 * @param itemData The XML relevant to the BidListItem object
		 * @return A new BidListItem object
		 */
		public static function parseBidListItem(itemData:XMLList):BidListItem
		{
			var bidListItem:BidListItem = new BidListItem();

			bidListItem.biddingDetails = parseBiddingDetails(itemData.BiddingDetails);
			bidListItem.eBayNotes = itemData.eBayNotes;
			bidListItem.itemID = itemData.ItemID;
			bidListItem.listingDetails = parseListingDetails(itemData.ListingDetails);
			bidListItem.listingType = itemData.ListingType;
			bidListItem.pictureDetails = parsePictureDetails(itemData.PictureDetails);
			bidListItem.quantityAvailable = int(itemData.QuantityAvailable);
			bidListItem.seller = parseSellerInfo(itemData.Seller);
			bidListItem.sellingStatus = parseSellingStatus(itemData.SellingStatus);
			bidListItem.shippingDetails = parseShippingDetails(itemData.ShippingDetails);
			bidListItem.site = itemData.Site;
			bidListItem.startPrice = Number(itemData.StartPrice);
			bidListItem.timeLeft = itemData.TimeLeft;
			bidListItem.title = itemData.Title;

			return bidListItem;
		}  // parseBidListItem


		/**
		 * Creates a BuyerInfo object.
		 * 
		 * @param infoData The XML relevant to the BuyerInfo object
		 * @return A new BuyerInfo object
		 */
		public static function parseBuyerInfo(infoData:XMLList):BuyerInfo
		{
			var buyerInfo:BuyerInfo = new BuyerInfo();

			buyerInfo.shippingAddress = parseAddress(infoData.ShippingAddress);

			return buyerInfo;
		}  // parseBuyerInfo


		/**
		 * Creates a BuyerRequirements object.
		 * 
		 * @param requirementsData The XML relevant to the BuyerRequirements object
		 * @return A new BuyerRequirements object
		 */
		public static function parseBuyerRequirements(requirementsData:XMLList):BuyerRequirements
		{
			var buyerRequirements:BuyerRequirements = new BuyerRequirements();

			buyerRequirements.linkedPayPalAccount = requirementsData.LinkedPayPalAccount == "true" ? true : false;
			buyerRequirements.maximumItemRequirements = parseMaximumItemRequirements(requirementsData.MaximumItemRequirements);
			buyerRequirements.maximumUnpaidItemStrikes = requirementsData.MaximumUnpaidItemStrikes == "true" ? true : false;
			buyerRequirements.minimumFeedbackScore = int(requirementsData.MinimumFeedbackScore);
			buyerRequirements.shipToRegistrationCountry = requirementsData.ShipToRegistrationCountry == "true" ? true : false;
			buyerRequirements.verifiedUserRequirements = parseVerifiedUserRequirements(requirementsData.VerifiedUserRequirements);
			buyerRequirements.zeroFeedbackScore = requirementsData.ZeroFeedbackScore == "true" ? true : false;

			return buyerRequirements;
		}  // parseBuyerRequirements


		/**
		 * Creates a BuyingSummary object.
		 * 
		 * @param summaryData The XML relevant to the BuyingSummary object
		 * @return A new BuyingSummary object
		 */
		public static function parseBuyingSummary(summaryData:XMLList):BuyingSummary
		{
			var buyingSummary:BuyingSummary = new BuyingSummary();

			buyingSummary.bestOfferCount = int(summaryData.BestOfferCount);
			buyingSummary.biddingCount = int(summaryData.BiddingCount);
			buyingSummary.totalWinningCost = Number(summaryData.TotalWinningCost);
			buyingSummary.totalWonCost = Number(summaryData.TotalWonCost);
			buyingSummary.winningCount = int(summaryData.WinningCount);
			buyingSummary.wonCount = int(summaryData.WinningCount);
			buyingSummary.wonDurationInDays = int(summaryData.WonDurationInDays);

			return buyingSummary;
		}  // parseBuyingSummary


		/**
		 * Creates a CalculatedShippingRate object.
		 * 
		 * @param rateDetails The XML relevant to the CalculatedShippingRate object
		 * @return A new CalculatedShippingRate object
		 */
		public static function parseCalculatedShippingRate(rateDetails:XMLList):CalculatedShippingRate
		{
			var calculatedShippingRate:CalculatedShippingRate = new CalculatedShippingRate();

			calculatedShippingRate.internationPackagingHandlingCosts = Number(rateDetails.InternationalPackagingHandlingCosts);
			calculatedShippingRate.originatingPostalCode = rateDetails.OriginatingPostalCode;
			calculatedShippingRate.packageDepth = Number(rateDetails.PackageDepth);
			calculatedShippingRate.packageLength = Number(rateDetails.PackageLength);
			calculatedShippingRate.packageWidth = Number(rateDetails.PackageWidth);
			calculatedShippingRate.packagingHandlingCosts = Number(rateDetails.PackagingHandlingCosts);
			calculatedShippingRate.shippingIrregular = rateDetails.ShippingIrregular == "true" ? true : false;
			calculatedShippingRate.shippingPackage = rateDetails.ShippingPackage;
			calculatedShippingRate.weightMajor = Number(rateDetails.WeightMajor);
			calculatedShippingRate.weightMinor = Number(rateDetails.WeightMinor);

			return calculatedShippingRate;
		}  // parseCalculatedShippingRate


		/**
		 * Creates a Category object.
		 * 
		 * @param categoryDetails The XML relevant to the Category object
		 * @return A new Category object
		 */
		public static function parseCategory(categoryDetails:XMLList):dto.Category
		{
			var category:Category = new Category();

			category.categoryID = categoryDetails.categoryId;
			category.categoryName = categoryDetails.categoryName;

			return category;
		}  // parseCategory


		

		/**
		 * Creates a ContactDetails object.
		 * 
		 * @param detailsData The XML relevant to the ContactDetails object
		 * @return A new ContactDetails object
		 */
		public static function parseContactDetails(detailsData:XMLList):ContactDetails
		{
			var contactDetails:ContactDetails = new ContactDetails();

			contactDetails.cityName = detailsData.CityName;
			contactDetails.companyName = detailsData.CompanyName;
			contactDetails.country = detailsData.Country;
			contactDetails.phone2AreaOrCityCode = detailsData.Phone2AreaOrCityCode;
			contactDetails.phone2CountryCode = detailsData.Phone2CountryCode;
			contactDetails.phone2CountryPrefix = detailsData.Phone2CountryPrefix;
			contactDetails.phone2LocalNumber = detailsData.Phone2LocalNumber;
			contactDetails.phoneAreaOrCityCode = detailsData.PhoneAreaOrCityCode;
			contactDetails.phoneCountryCode = detailsData.PhoneCountryCode;
			contactDetails.phoneCountryPrefix = detailsData.PhoneCountryPrefix;
			contactDetails.phoneLocalNumber = detailsData.PhoneLocalNumber;
			contactDetails.stateOrProvince = detailsData.StateOrProvince;
			contactDetails.street1 = detailsData.Street1;
			contactDetails.street2 = detailsData.Street2;

			return contactDetails;
		}  // parseContactDetails


		/**
		 * Creates a CrossPromotion object.
		 * 
		 * @param promotionData The XML relevant to the CrossPromotion object
		 * @return A new CrossPromotion object
		 */
		public static function parseCrossPromotion(promotionData:XMLList):CrossPromotion
		{
			var crossPromotion:CrossPromotion = new CrossPromotion();

			crossPromotion.itemID = promotionData.ItemID;
			crossPromotion.primaryScheme = promotionData.PrimaryScheme;
			for each (var itemNode:XML in promotionData.PromotedItem)
				crossPromotion.promotedItem.push(parsePromotedItem(XMLList(itemNode)));
			crossPromotion.promotionMethod = promotionData.PromotionMethod;
			crossPromotion.sellerID = promotionData.SellerID;
			crossPromotion.sellerKey = promotionData.SellerKey;
			crossPromotion.shippingDiscount = promotionData.ShippingDiscount == "true" ? true : false;
			crossPromotion.storeName = promotionData.StoreName;

			return crossPromotion;
		}  // parseCrossPromotion




		/**
		 * Creates a DigitalDeliveryDetails object.
		 * 
		 * @param detailsData The XML relevant to the DigitalDeliveryDetails object
		 * @return A new DigitalDeliveryDetails object
		 */
		public static function parseDigitalDeliveryDetails(detailsData:XMLList):DigitalDeliveryDetails
		{
			var deliveryDetails:DigitalDeliveryDetails = new DigitalDeliveryDetails();

			deliveryDetails.instructions = detailsData.Instructions;
			deliveryDetails.method = detailsData.Method;
			deliveryDetails.requirements = detailsData.Requirements;
			deliveryDetails.url = detailsData.URL;

			return deliveryDetails;
		}  // parseDigitalDeliveryDetails


		/**
		 * Creates a Distance object.
		 * 
		 * @param distanceData The XML relevant to the Distance object
		 * @return A new Distance object
		 */
		public static function parseDistance(distanceData:XMLList):Distance
		{
			var distance:Distance = new Distance();

			distance.distanceMeasurement = int(distanceData.DistanceMeasurement);
			distance.distanceUnit = distanceData.DistanceUnit;

			return distance;
		}  // parseDistance


		/**
		 * Creates an EBayError object.
		 * 
		 * @param errorData The XML relevant to the EBayError object
		 * @return A new EBayError object
		 */
		public static function parseEBayError(errorData:XMLList):EBayError
		{
			var ebayError:EBayError = new EBayError;

			ebayError.errorClassification = errorData.ErrorClassification;
			ebayError.errorCode = errorData.ErrorCode;
			for each (var errorParamNode:XML in errorData.ErrorParameters)
				ebayError.errorParameters.push(parseErrorParameter(XMLList(errorParamNode)));
			ebayError.longMessage = errorData.LongMessage;
			ebayError.severityCode = errorData.SeverityCode;
			ebayError.shortMessage = errorData.ShortMessage;

			return ebayError;
		}  // parseEBayError


		
		/**
		 * Creates an EBayUser object.
		 * 
		 * @param userData The XML relevant to the EBayUser object
		 * @return A new EBayUser object
		 */
		public static function parseEBayUser(userData:XML):SimpleUser
		{
			namespace shoppingNs = "urn:ebay:apis:eBLBaseComponents";
			use namespace shoppingNs;
			
			var ebayUser:SimpleUser = new SimpleUser();

			ShoppingServiceParser.parseStandardFieldsShoppingAPI(userData, ebayUser);
			
			if (ebayUser.ack != "Success" && ebayUser.ack != "Warning")
				return ebayUser;

			ebayUser.userId = userData.User.UserID;
			ebayUser.feebackPrivate = userData.User.FeedbackPrivate;
			ebayUser.feedbackRatingStar = userData.User.FeedbackRatingStar;
			ebayUser.feedbackScore = userData.User.FeedbackScore;
			ebayUser.newUser = userData.User.NewUser == "true";
			ebayUser.registrationDate = DateUtil.parseW3CDTF(userData.User.RegistrationDate);
			ebayUser.registrationSite =  userData.User.RegistrationSite;
			ebayUser.status = userData.User.Status;
			ebayUser.sellerBusinessType = userData.User.SellerBusinessType;
			ebayUser.sellerItemsURL = userData.User.SellerItemURL;
			ebayUser.feedbackDetailsURL = userData.User.FeedbackDetailsURL;
			ebayUser.positiveFeedbackPercent = userData.User.PositiveFeedbackPercent;
			ebayUser.topRatedSeller = userData.User.TopRatedSeller == "true";
			
			if ( userData.FeedbackHistory.length() > 0 )
			{
				ebayUser.feedbackHistory = FeedbackParser.parseFeedbackHistory (userData.FeedbackHistory );
			}

			return ebayUser;
		}  // parseEBayUser


		
		/**
		 * Creates an ErrorParameter object.
		 * 
		 * @param parameterData The XML relevant for the ErrorParameter object
		 * @return A new ErrorParameter object
		 */
		public static function parseErrorParameter(parameterData:XMLList):ErrorParameter
		{
			var errorParameter:ErrorParameter = new ErrorParameter();

			errorParameter.value = parameterData.Value;

			return errorParameter;
		}  // parseErrorParameter


		/**
		 * Creates an ExpressItemRequirements object.
		 * 
		 * @param requirementsData The XML relevant for the ExpressItemRequirements object
		 * @return A new ExpressItemRequirements object
		 */
		public static function parseExpressItemRequirements(requirementsData:XMLList):ExpressItemRequirements
		{
			var expressItemRequirements:ExpressItemRequirements = new ExpressItemRequirements();

			expressItemRequirements.combinedShippingDiscount = requirementsData.CombinedShippingDiscount == "true" ? true : false;
			expressItemRequirements.domesticShippingCost = requirementsData.DomesticShippingCost == "true" ? true : false;
			expressItemRequirements.eligibleCheckout = requirementsData.EligibleCheckout == "true" ? true : false;
			expressItemRequirements.eligibleItemCondition = requirementsData.EligibleItemCondition == "true" ? true : false;
			expressItemRequirements.eligiblePayPalAccount = requirementsData.EligiblePayPalAccount == "true" ? true : false;
			expressItemRequirements.eligibleReturnPolicy = requirementsData.EligibleReturnPolicy == "true" ? true : false;
			expressItemRequirements.expressApproved = requirementsData.ExpressApproved == "true" ? true : false;
			expressItemRequirements.expressEligibleListingType = requirementsData.ExpressEligibleListingType == "true" ? true : false;
			expressItemRequirements.expressEnabledCategory = requirementsData.ExpressEnabledCategory == "true" ? true : false;
			expressItemRequirements.expressOptOut = requirementsData.ExpressOptOut == "true" ? true : false;
			expressItemRequirements.noCharity = requirementsData.NoCharity == "true" ? true : false;
			expressItemRequirements.noDigitalDelivery = requirementsData.NoDigitalDelivery == "true" ? true : false;
			expressItemRequirements.noPreapprovedBidderList = requirementsData.NoPreapprovedBidderList == "true" ? true : false;
			expressItemRequirements.payPalAccountAcceptsUnconfirmedAddress = requirementsData.PayPalAccountAcceptsUnconfirmedAddress ? true : false;
			expressItemRequirements.picture = requirementsData.Picture == "true" ? true : false;
			expressItemRequirements.priceAboveMinimum = requirementsData.PriceAboveMinimum == "true" ? true : false;
			expressItemRequirements.priceBelowMaximum = requirementsData.PriceBelowMaximum == "true" ? true : false;
			expressItemRequirements.sellerExpressEligible = requirementsData.SellerExpressEligible == "true" ? true : false;
			expressItemRequirements.shipFromEligibleCountry = requirementsData.ShipFromEligibleCountry == "true" ? true : false;

			return expressItemRequirements;
		}  // parseExpressItemRequirements


		/**
		 * Creates an ExpressSellerRequirements object.
		 * 
		 * @param expressSellerRequirementsData The XML relevant to the ExpressSellerRequirements object
		 * @return A new ExpressSellerRequirements object
		 */
		public static function parseExpressSellerRequirements(expressSellerRequirementsData:XMLList):ExpressSellerRequirements
		{
			var expressSellerRequirements:ExpressSellerRequirements = new ExpressSellerRequirements();

			expressSellerRequirements.businessSeller = expressSellerRequirementsData.BusinessSeller == "true" ? true : false;
			expressSellerRequirements.combinedPaymentsAccepted = expressSellerRequirementsData.CombinedPaymentsAccepted == "true" ? true : false;
			expressSellerRequirements.eligiblePayPalAccount = expressSellerRequirementsData.EligiblePayPalAccount == "true" ? true : false;
			expressSellerRequirements.expressApproved = expressSellerRequirementsData.ExpressApproved == "true" ? true : false;
			expressSellerRequirements.expressSellingPreference = expressSellerRequirementsData.ExpressSellingPreference == "true" ? true : false;
			expressSellerRequirements.feedbackAsSellerScore = expressSellerRequirementsData.FeedbackAsSellerScore == "true" ? true : false;
			expressSellerRequirements.feedbackPublic = expressSellerRequirementsData.FeedbackPublic == "true" ? true : false;
			expressSellerRequirements.feedbackScore = expressSellerRequirementsData.FeedbackScore == "true" ? true : false;
			expressSellerRequirements.goodStanding = expressSellerRequirementsData.GoodStanding == "true" ? true : false;
			expressSellerRequirements.payPalAccountAcceptsUnconfirmedAddress = expressSellerRequirementsData.PayPalAccountAcceptsUnconfirmedAddress == "true" ? true : false;
			expressSellerRequirements.positiveFeedbackAsSellerPercent = expressSellerRequirementsData.PositiveFeedbackAsSellerPercent == "true" ? true : false;
			expressSellerRequirements.positiveFeedbackPercent = expressSellerRequirementsData.PositiveFeedbackPercent == "true" ? true : false;

			return expressSellerRequirements;
		}  // parseExpressSellerRequirements


		/**
		 * Creates an InsuranceDetails object.
		 * 
		 * @param detailsData The XML relevant to the InsuranceDetails object
		 * @return A new InsuranceDetails object
		 */
		public static function parseInsuranceDetails(detailsData:XMLList):InsuranceDetails
		{
			var insuranceDetails:InsuranceDetails = new InsuranceDetails();

			insuranceDetails.insuranceFee = Number(detailsData.InsuranceFee);
			insuranceDetails.insuranceOption = detailsData.InsuranceOption;

			return insuranceDetails;
		}  // parseInsuranceDetails


		


		/**
		 * Creates an ItemSpecific object.
		 * 
		 * @param itemSpecificData The XML relevant to the ItemSpecific object
		 * @return A new ItemSpecific object
		 */
		public static function parseItemSpecific(itemSpecificData:XMLList):ItemSpecific
		{
			var itemSpecific:ItemSpecific = new ItemSpecific();

			for each (var nameValueListNode:XML in itemSpecificData.NameValueList)
			{
				var nameValueList:NameValueList = new NameValueList();
				
				nameValueList.name = nameValueListNode.Name;
				for each (var valueNode:XML in nameValueListNode.Value)
					nameValueList.value.push(valueNode);
				
				itemSpecific.nameValueList.push(nameValueList);
			}  // for each loop

			return itemSpecific;
		}  // parseItemSpecific


		/**
		 * Creates a ListingCheckoutRedirectPreference object.
		 * 
		 * @param preferenceData The XML relevant to the ListingCheckoutRedirectPreference object
		 * @return A new ListingCheckoutRedirectPreference object
		 */
		public static function parseListingCheckoutRedirectPreference(preferenceData:XMLList):ListingCheckoutRedirectPreference
		{
			var listingCheckoutRedirectPreference:ListingCheckoutRedirectPreference = new ListingCheckoutRedirectPreference();

			listingCheckoutRedirectPreference.sellerThirdPartyUsername = preferenceData.SellerThirdPartyUsername;

			return listingCheckoutRedirectPreference;
		}  // parseListingCheckoutRedirectPreference


		/**
		 * Creates a ListingDesigner object.
		 * 
		 * @param designerData The XML relevant to the ListingDesigner object
		 * @return A new ListingDesigner object
		 */
		public static function parseListingDesigner(designerData:XMLList):ListingDesigner
		{
			var listingDesigner:ListingDesigner = new ListingDesigner();

			listingDesigner.layoutID = int(designerData.LayoutID);
			listingDesigner.optimalPictureSize = designerData.OptimalPictureSize == "true" ? true : false;
			listingDesigner.themeID = int(designerData.ThemeID);

			return listingDesigner;
		}  // parseListingDesigner


		/**
		 * Creates a ListingDetails object.
		 * 
		 * @param detailsData The XML relevant to the ListingDetails object
		 * @return A new ListingDetails object
		 */
		public static function parseListingDetails(detailsData:XMLList):ListingDetails
		{
			var listingDetails:ListingDetails = new ListingDetails();

			listingDetails.adult = detailsData.Adult == "true" ? true : false;
			listingDetails.bindingAuction = detailsData.BindingAuction == "true" ? true : false;
			listingDetails.buyItNowAvailable = detailsData.BuyItNowAvailable == "true" ? true : false;
			listingDetails.checkoutEnabled = detailsData.CheckoutEnabled == "true" ? true : false;
			listingDetails.convertedBuyItNowPrice = Number(detailsData.ConvertedBuyItNowPrice);
			listingDetails.convertedReservePrice = Number(detailsData.ConvertedReservePrice);
			listingDetails.convertedStartPrice = Number(detailsData.ConvertedStartPrice);
			listingDetails.endTime = DateUtil.parseDateString(detailsData.EndTime);
			listingDetails.expressItemRequirements = parseExpressItemRequirements(detailsData.ExpressItemRequirements);
			listingDetails.expressListing = detailsData.ExpressListing == "true" ? true : false;
			listingDetails.hasPublicMessages = detailsData.HasPublicMessage == "true" ? true : false;
			listingDetails.hasReservePrice = detailsData.HasReservePrice == "true" ? true : false;
			listingDetails.hasUnansweredQuestions = detailsData.HasUnansweredQuestions == "true" ? true : false;
			listingDetails.minimumBestOfferMessage = detailsData.MinimumBestOfferMessage;
			listingDetails.minimumBestOfferPrice = Number(detailsData.MinimumBestOfferPrice);
			listingDetails.relistedItemID = detailsData.RelistedItemID;
			listingDetails.secondChanceOriginalItemID = detailsData.SecondChanceOriginalItemID;
			listingDetails.sellerBusinessType = detailsData.SellerBusinessType;
			listingDetails.startTime = DateUtil.parseDateString(detailsData.StartTime);
			listingDetails.tcrOriginalItemID = detailsData.TCROriginalItemID;
			listingDetails.viewItemURL = detailsData.ViewItemURL;

			return listingDetails;
		}  // parseListingDetails


		/**
		 * Creates a LostList object.
		 * 
		 * @param listData The XML relevant to the LostList object
		 * @return A new LostList object
		 */
		public static function parseLostList(listData:XMLList):LostList
		{
			var lostList:LostList = new LostList();

			for each (var lostListNode:XML in listData.ItemArray.Item)
				lostList.lostListItem.push(parseLostListItem(XMLList(lostListNode)));
			lostList.paginationResult = parsePaginationResult(listData.PaginationResult);

			return lostList;
		}  // parseLostList


		/**
		 * Creates a LostListItem object.
		 * 
		 * @param itemData The XML relevant to the LostListItem object
		 * @return A new LostListItem object
		 */
		public static function parseLostListItem(itemData:XMLList):LostListItem
		{
			var lostListItem:LostListItem = new LostListItem();

			lostListItem.biddingDetails = parseBiddingDetails(itemData.BiddingDetails);
			lostListItem.eBayNotes = itemData.eBayNotes;
			lostListItem.itemID = itemData.ItemID;
			lostListItem.listingDetails = parseListingDetails(itemData.ListingDetails);
			lostListItem.listingType = itemData.ListingType;
			lostListItem.seller = parseSellerInfo(itemData.Seller);
			lostListItem.sellingStatus = parseSellingStatus(itemData.SellingStatus);
			lostListItem.site = itemData.Site;
			lostListItem.startPrice = Number(itemData.StartPrice);
			lostListItem.title = itemData.Title;

			return lostListItem;
		}  // parseLostListItem


		/**
		 * Creates a MaximumItemRequirements object.
		 * 
		 * @param requirementsData The XML relevant to the MaximumItemRequirements object
		 * @return A new MaximumItemRequirements object
		 */
		public static function parseMaximumItemRequirements(requirementsData:XMLList):MaximumItemRequirements
		{
			var maximumItemRequirements:MaximumItemRequirements = new MaximumItemRequirements();

			maximumItemRequirements.maximumItemCount = int(requirementsData.MaximumItemCount);
			maximumItemRequirements.minimumFeedbackScore = int(requirementsData.MinimumFeedbackScore);

			return maximumItemRequirements;
		}  // parseMaximumItemRequirements


		/**
		 * Creates a MyEBayBuyingItems object.
		 * 
		 * @param requirementsData The XML relevant to the MyEBayBuyingItems object
		 * @return A new MyEBayBuyingItems object
		 */
		public static function parseMyEBayBuyingItems(itemsData:XML):MyEBayBuyingItems
		{
			var myEBayBuyingItems:MyEBayBuyingItems = new MyEBayBuyingItems();
			
			parseStandardFieldsFindingAPI(itemsData, myEBayBuyingItems);
			
			if (myEBayBuyingItems.ack != "Success" && myEBayBuyingItems.ack != "Warning")
				return myEBayBuyingItems;

			myEBayBuyingItems.bidList = parseBidList(itemsData.BidList);
			myEBayBuyingItems.buyingSummary = parseBuyingSummary(itemsData.BuyingSummary);
			myEBayBuyingItems.lostList = parseLostList(itemsData.LostList);
			myEBayBuyingItems.watchList = parseWatchList(itemsData.WatchList);

			return myEBayBuyingItems;
		}  // parseMyEBayBuyingItems


		/**
		 * Creates a PaginationResult object.
		 * 
		 * @param requirementsData The XML relevant to the PaginationResult object
		 * @return A new PaginationResult object
		 */
		public static function parsePaginationResult(paginationData:XMLList):PaginationResult
		{
			var paginationResult:PaginationResult = new PaginationResult();

			paginationResult.totalNumberOfEntries = int(paginationData.TotalNumberOfEntries);
			paginationResult.totalNumberOfPages = int(paginationData.TotalNumberOfPages);

			return paginationResult;
		}  // parsePaginationResult


		/**
		 * Creates a PaymentDetails object.
		 * 
		 * @param requirementsData The XML relevant to the PaymentDetails object
		 * @return A new PaymentDetails object
		 */
		public static function parsePaymentDetails(detailsData:XMLList):PaymentDetails
		{
			var paymentDetails:PaymentDetails = new PaymentDetails();

			paymentDetails.daysToFullPayment = int(detailsData.DaysToFullPayment);
			paymentDetails.hoursToDeposit = int(detailsData.HoursToDeposit);

			return paymentDetails;
		}  // parsePaymentDetails


		/**
		 * Creates a PictureDetails object.
		 * 
		 * @param requirementsData The XML relevant to the PictureDetails object
		 * @return A new PictureDetails object
		 */
		public static function parsePictureDetails(detailsData:XMLList):PictureDetails
		{
			var pictureDetails:PictureDetails = new PictureDetails();

			pictureDetails.galleryType = detailsData.GalleryType;
			pictureDetails.galleryURL = detailsData.GalleryURL;
			pictureDetails.photoDisplay = detailsData.PhotoDisplay;
			pictureDetails.pictureSource = detailsData.PictureSource;
			for each (var pictureURLNode:XML in detailsData.PictureURL)
				pictureDetails.pictureURL.push(pictureURLNode);

			return pictureDetails;
		}  // parsePictureDetails


		/**
		 * Creates a PlaceOfferResult object.
		 * 
		 * @param requirementsData The XML relevant to the PlaceOfferResult object
		 * @return A new PlaceOfferResult object
		 */
		public static function parsePlaceOfferResult(resultData:XML):PlaceOfferResult
		{
			var placeOfferResult:PlaceOfferResult = new PlaceOfferResult();

			parseStandardFieldsFindingAPI(resultData, placeOfferResult);
			
			if (placeOfferResult.ack != "Success" && placeOfferResult.ack != "Warning")
				return placeOfferResult;

			placeOfferResult.sellingStatus = parseSellingStatus(resultData.SellingStatus);

			return placeOfferResult;
		}  // parsePlaceOfferResult


		/**
		 * Creates a ProductListingDetails object.
		 * 
		 * @param requirementsData The XML relevant to the ProductListingDetails object
		 * @return A new ProductListingDetails object
		 */
		public static function parseProductListingDetails(detailsData:XMLList):ProductListingDetails
		{
			var productListingDetails:ProductListingDetails = new ProductListingDetails();

			for each (var copyrightNode:XML in detailsData.Copyright)
				productListingDetails.copyright.push(copyrightNode);
			productListingDetails.includePrefilledItemInformation = detailsData.IncludePrefilledItemInformation == "true" ? true : false;
			productListingDetails.includeStockPhotoURL = detailsData.IncludeStockPhotoURL == "true" ? true : false;
			productListingDetails.productID = detailsData.ProductID;
			productListingDetails.stockPhotoURL = detailsData.StockPhotoURL;
			productListingDetails.useStockPhotoURLAsGallery = detailsData.UseStockPhotoURLAsGallery == "true" ? true : false;

			return productListingDetails;
		}  // parseProductListingDetails


		/**
		 * Creates a PromotedItem object.
		 * 
		 * @param requirementsData The XML relevant to the PromotedItem object
		 * @return A new PromotedItem object
		 */
		public static function parsePromotedItem(itemData:XMLList):PromotedItem
		{
			var promotedItem:PromotedItem = new PromotedItem();

			promotedItem.itemID = itemData.ItemID;
			promotedItem.listingType = itemData.ListingType;
			promotedItem.pictureURL = itemData.PictureURL;
			promotedItem.position = int(itemData.Position);
			promotedItem.promotionPrice = Number(itemData.PromotionPrice);
			promotedItem.promotionPriceType = itemData.PromotionPriceType;
			promotedItem.selectionType = itemData.SelectionType;
			promotedItem.title = itemData.Title;

			return promotedItem;
		}  // parsePromotedItem


		/**
		 * Creates a ReviseStatus object.
		 * 
		 * @param requirementsData The XML relevant to the ReviseStatus object
		 * @return A new ReviseStatus object
		 */
		public static function parseReviseStatus(statusData:XMLList):ReviseStatus
		{
			var reviseStatus:ReviseStatus = new ReviseStatus();

			reviseStatus.buyItNowAdded = statusData.BuyItNowAdded == "true" ? true : false;
			reviseStatus.buyItNowLowered = statusData.BuyItNowLowered == "true" ? true : false;
			reviseStatus.itemRevised = statusData.ItemRevised == "true" ? true : false;
			reviseStatus.reserveLowered = statusData.ReserveLowered == "true" ? true : false;
			reviseStatus.reserveRemoved = statusData.ReserveRemoved == "true" ? true : false;

			return reviseStatus;
		}  // parseReviseStatus


		/**
		 * Creates a SalesTax object.
		 * 
		 * @param requirementsData The XML relevant to the SalesTax object
		 * @return A new SalesTax object
		 */
		public static function parseSalesTax(taxData:XMLList):SalesTax
		{
			var salesTax:SalesTax = new SalesTax();

			salesTax.salesTaxAmount = Number(taxData.SalesTaxAmount);
			salesTax.salesTaxPercent = Number(taxData.SalesTaxPercent);
			salesTax.salesTaxState = taxData.SalesTaxState;
			salesTax.shippingIncludedInTax = taxData.ShippingIncludedInTax;

			return salesTax;
		}  // parseSalesTax


		/**
		 * Creates a SchedulingInfo object.
		 * 
		 * @param requirementsData The XML relevant to the SchedulingInfo object
		 * @return A new SchedulingInfo object
		 */
		public static function parseSchedulingInfo(schedulingInfoData:XMLList):SchedulingInfo
		{
			var schedulingInfo:SchedulingInfo = new SchedulingInfo;

			schedulingInfo.maxScheduledItems = int(schedulingInfoData.MaxScheduledItems);
			schedulingInfo.maxScheduledMinutes = int(schedulingInfoData.MaxScheduledMinutes);
			schedulingInfo.minScheduledMinutes = int(schedulingInfoData.MinScheduledMinutes);

			return schedulingInfo;
		}  // parseSchedulingInfo


		/**
		 * Creates a SearchDetails object.
		 * 
		 * @param requirementsData The XML relevant to the SearchDetails object
		 * @return A new SearchDetails object
		 */
		public static function parseSearchDetails(detailsData:XMLList):SearchDetails
		{
			var searchDetails:SearchDetails = new SearchDetails();

			searchDetails.buyItNowEnabled = detailsData.BuyItNowEnabled == "true" ? true : false;
			searchDetails.picture = detailsData.Picture == "true" ? true : false;
			searchDetails.recentListing = detailsData.RecentListing == "true" ? true : false;

			return searchDetails;
		}  // parseSearchDetails


		public static function parseMerchandisingServiceRequest( resultData : XML, serviceName : String ) : ArrayCollection
		{
			namespace mns = "http://www.ebay.com/marketplace/services"
			use namespace mns
			var ac : ArrayCollection = new ArrayCollection();
			
			
			var items : XMLList = resultData.itemRecommendations.item;
			trace(" items.length : " + items.length() );
			for each (var itemNode:XML in resultData.itemRecommendations.item)
			{
				
				var item:SearchResultItem = parseSearchResultItem( itemNode , serviceName );				
				ac.addItem( item );
			}
			
			
			return ac;
		}
		
		
		public static function parseOldShoppingServiceSearchResults( resultData : XML ) : SearchResults
		{
			var searchResults : SearchResults = new SearchResults();
			
			namespace shopping = "urn:ebay:apis:eBLBaseComponents";
			use namespace shopping;
			
			for each ( var itemNode : XML in resultData..Item )
			{
				var searchResultItem:SearchResultItem = parseOldShoppingServiceSearchResultItem( itemNode );				
				searchResults.searchResultItem.addItem(searchResultItem);
			}
			
			return searchResults;
		}
		
		/**
		 * Creates a SearchResults object.
		 * 
		 * @param requirementsData The XML relevant to the SearchResults object
		 * @return A new SearchResults object
		 */
		public static function parseSearchResults(resultData:XML, namespaceString : Namespace = null ):SearchResults
		{
			if ( namespaceString == null)
			{
				namespace ns = "http://www.ebay.com/marketplace/search/v1/services";
				use namespace ns;
			}
			
			var searchResults:SearchResults = new SearchResults();
			
			parseStandardFieldsFindingAPI(resultData, searchResults);
			
			if (searchResults.ack != "Success" && searchResults.ack != "Warning")
				return searchResults;

			searchResults.paginationOutput = parsePaginationOutput( resultData..paginationOutput )
			for each (var searchResultNode:XML in resultData.searchResult.item)
			{
				
				var searchResultItem:SearchResultItem = parseSearchResultItem( searchResultNode );				
				searchResults.searchResultItem.addItem(searchResultItem);
			}  // for each loop
			
			if ( resultData.aspectHistogramContainer.length() > 0 )
			{
				searchResults.aspectHistogramContainer
					= HistogramParser.parseAspectHistogramContainer(resultData.aspectHistogramContainer);
			}
			
			if ( resultData.categoryHistogramContainer.length() > 0 )
			{
				searchResults.categoryHistogramContainer
					= HistogramParser.parseCategoryHistogramContainer( resultData.categoryHistogramContainer);
			}
			
			if (resultData.conditionHistogramContainer.length() > 0 )
			{
				searchResults.conditionHistorgramContainer = 
					HistogramParser.parseConditionHistogramContainer( resultData.conditionHistogramContainer );
			}

			return searchResults;
		}  // parseSearchResults

		
		public static function parseCategoryResults( xmlData : XML ) : ArrayCollection
		{
			
			namespace shoppingNs = "urn:ebay:apis:eBLBaseComponents";
			use namespace shoppingNs;
			
			var ac : ArrayCollection = new ArrayCollection;
			
			var categoriesXMLList : XMLList = xmlData..Category;
			
			for ( var i:int = 0; i < categoriesXMLList.length(); i++)
			{
				var catXML:XML = categoriesXMLList[i];
				var cat:Category = new Category();
				cat.categoryID = catXML.CategoryID;
				cat.categoryLevel = int(catXML.CategoryLevel);
				cat.categoryName = catXML.CategoryName;
				cat.categoryParentId = catXML.CategoryParentID;
				cat.categoryIdPath = catXML.CategoryIDPath;
				cat.categoryNamePath = catXML.CategoryNamePath;
				cat.leafCategory = catXML.LeafCategory == "true";
				cat.categoryVersion = xmlData.CategoryVersion.toString();
				if ( cat.categoryLevel != 0 )
				{
					ac.addItem( cat );
				}
			}
			
			return ac;
		}
		
		
		public static function parseOldShoppingServiceSearchResultItem ( itemData : XML ) : SearchResultItem
		{
			namespace shoppingNs = "urn:ebay:apis:eBLBaseComponents";
			use namespace shoppingNs;
			
			var item : SearchResultItem = new SearchResultItem();
			item.itemId = itemData.ItemID;
			
			var li:ListingInfo = new ListingInfo();
			
			trace("\n itemData.EndTime : " + itemData.EndTime);
			li.endTime = DateUtil.isoToDate(itemData.EndTime);
			li.listingType = itemData.ListingType;
			item.listingInfo = li;
			
			item.viewItemURL = itemData.ViewItemURLForNaturalSearch;
			item.galleryURL = itemData.GalleryURL;
			
			var cat : Category = new Category();
			cat.categoryID = itemData.PrimaryCategoryID;
			cat.categoryName = itemData.PrimaryCategoryName;
			item.primaryCategory = cat;
			
			var sellingStatus : SellingStatus = new SellingStatus();
			sellingStatus.bidCount = itemData.BidCount;
			sellingStatus.convertedCurrentPrice = itemData.ConvertedCurrentPrice;
			sellingStatus.listingStatus = itemData.ListingStatus;
			sellingStatus.timeLeft = itemData.TimeLeft;
			item.sellingStatus = sellingStatus;
			
			if ( itemData.ConvertedCurrentPrice.length() > 0)
			{
				item.currency = itemData.ConvertedCurrentPrice.@currencyID;
			}
			item.title = itemData.Title;
			item.watchCount = itemData.WatchCount;
			
			/*
			<Item>
			<ItemID>300718890366</ItemID>
			<EndTime>2013-02-26T20:32:48.000Z</EndTime>
			<ViewItemURLForNaturalSearch>http://www.ebay.com/itm/NEW-Vinyl-Cutter-Best-Value-Cutting-Sign-Making-Kit-Decals-USCutter-Plotter-SALE-/300718890366</ViewItemURLForNaturalSearch>
			<ListingType>FixedPriceItem</ListingType>
			<GalleryURL>http://thumbs3.ebaystatic.com/pict/3007188903668080_4.jpg</GalleryURL>
			<PrimaryCategoryID>26245</PrimaryCategoryID>
			<PrimaryCategoryName>Business &amp; Industrial:Printing &amp; Graphic Arts:Plotters, Wide Format Printing:Cutters- Wide Format</PrimaryCategoryName>
			<BidCount>1350</BidCount>
			<ConvertedCurrentPrice currencyID="USD">299.95</ConvertedCurrentPrice>
			<ListingStatus>Active</ListingStatus>
			<TimeLeft>P16DT19H32M</TimeLeft>
			<Title>NEW Vinyl Cutter Best Value Cutting Sign Making Kit Decals USCutter Plotter SALE</Title>
			<ShippingCostSummary>
			<ShippingServiceCost currencyID="USD">19.95</ShippingServiceCost>
			<ShippingType>Flat</ShippingType>
			<ListedShippingServiceCost currencyID="USD">19.95</ListedShippingServiceCost>
			</ShippingCostSummary>
			<WatchCount>1393</WatchCount>
			</Item>
			*/
			
			
			return item;
		}
		
		/**
		 * Creates an SearchResultItem object.
		 * 
		 * @param itemData The XML relevant to the Item object
		 * @return A new SearchResultItem object
		 */
		public static function parseSearchResultItem(itemData:XML, serviceName : String = null):SearchResultItem
		{
			if ( serviceName == null )
			{
				namespace ns = "http://www.ebay.com/marketplace/search/v1/services";
				use namespace ns;
				
			}
			else
			{
				namespace custom = "http://www.ebay.com/marketplace/services";
				use namespace custom;
			}
			var item:SearchResultItem = new SearchResultItem();
			
			item.itemId = itemData.itemId;
			item.title = itemData.title;
			item.globalId = itemData.globalId;
			item.primaryCategory = parseCategory( itemData.primaryCategory );
			item.galleryURL = itemData.galleryURL;
			item.imageURL = itemData.imageURL;
			item.viewItemURL = itemData.viewItemURL;
			item.paymentMethod = itemData.paymentMethod;
			item.autoPay = itemData.autoPay;
			item.location = itemData.location;
			item.country = itemData.country;
			item.shippingInfo = parseShippingInfo( itemData.shippingInfo );
			item.sellingStatus = parseSellingStatus( itemData.sellingStatus );
			item.listingInfo = parseListingInfo( itemData.listingInfo );
			
			var numberFormatter : NumberFormatter = new NumberFormatter();
			numberFormatter.fractionalDigits = 2;
			item.buyItNowPrice = numberFormatter.format(Number(itemData.buyItNowPrice));
			item.currency = itemData.buyItNowPrice.@currencyId;
			
			
			item.returnsAccepted = itemData.returnsAccepted == "true";
			item.condition = parseCondition( itemData.condition);
			item.isMultiVariationListing = itemData.isMultiVariationListing == "true";
			item.topRatedListing = itemData.topRatedListing == "true";
			
			if ( itemData.galleryInfoContainer.length() > 0 )
			{
				item.galleryInfoContainer = new GalleryInfoContainer();
				item.galleryInfoContainer.smallThumbURL = 
					itemData.galleryInfoContainer.galleryURL.(@gallerySize == "Small");
				item.galleryInfoContainer.mediumThumbURL = 
					itemData.galleryInfoContainer.galleryURL.(@gallerySize == "Medium");
				item.galleryInfoContainer.largeThumbURL =
					itemData.galleryInfoContainer.galleryURL.(@gallerySize == "Large");
			}
			
			item.pictureURLLarge = itemData.pictureURLLarge;
			item.pictureURLSuperSize = itemData.pictureURLSuperSize;
			item.watchCount = itemData.watchCount;
			
			trace("\n item.watchCount : " + item.watchCount );
			/*item.bestOfferEnabled = itemData.BestOfferEnabled;
			item.buyerProtection = itemData.BuyerProtection;
			item.buyItNowPrice = Number(itemData.BuyItNowPrice);
			item.country = itemData.Country;
			item.currency = itemData.Currency;
			item.digitalDeliveryDetails = parseDigitalDeliveryDetails(itemData.DigitalDeliveryDetails);
			item.distance = parseDistance(itemData.Distance);
			item.itemID = itemData.ItemID;
			item.listingDetails = parseListingDetails(itemData.ListingDetails);
			item.listingDuration = itemData.ListingDuration;
			for each (var listingEnhancementNode:XML in itemData.ListingEnhancement)
			item.listingEnhancement.push(listingEnhancementNode);
			item.listingType = itemData.ListingType;
			item.localListing = itemData.LocalListing == "true" ? true : false;
			item.motorsGermanySearchable = itemData.MotorsGermanySearchable == "true" ? true : false;
			for each (var paymentMethodsNode:XML in itemData.PaymentMethods)
			item.paymentMethods.push(paymentMethodsNode);
			item.pictureDetails = parsePictureDetails(itemData.PictureDetails);
			item.postalCode = itemData.PostalCode;
			item.primaryCategory = parseCategory(itemData.PrimaryCategory);
			item.searchDetails = parseSearchDetails(itemData.SearchDetails);
			item.secondaryCategory = parseCategory(itemData.SecondaryCategory);
			item.seller = itemData.Seller;
			item.sellingStatus = parseSellingStatus(itemData.SellingStatus);
			item.shippingDetails = parseShippingDetails(itemData.ShippingDetails);
			item.storeFront = parseStoreFront(itemData.StoreFront);
			item.title = itemData.Title;
			*/
			return item;
		}  // parseItem
		
		

		
		public static function parseCondition ( xmlData : XMLList ) : Condition
		{
			var condition : Condition = new Condition();
			condition.conditionDisplayName = xmlData.conditionDisplayName;
			condition.conditionId = xmlData.conditionId;
			
			return condition;
		}
		
		public static function parseShippingInfo ( xmlData : XMLList ) : ShippingInfo
		{
			var info : ShippingInfo = new ShippingInfo();
			
			info.shippingServiceCost = xmlData.shippingServiceCost;
			info.shippingType = xmlData.shippingType;
			info.shipToLocations = xmlData.shipToLocations;
			info.expeditedShipping = xmlData.expeditedShipping == "true";
			info.oneDayShippingAvailable = xmlData.oneDayShippingAvailable == "true";
			info.handlingTime = xmlData.handlingTime;
			
			return info
		}
		
		public static function parseListingInfo( listingInfo : XMLList ) : ListingInfo
		{
			if ( listingInfo == null || listingInfo.length() == 0 ) return null;
			var info:ListingInfo = new ListingInfo();
			info.bestOfferEnabled = listingInfo.bestOfferEnabled;
			info.buyItNowAvailable = listingInfo.buyItNowAvailable;
			info.startTime = DateUtil.parseW3CDTF(listingInfo.startTime.toString() );
			info.endTime = DateUtil.parseW3CDTF( listingInfo.endTime.toString());
			info.listingType = listingInfo.listingType;
			info.gift = listingInfo.give == "true";
			
			return info;
		}
		
		public static function parsePaginationOutput( paginationData:XMLList):PaginationOutput
		{
			var paginationOutput:PaginationOutput = new PaginationOutput();
			
			paginationOutput.entriesPerPage = paginationData.entriesPerPage;
			paginationOutput.pageNumber = paginationData.pageNumber;
			paginationOutput.totalPages = paginationData.totalPages;
			paginationOutput.totalEntries = paginationData.totalEntries;
			return paginationOutput
		}
		

		/**
		 * Creates a SellerInfo object.
		 * 
		 * @param requirementsData The XML relevant to the SellerInfo object
		 * @return A new SellerInfo object
		 */
		public static function parseSellerInfo(sellerData:XMLList):Seller
		{
			var seller:Seller = new Seller();

			seller.allowPaymentEdit = sellerData.AllowPaymentEdit == "true" ? true : false;
			seller.billingCurrency = sellerData.BillingCurrency;
			seller.charityRegistered = sellerData.CharityRegistered == "true" ? true : false;
			seller.checkoutEnabled = sellerData.CheckoutEnabled == "true" ? true : false;
			seller.cipBankAccountStored = sellerData.CIPBankAccountStored == "true" ? true : false;
			seller.expressEligible = sellerData.ExpressEligibl == "true" ? true : false;
			seller.expressSellerRequirements = parseExpressSellerRequirements(sellerData.ExpressSellerRequirements);
			seller.expressWallet = sellerData.ExpressWallet == "true" ? true : false;
			seller.goodStanding = sellerData.GoodStanding == "true" ? true : false;
			seller.liveAuctionAuthorized = sellerData.LiveAuctionAuthorized == "true" ? true : false;
			seller.merchandizingPref = sellerData.MerchandizingPref; 
			seller.paisaPayStatus = int(sellerData.PaisaPayStatus);
			seller.proStorePreference = sellerData.ProStorePreference;
			seller.qualifiesForB2BVAT = sellerData.QualifiesForB2BVAT == "true" ? true : false;
			seller.registeredBusinessSeller = sellerData.RegisteredBusinessSeller == "true" ? true : false;
			seller.schedulingInfo = parseSchedulingInfo(sellerData.SchedulingInfo);
			seller.sellerBusinessType = sellerData.SellerBusinessType;
			seller.sellerGuaranteeLevel = sellerData.SellerGuaranteeLevel;
			seller.sellerLevel = sellerData.SellerLevel;
			seller.sellerPaymentAddress = parseAddress(sellerData.SellerPaymentAddress);
			seller.storeOwner = sellerData.StoreOwner == "true" ? true : false;
			seller.storeURL = sellerData.StoreURL;
			seller.userID = sellerData.UserID;

			return seller;
		}  // parseSellerInfo


		/**
		 * Creates a SellingStatus object.
		 * 
		 * @param requirementsData The XML relevant to the SellingStatus object
		 * @return A new SellingStatus object
		 */
		public static function parseSellingStatus(statusData:XMLList):SellingStatus
		{
			var sellingStatus:SellingStatus = new SellingStatus();

			sellingStatus.bidCount = int(statusData.bidCount);
			sellingStatus.bidIncrement = Number(statusData.bidIncrement);
			sellingStatus.convertedCurrentPrice = Number(statusData.convertedCurrentPrice);
			sellingStatus.currentPrice = Number(statusData.currentPrice);
			sellingStatus.currency = statusData.currentPrice.@currencyId;
			sellingStatus.highBidder = parseUser(XMLList(statusData.highBidder));
			sellingStatus.leadCount = int(statusData.leadCount);
			sellingStatus.listingStatus = statusData.listingStatus;
			sellingStatus.minimumToBid = int(statusData.minimumToBid);
			sellingStatus.quantitySold = int(statusData.quantitySold);
			sellingStatus.reserveMet = statusData.reserveMet == "true" ? true : false;
			sellingStatus.secondChanceEligible = statusData.secondChanceEligible == "true" ? true : false;
			sellingStatus.sellingState = statusData.sellingState;
			sellingStatus.timeLeft = statusData.timeLeft;

			return sellingStatus;
		}  // parseSellingStatus


		/**
		 * Creates a ShippingDetails object.
		 * 
		 * @param requirementsData The XML relevant to the ShippingDetails object
		 * @return A new ShippingDetails object
		 */
		public static function parseShippingDetails(detailsData:XMLList):ShippingDetails
		{
			var shippingDetails:ShippingDetails = new ShippingDetails();

			shippingDetails.applyShippingDiscount = detailsData.ApplyShippingDiscount == "true" ? true : false;
			shippingDetails.calculatedShippingRate = parseCalculatedShippingRate(detailsData.CalculatedShippingRate);
			shippingDetails.defaultShippingCost = Number(detailsData.DefaultShippingCost);
			shippingDetails.getItFast = detailsData.GetItFast == "true" ? true : false;
			shippingDetails.insuranceDetails = parseInsuranceDetails(detailsData.InsuranceDetails);
			shippingDetails.insuranceFee = Number(detailsData.InsuranceFee);
			shippingDetails.insuranceOption = detailsData.InsuranceOption;
			shippingDetails.internationalInsuranceDetails = parseInsuranceDetails(detailsData.InternationalInsuranceDetails);
			for each (var internationalServiceOptionNode:XMLList in detailsData.InternationalShippingServiceOption)
				shippingDetails.internationalShippingServiceOption.push(parseShippingServiceOption(internationalServiceOptionNode));
			shippingDetails.paymentInstructions = detailsData.PaymentInstructions;
			shippingDetails.salesTax = parseSalesTax(detailsData.SalesTax);
			shippingDetails.sellingManagerSalesRecordNumber = int(detailsData.SellingManagerSalesRecordNumber);
			shippingDetails.shippingRateType = detailsData.ShippingRateType;
			for each (var serviceOptionNode:XMLList in detailsData.ShippingServiceOption)
				shippingDetails.shippingServiceOptions.push(parseShippingServiceOption(serviceOptionNode));
			shippingDetails.shippingType = detailsData.ShippingType;
			shippingDetails.taxTable = parseTaxTable(detailsData.TaxTable);
			shippingDetails.thirdPartyCheckout = detailsData.ThirdPartyCheckout == "true" ? true : false;

			return shippingDetails;
		}  // parseShippingDetails


		/**
		 * Creates a ShippingServiceOption object.
		 * 
		 * @param requirementsData The XML relevant to the ShippingServiceOption object
		 * @return A new ShippingServiceOption object
		 */
		public static function parseShippingServiceOption(optionData:XMLList):ShippingServiceOption
		{
			var shippingServiceOption:ShippingServiceOption = new ShippingServiceOption();

			shippingServiceOption.expeditedService = optionData.ExpeditedService == "true" ? true : false;
			shippingServiceOption.shippingInsuranceCost = Number(optionData.ShippingInsuranceCost);
			shippingServiceOption.shippingService = optionData.ShippingService;
			shippingServiceOption.shippingServiceAdditionalCost = Number(optionData.ShippingServiceAdditionalCost);
			shippingServiceOption.shippingServiceCost = Number(optionData.ShippingServiceCost);
			shippingServiceOption.shippingServicePriority = int(optionData.ShippingServicePriority);
			shippingServiceOption.shippingSurcharge = Number(optionData.ShippingSurcharge);
			shippingServiceOption.shippingTimeMax = int(optionData.ShippingTimeMax);
			shippingServiceOption.shippingTimeMin = int(optionData.ShippingTimeMin);
			for each (var locationNode:XML in optionData.ShipToLocation)
				shippingServiceOption.shipToLocation.push(locationNode.toString());

			return shippingServiceOption;
		}  // parseShippingServiceOption


		/**
		 * Parses the standard output fields in an eBay result and sets the member variables of
		 * the passed in object, ebayResult.
		 * 
		 * FINDING API ONLY
		 */
		public static function parseStandardFieldsFindingAPI(resultData:XML, ebayResult:EBayResult):void
		{
			namespace ns = "http://www.ebay.com/marketplace/search/v1/services";
			use namespace ns;
			
			//resultData.addNamespace(ns);
			ebayResult.ack = resultData..ack;

			ebayResult.correlationID = resultData.correlationID;
			
			//TODO : parse error warnings
			/*for each (var ebayErrorNode:XML in resultData.Errors)
			{
				ebayResult.errors.push(parseEBayError(XMLList(ebayErrorNode)));
			}*/
			ebayResult.hardExpirationWarning = resultData.hardExpirationWarning;
			ebayResult.timestamp = DateUtil.parseDateString(resultData.timestamp);
			ebayResult.version = resultData.version;			
			ebayResult.rawResult = resultData.toString();
		}  // parseStandardFields

		
		
		/**
		 * Creates a StoreFront object.
		 * 
		 * @param requirementsData The XML relevant to the StoreFront object
		 * @return A new StoreFront object
		 */
		public static function parseStoreFront(storeFrontData:XMLList):StoreFront
		{
			var storeFront:StoreFront = new StoreFront();

			storeFront.storeName = storeFrontData.StoreName;
			storeFront.storeURL = storeFrontData.StoreURL;

			return storeFront;
		}  // parseStoreFront


		/**
		 * Creates a TaxJurisdiction object.
		 * 
		 * @param requirementsData The XML relevant to the TaxJurisdiction object
		 * @return A new TaxJurisdiction object
		 */
		public static function parseTaxJurisdiction(jurisdictionData:XMLList):TaxJurisdiction
		{
			var taxJurisdiction:TaxJurisdiction = new TaxJurisdiction();

			taxJurisdiction.jurisdictionID = jurisdictionData.JurisdictionID;
			taxJurisdiction.salesTaxPercent = Number(jurisdictionData.SalesTaxPercent);
			taxJurisdiction.shippingIncludedInTax = jurisdictionData.ShippingIncludedInTax == "true" ? true : false;

			return taxJurisdiction;
		}  // parseTaxJurisdiction


		/**
		 * Creates a TaxTable object.
		 * 
		 * @param requirementsData The XML relevant to the TaxTable object
		 * @return A new TaxTable object
		 */
		public static function parseTaxTable(tableData:XMLList):TaxTable
		{
			var taxTable:TaxTable = new TaxTable();

			for each (var jurisdictionNode:XML in tableData.TaxJurisdiction)
				taxTable.taxJurisdiction.push(parseTaxJurisdiction(tableData.TaxJurisdiction));

			return taxTable;
		}  // parseTaxTable


		/**
		 * Creates a User object.
		 * 
		 * @param requirementsData The XML relevant to the User object
		 * @return A new User object
		 */
		public static function parseUser(userData:XMLList):EBayUser
		{
			var ebayUser:EBayUser = new EBayUser();

			ebayUser.aboutMePage = userData.User.AboutMePage;
			ebayUser.buyerInfo = parseBuyerInfo(userData.BuyerInfo);
			for each (var charityNode:XML in userData.User.CharityAffiliations)
				ebayUser.charityAffiliations.push(charityNode.toString());
			ebayUser.eBayGoodStanding = userData.User.eBayGoodStanding == "true" ? true : false;
			ebayUser.eBayWikiReadOnly = userData.User.eBayWikiReadOnly == "true" ? true : false;
			ebayUser.eiasToken = userData.User.EIASToken;			
			ebayUser.email = userData.User.Email;
			ebayUser.feedbackPrivate = userData.User.feedbackPrivate == "true" ? true : false;
			ebayUser.feedbackRatingStar = userData.User.FeedbackRatingStar;
			ebayUser.feedbackScore = int(userData.User.FeedbackScore);
			ebayUser.idVerified = userData.User.IDVerified == "true" ? true : false;
			ebayUser.motorsDealer = userData.User.MotorsDealer == "true" ? true : false;
			ebayUser.newUser = userData.User.NewUser == "true" ? true : false;
			ebayUser.payPalAccountLevel = userData.User.PayPalAccountLevel;
			ebayUser.payPalAccountStatus = userData.User.PayPalAccountStatus;
			ebayUser.payPalAccountType = userData.User.PayPalAccountType;
			ebayUser.positiveFeedbackPercent = Number(userData.User.PositiveFeedbackPercent);
			ebayUser.registrationAddress = parseAddress(userData.User.RegistrationAddress);
			ebayUser.registrationDate = DateUtil.parseDateString(userData.User.RegistrationDate);
			ebayUser.restToken = userData.User.RESTToken;
			ebayUser.sellerInfo = parseSellerInfo(userData.User.SellerInfo);
			ebayUser.sellerPaymentMethod = userData.User.SellerPaymentMethod;
			ebayUser.site = userData.User.Site;
			for each (var skypeIDNode:XML in userData.User.SkypeID)
				ebayUser.skypeID.push(skypeIDNode.toString());
			ebayUser.status = userData.User.Status;
			ebayUser.tuvLevel = userData.User.TUVLevel;
			ebayUser.uniqueNegativeFeedbackCount = int(userData.User.UniqueNegativeFeedbackCount);
			ebayUser.uniquePositiveFeedbackCount = int(userData.User.UniquePositiveFeedbackCount);
			ebayUser.userID = userData.User.UserID;
			ebayUser.userIDChanged = userData.User.UserIDChanged == "true" ? true : false;
			ebayUser.userIDLastChanged = DateUtil.parseDateString(userData.User.UserIDLastChanged);
			for each (var userSubscriptionNode:XML in userData.User.UserSubscription)
				ebayUser.userSubscription.push(userSubscriptionNode.toString());
			ebayUser.vatID = userData.User.VATID;
			ebayUser.vatStatus = userData.user.VATStatus;			

			return ebayUser;
		}  // parseUser


		/**
		 * Creates a VATDetails object.
		 * 
		 * @param requirementsData The XML relevant to the VATDetails object
		 * @return A new VATDetails object
		 */
		public static function parseVATDetails(detailsData:XMLList):VATDetails
		{
			var vatDetails:VATDetails = new VATDetails();

			//vatDetails.vatPercent = Number(detailsData.VATPercent);

			return vatDetails;
		}  // parseVATDetails


		/**
		 * Creates a VerifiedUserRequirements object.
		 * 
		 * @param requirementsData The XML relevant to the VerifiedUserRequirements object
		 * @return A new VerifiedUserRequirements object
		 */
		public static function parseVerifiedUserRequirements(requirementsData:XMLList):VerifiedUserRequirements
		{
			var verifiedUserRequirements:VerifiedUserRequirements = new VerifiedUserRequirements();

			verifiedUserRequirements.minimumFeedbackScore = int(requirementsData.MinimumFeedbackScore);
			verifiedUserRequirements.verifiedUser = requirementsData.VerifiedUser == "true" ? true : false;

			return verifiedUserRequirements;
		}  // parseVerifiedUserRequirements


		/**
		 * Creates a WatchList object.
		 * 
		 * @param requirementsData The XML relevant to the WatchList object
		 * @return A new WatchList object
		 */
		public static function parseWatchList(listData:XMLList):WatchList
		{
			var watchList:WatchList = new WatchList();

			for each (var watchListNode:XML in listData.ItemArray.Item)
				watchList.watchListItem.push(parseWatchListItem(XMLList(watchListNode)));
			watchList.paginationResult = parsePaginationResult(listData.PaginationResult);

			return watchList;
		}  // parseWatchList


		/**
		 * Creates a WatchListItem object.
		 * 
		 * @param requirementsData The XML relevant to the WatchListItem object
		 * @return A new WatchListItem object
		 */
		public static function parseWatchListItem(itemData:XMLList):WatchListItem
		{
			var watchListItem:WatchListItem = new WatchListItem();

			watchListItem.buyItNowPrice = Number(itemData.BuyItNowPrice);
			watchListItem.eBayNotes = itemData.eBayNotes;
			watchListItem.itemID = itemData.ItemID;
			watchListItem.listingDetails = parseListingDetails(itemData.ListingDetails);
			watchListItem.listingType = itemData.ListingType;
			watchListItem.pictureDetails = parsePictureDetails(itemData.PictureDetails);
			watchListItem.quantityAvailable = int(itemData.QuantityAvailable);
			watchListItem.seller = parseSellerInfo(itemData.Seller);
			watchListItem.sellingStatus = parseSellingStatus(itemData.SellingStatus);
			watchListItem.site = itemData.Site;
			watchListItem.startPrice = Number(itemData.StartPrice);
			watchListItem.timeLeft = itemData.TimeLeft;
			watchListItem.title = itemData.Title;

			return watchListItem;
		}  // parseWatchListItem
	}  // class declaration
}  // package