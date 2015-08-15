package com.pricope.miti.book
{
	import com.rubenswieringa.book.Book;
	import com.rubenswieringa.book.BookError;
	import com.rubenswieringa.book.BookEvent;
	import com.rubenswieringa.book.Page;
	import com.rubenswieringa.book.limited;
	import com.rubenswieringa.managers.StateManager;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	
	use namespace limited;

	[Event(name="pageAdded", type="mx.events.PropertyChangeEvent")]
	[Event(name="pageRemoved", type="mx.events.PropertyChangeEvent")]
	
	public class LargeBook extends Book
	{

		
		protected var _currentIndex:Number = 0;
		[Bindable]
		public function set currentIndex(val:Number):void {
			_currentIndex = val;
		} 
		public function get currentIndex():Number {
			return _currentIndex;
		}
		
		protected var backReplaceIndex:Number = -1;
		protected var fwdReplaceIndex:Number = -1;
		
		protected var _gotoPageIndex:Number = -2;
		public function set gotoPageIndex(val:Number):void {
			trace ("Go To page Index: " + val);
			_gotoPageIndex = val;
		} 
		public function get gotoPageIndex():Number {
			return _gotoPageIndex;
		}

		public var pageArray:Array = new Array();

		public function LargeBook()
		{
			addEventListener(FlexEvent.CREATION_COMPLETE,copyPages);
			addEventListener(BookEvent.PAGE_TURNED,pageFlip2);
		}

		
	
		
			private function copyPages(event:Event):void {
				pageArray = pages.toArray();
				var i:int;
				for (i = 7;i < pageArray.length - 1;i+=2) {
					removePair(7);
				}
				if (StateManager.instance.getState(this) >= StateManager.UPDATE_COMPLETE){
					this.refreshViewStacks();
				}
			}
			public function pageFlip2(event:BookEvent): void {
				var index:Number = event.page.index;
				//trace("Start:" + index + ":" + currentIndex);
				if (index % 2 ==0) {
					currentIndex += 2;
					if ((index > 2) && (currentIndex + 2 < pageArray.length)) {
						//trace("AddingPair" + (currentIndex + 1) + ":" + (currentIndex + 2) + " starting at " + (index + 3));
						addPair(pageArray[currentIndex + 1],pageArray[currentIndex + 2],index + 3);
						
					}	
					if ((index > 2) && (currentIndex + 2 < pageArray.length)) {
						//trace("Removing Pair from" + (index - 3));
						removePair(index - 3);
					}
				} else {
					currentIndex -= 2;
					if ((currentIndex >=3) && (index < 5)) {
						//trace("AddingPair" + (currentIndex - 3) + ":" + (currentIndex  -2) + " starting at " + (index - 2));
						addPair(pageArray[currentIndex - 3],pageArray[currentIndex - 2],index - 2);
						
					}	
					if ((currentIndex >= 3) && (index < 5)) {
						//trace("Removing Pair from" + (index + 4));
						removePair(index + 4);
					}
				}
				tracePageNames();
				
				var i:int;
				
				if (backReplaceIndex != -1) {
					//trace("Back Replace");
					i = 1;
					var endFillIndex:int = this.currentPage;
					for (i = 1; i < endFillIndex; i+= 2) {
						removePair(i);
						tracePageNames();
						addPair(pageArray[backReplaceIndex - endFillIndex + 2 + i],pageArray[backReplaceIndex + 3 - endFillIndex + i],i);
						tracePageNames();
					} 
					backReplaceIndex = -1;
				}
				if (fwdReplaceIndex != -1) {
					//trace("FWD Replace");
					i = currentPage;
					var startFillIndex:int = currentPage;
					for (i = startFillIndex; i < 5;i+=2) {
						removePair(i + 2);
						tracePageNames();
						addPair(pageArray[fwdReplaceIndex + i - startFillIndex],pageArray[fwdReplaceIndex + i - startFillIndex + 1],i + 2);
						tracePageNames();
					}
					fwdReplaceIndex = -1;
				}
				if (gotoPageIndex != - 2) {
					var tm:Timer = new Timer(100,1);
					var tmN:Number = gotoPageIndex;
					tm.addEventListener(TimerEvent.TIMER,function ():void {
						jumpToPage(tmN);
					});
					tm.start();
					
				} 
				
				//trace("End:" + index + ":" + currentIndex);
				
			}
			
			public function round(n:Number):Number {
				if (n < 0) {
					return (n ==int(n)) ? n : int(n) - 1;
				} else {
					return int(n);
				}
			}
			
			public function jumpToPage(index:Number):void {
				if (this.autoFlipActive) {
					trace ("GO TO PAGE NOT DONE!");
					return;
				}
				trace("GOTO PAGE:" + index);
				gotoPageIndex = -2;
				var oddIndex:Number = round((index  -1 )/ 2)*2 + 1;

				trace("OddIndex:" + oddIndex + ": Current Index: " + currentIndex);
				
				var rpIndex:Number;
				var tm:Timer;
				
				if (!isNaN(oddIndex)) {
					if (oddIndex > currentIndex) {
						if (oddIndex >= pageArray.length - 2) {
							gotoPageIndex = oddIndex;
						}
						if (this.currentPage < 3) {
							gotoPageIndex = oddIndex;
							
						} else if (currentIndex < pageArray.length - 3) {
							rpIndex = oddIndex;
							if (oddIndex >= pageArray.length - 2) {
								rpIndex = pageArray.length - 3;
							}
							this.removePair(5);
							this.tracePageNames();
							this.addPair(pageArray[rpIndex], pageArray[rpIndex+1],5);
							backReplaceIndex = rpIndex - 2;
							currentIndex = rpIndex - 1;
						}
						
						tm = new Timer(100,1);
						tm.addEventListener(TimerEvent.TIMER,function ():void {
							nextPage();
						});
						tm.start();
						
					}
					if (oddIndex < currentIndex - 2) {
						if (oddIndex < 0) {
							gotoPageIndex = oddIndex;
						}
						if (this.currentPage > 3) {
							gotoPageIndex = oddIndex;
						} else if (currentIndex > 5 ) {
							rpIndex = oddIndex;
							if (oddIndex < 0) {
								rpIndex = 1;
							}
							this.removePair(1);
							this.tracePageNames();
							this.addPair(pageArray[rpIndex], pageArray[rpIndex+1],1);
							fwdReplaceIndex = rpIndex + 2;
							currentIndex = rpIndex + 3;
						}
						tm = new Timer(100,1);
						tm.addEventListener(TimerEvent.TIMER,function ():void {
							prevPage();
						});
						tm.start();
						}
				}
				this.tracePageNames();
			}

		private function justRemovePage(index:int):void {
			if (index < 0 || index > this._pages.length-1){
				throw new ArgumentError(BookError.OUT_OF_BOUNDS);
			}
			// define Page:
			var page:Page = Page(this._pages.getItemAt(index));
			// remove Page from left or right ViewStack:
			if (index%2 == 1){
				this.pageL.removeChild(page);
			}else{
				this.pageR.removeChild(page);
			}
			// remove Page from Array and clear book property:
			this._pages.removeItemAt(index);
			page.setBook(null);
			// adjust _currentPage if necessary:
			if (this._currentPage > this._pages.length-1){
				this._currentPage -= 2;
			}
			var pageRemovedEvent : PropertyChangeEvent = new PropertyChangeEvent("pageRemoved");
			pageRemovedEvent.newValue = page;
			dispatchEvent( pageRemovedEvent );
			
		}
		
		public function initiateDragCorner():void
		{
			this.endPageFlip();
		}
		
		public function removePair(index:int):void {
			// throw error if index is out of bounds:
			justRemovePage(index + 1);
//			if (index <= this._pages.length-1){
//				this.jumpViewStacks(index);
//			}
			justRemovePage(index);
//			if (index <= this._pages.length-1){
//				this.jumpViewStacks(index);
//			}
			if (this._currentPage > index + 1) {
				this._currentPage -= 2;
				this.autoFlipIndex -= 2;
				
			}
			// make sure all other Pages are in the right ViewStacks:
			if (StateManager.instance.getState(this) >= StateManager.UPDATE_COMPLETE){
				this.refreshViewStacks();
			}
		}
		
		public function justAddChild(child:DisplayObject, index:int):void {
			var page:Page = Page(child);
			// correct index so that it is within bounds:
			if (index < 0)					index = 0;
			if (index > this._pages.length)	index = this._pages.length;
			// initialize Page:
			var pageAddedEvent : PropertyChangeEvent = new PropertyChangeEvent("pageAdded");
			pageAddedEvent.newValue = page;
			dispatchEvent( pageAddedEvent );
			
			this.initPage(page, index);
			// add Page to left or right ViewStack:
			
			try
			{
				if (index%2 == 1){
					this.pageL.addChildAt(child, this.generateStackIndex(page));
				}else{
					this.pageR.addChildAt(child, this.generateStackIndex(page));
				}
			}
			catch ( e:Error )
			{
				trace("\n error : " + e.message );
			}
			
			
		}
		public function addPair(child1:DisplayObject, child2:DisplayObject,index:int):void {
				justAddChild(child1,index);
				justAddChild(child2,index+1);

				//trace("addPair: " + this._currentPage + ":" + index);
				if (this._currentPage >= index) {
					this._currentPage += 2;
					this.autoFlipIndex += 2;
					
				}
				
				if (StateManager.instance.getState(this) == StateManager.UPDATE_COMPLETE){
					this.refreshViewStacks();
				}
		}
		
		public function tracePageNames():void {
			var i:int;
			var tr:String = "";
			var length:int;
			length = 20;
			if (pages.length < length) {
				length = pages.length;
			}
			for ( i = 0;i < length;i++) {
				tr += pages[i].name + "|";
			}
			trace(tr);
		}

	}
}