﻿package com.ebayproject.components.imageScroll{		import flash.display.Sprite;	import flash.events.Event;		public class DisplayItem extends Sprite {				protected static const FADE_RATE	:Number 	= 0.05;		protected static const ALPHA_ON		:Number 	= 1;		protected static const ALPHA_OFF	:Number 	= 0.8;				public function DisplayItem(){					}				protected function fadeIn(e:Event):void {			if(alpha>=ALPHA_ON){				alpha = ALPHA_ON;				removeEventListener(Event.ENTER_FRAME, fadeIn);				return			}			alpha += FADE_RATE;		}				protected function fadeOut(e:Event):void {			if(alpha<=ALPHA_OFF){				alpha = ALPHA_OFF;				removeEventListener(Event.ENTER_FRAME, fadeOut);				return;			}			alpha -= FADE_RATE;		}			}}