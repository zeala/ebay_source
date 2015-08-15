package ebayApp.services.util
{
	import mx.collections.ArrayCollection;
	
	import dto.SiteObj;
	import dto.codeTypes.SiteCodeType;

	public class SitesUtil
	{
		
		
		public static function getAllSites () : ArrayCollection
		{
			var ac : ArrayCollection = new ArrayCollection();
			
			for ( var i:int = 0 ; i< SiteCodeType.sites.length; i ++)
			{
				var siteObj : SiteObj = new SiteObj();
				var item : Object = SiteCodeType.sites[i]
				siteObj.abbreviation = item.abbreviation;
				siteObj.currency = item.currency;
				siteObj.isEng = item.isEng;
				siteObj.siteId = item.siteId;
				siteObj.siteName = item.siteName;
				siteObj.value = item.value;
				siteObj.globalId = item.globalId;
				ac.addItem( siteObj);
			}
			
			
			return ac;
		}
		
		public static function allEngSites () : ArrayCollection
		{
			var ac : ArrayCollection = new ArrayCollection();
			
			for ( var i:int = 0 ; i< SiteCodeType.sites.length; i ++)
			{
				var item : Object =  SiteCodeType.sites[i];
				if ( item.isEng )
				{
					var siteObj : SiteObj = new SiteObj();
					siteObj.abbreviation = item.abbreviation;
					siteObj.currency = item.currency;
					siteObj.isEng = item.isEng;
					siteObj.siteId = item.siteId;
					siteObj.siteName = item.siteName;
					siteObj.value = item.value;
					siteObj.globalId = item.globalId;
					ac.addItem( siteObj);
				}
			}
			
			return ac;
		}
	}
}