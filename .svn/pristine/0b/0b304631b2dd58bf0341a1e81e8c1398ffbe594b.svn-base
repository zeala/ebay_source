/*
Adobe Systems Incorporated(r) Source Code License Agreement
Copyright(c) 2006 Adobe Systems Incorporated. All rights reserved.
	
Please read this Source Code License Agreement carefully before using
the source code.
	
Adobe Systems Incorporated grants to you a perpetual, worldwide, non-exclusive,
no-charge, royalty-free, irrevocable copyright license, to reproduce,
prepare derivative works of, publicly display, publicly perform, and
distribute this source code and such derivative works in source or
object code form without any attribution requirements.
	
The name "Adobe Systems Incorporated" must not be used to endorse or promote products
derived from the source code without prior written permission.
	
You agree to indemnify, hold harmless and defend Adobe Systems Incorporated from and
against any loss, damage, claims or lawsuits, including attorney's
fees that arise or result from your use or distribution of the source
code.
	
THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT
ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. ALSO, THERE IS NO WARRANTY OF
NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT. IN NO EVENT SHALL MACROMEDIA
OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/



package com.adobe.webapis.ebay.events
{
	import flash.events.Event;
	import com.adobe.webapis.events.ServiceEvent;

	/**
	 * Event type that is broadcast when results from eBay API
	 * calls are returned.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Charles Bihis, Adobe Systems Incorporated
	 */
	public class EBayResultEvent extends ServiceEvent
	{
		/**
		 * The event type for the event broadcast when results
		 * have been loaded in response to an AddToWatchList API call.
		 * 
		 * @eventType onAddToWatchList
		 * 
		 * @see http://developer.ebay.com/DevZone/SOAP/docs/Reference/eBay/io_AddToWatchList.html
		 */
		public static const ON_ADD_TO_WATCH_LIST:String = "onAddToWatchList";

		/**
		 * The event type for the event broadcast when item details
		 * have been loaded in response to a GetItem API call.
		 * 
		 * @eventType onGetItem
		 * 
		 * @see http://developer.ebay.com/DevZone/SOAP/docs/Reference/eBay/io_GetItem.html
		 */
		public static const ON_GET_ITEM:String = "onGetItem";

		/**
		 * The event type for the event broadcast when buying results
		 * have been loaded in response to a GetMyeBayBuying API call.
		 * 
		 * @eventType onGetMyeBayBuying
		 * 
		 * @see http://developer.ebay.com/DevZone/SOAP/docs/Reference/eBay/io_GetMyeBayBuying.html
		 */
		public static const ON_GET_MY_EBAY_BUYING:String = "onGetMyeBayBuying";

		/** 
		 * The event type for the event broadcast when search results
		 * have been loaded in response to a GetSearchResults API call.
		 * 
		 * @eventType onGetSearchResults
		 * 
		 * @see http://developer.ebay.com/DevZone/SOAP/docs/Reference/eBay/io_GetSearchResults.html
		 */
		public static const ON_GET_SEARCH_RESULTS:String = "onGetSearchResults";

		/**
		 * The event type for the event broadcast when user details
		 * have been loaded in response to a GetUser API call.
		 * 
		 * @eventType onGetUser
		 * 
		 * @see http://developer.ebay.com/DevZone/SOAP/docs/Reference/eBay/io_GetUser.html
		 */
		public static const ON_GET_USER:String = "onGetUser";

		/**
		 * The event type for the event broadcast when results
		 * have been loaded in response to a PlaceOffer API call.
		 * 
		 * @eventType onPlaceOffer
		 * 
		 * @see http://developer.ebay.com/DevZone/SOAP/docs/Reference/eBay/io_PlaceOffer.html
		 */
		public static const ON_PLACE_OFFER:String = "onPlaceOffer";

		/**
		 * The event type for the event broadcast when results
		 * have been loaded in response to a RemoveFromWatchList API call.
		 * 
		 * @eventType onRemoveFromWatchList
		 * 
		 * @see http://developer.ebay.com/DevZone/SOAP/docs/Reference/eBay/io_RemoveFromWatchList.html
		 */
		public static const ON_REMOVE_FROM_WATCH_LIST:String = "onRemoveFromWatchList";


		/**
		 * Constructor for EBayResultsEvent class.
		 * 
		 * @param type The type of event that the instance represents.
		 */
		public function EBayResultEvent(type:String,
										bubbles:Boolean = false,
										cancelable:Boolean = false):void
		{
			super(type, bubbles, cancelable);
		}  // eBayEvent


		/**
		 * Override of the clone function in the parent class <code>ServiceEvent</code>.
		 * 
		 * @return A new <code>EBayResultsEvent</code> object.
		 */
		public override function clone():Event
		{
			return new EBayResultEvent(type);
		}  // clone
	}  // class declaration
}  // package