package dto
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ListingInfo extends EventDispatcher
	{
		public var bestOfferEnabled : Boolean;
		
		public var buyItNowAvailable : Boolean;
		
		public var buyItNowPrice : Number;
		
		public var convertedBuyItNowPrice : Number;
		
		
		public var gift : Boolean;
		
		public var listingType : String; //ListingType
		
		public var startTime : Date;
		
		//---------------------------
		// endTime
		//---------------------------
		private var _endTime : Date;
		[Bindable("endTimeChange")]
		public function get endTime (): Date //YYYY-MM- DDTHH:MM:SS.SSSZ
		{
			return _endTime;
		}
		public function set endTime( val:Date):void
		{
			_endTime = val;
			dispatchEvent( new Event("endTimeChange"));
			setupEndTimeTimer();
		}
		
		//---------------------------
		// time left
		//---------------------------
		private var _timeLeftString : String;
		[Bindable("timeLeftStringChange")]
		public function get timeLeftString():String
		{
			return _timeLeftString;
		}
		public function set timeLeftString(val:String):void
		{
			_timeLeftString = val;
			dispatchEvent(new Event("timeLeftStringChange"));
		}
		
		//---------------------------
		// end time timer
		//---------------------------
		private var endTimeTimer : Timer;
		
		private function setupEndTimeTimer():void
		{
			if ( !endTimeTimer ) endTimeTimer = new Timer(1000);
			else
			{
				endTimeTimer.stop();
				endTimeTimer.removeEventListener( TimerEvent.TIMER, timerEventHandler );
			}
			
			endTimeTimer.addEventListener(TimerEvent.TIMER, timerEventHandler ); 
			endTimeTimer.start();
		}
		
		private function timerEventHandler( event : TimerEvent ) : void
		{
			var now : Date = new Date();
			var timeUTC : Number = now.getTime();
			var timeDiff: Number = endTime.getTime() - timeUTC;
			
			var formattedTimeString : String = formatTimeString( timeDiff );
			timeLeftString = formattedTimeString;
			//trace("\n timeDiff : " + timeDiff );
		}
		
		public static function formatTimeString ( ms : Number ) : String
		{
			var str : String = "";
			var totalSec : Number = Math.round( ms / 1000 );
		
			//trace("\n val : " + ms );
			var days : int = Math.floor( ms / MS_IN_DAY );
			
			if ( days > 0 )
			{
				var dayStr : String = days > 1 ? "days" : "day";
				str +=  days + "d";
			}
			var leftMS : Number = ms % MS_IN_DAY;
			//trace(" left after day : " + leftMS );
			
			var hours : int = Math.floor( leftMS / MS_IN_HOUR );
			
			if ( hours > 0 )
			{
				str += " " + hours + "h";
				leftMS = leftMS % MS_IN_HOUR;
			}
			
			//trace("left after hour : " + leftMS );
			var minutes : int = Math.floor( leftMS/ MS_IN_MINUTE );
			
			if ( minutes > 0 )
			{
				str += " " + minutes + "m";
				leftMS = leftMS % MS_IN_MINUTE;
			}
			
			//trace(" left after minute ; " + leftMS );
			
			
			if ( hours > 0 || days > 0 )
			{	
			}
			else
			{
				var seconds : int = Math.floor( leftMS / 1000 );
				
				str += " " + seconds + "s";
			}
			
			//trace("\n ---- str : " + str );
			return str;
		}
		
		public static const MS_IN_DAY : Number = 24 * 60 * 60 * 1000;
		public static const MS_IN_HOUR : Number = 60 * 60 * 1000;
		public static const MS_IN_MINUTE : Number = 60 * 1000;
	}
}