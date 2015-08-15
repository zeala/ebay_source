package model
{
	import com.ebayproject.controllers.IPopupController;
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.core.IFlexDisplayObject;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	
	public class PopupController extends EventDispatcher implements IPopupController
	{
		private var popup : IFlexDisplayObject;
		
		private static var instance : PopupController;
		
		public static function getInstance():PopupController
		{
			if ( !instance )
			{
				instance = new PopupController();
			}
			return instance;
		}
		
		public function addPopup(
			popup : IFlexDisplayObject,
			target : DisplayObject,
			mouseMoveEnabled : Boolean = true ) : IFlexDisplayObject
		{
			if ( this.popup )
			{
				PopUpManager.removePopUp( this.popup );
			}
			PopUpManager.addPopUp( 
				popup as IFlexDisplayObject, target );
			
			this.popup = popup;
			
			positionPopupRelativeToAnchor( target );
			
			if ( mouseMoveEnabled && target )
			{
				target.addEventListener(
					MouseEvent.MOUSE_MOVE, targetMouseMoveHandler, false, 0, true );
				
				target.addEventListener(
					MouseEvent.MOUSE_OUT, targetMouseOutHandler, false, 0, true );
			}
			
			popup.addEventListener(
				MouseEvent.MOUSE_OUT, popupMouseOutHandler, false, 0, true );
			
			return popup;
		}
		
		public function removePopup():void
		{
			if ( this.popup )
			{
				PopUpManager.removePopUp( this.popup );
			}
		}
		
		private function positionPopupRelativeToAnchor( target : DisplayObject ) : void
		{
			var localTargetPoint : Point = new Point( target.mouseX, target.y);
			var globalTargetPoint : Point = target.localToGlobal( localTargetPoint );
			
			trace("\n target.y : " + target.y );
			trace("target.name : " + target.name );
			popup.x = globalTargetPoint.x - (popup.width - target.width ) /2;
			popup.y = - popup.height + globalTargetPoint.y;

		}
		
		private function checkMouseOverPopup() : Boolean
		{
			var result : Boolean;
			if ( popup.mouseX < 0 || popup.mouseX > popup.width 
				|| popup.mouseY < 0 || popup.mouseY > popup.height )
			{
				removePopup();
			}
			return result;
		}
		
		//-----------------------------------------------------------------------------------------
		//
		//	Event Handlers
		//
		//-----------------------------------------------------------------------------------------
	
		private function popupMouseOutHandler ( event : MouseEvent ) : void
		{
			checkMouseOverPopup();
		}
		
		private function targetMouseMoveHandler ( event : MouseEvent ) : void
		{
			//positionPopupRelativeToAnchor( event.target as DisplayObject );
		}
		
		private function targetMouseOutHandler(event : MouseEvent) : void
		{
			var t : UIComponent = UIComponent( event.target );
			t.removeEventListener( MouseEvent.MOUSE_MOVE, targetMouseMoveHandler );
			
			checkMouseOverPopup();
		}
	}
}