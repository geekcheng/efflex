package org.efflex.mx.pairViewStackEffects.effectClasses
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import mx.core.UIComponent;
	
	import org.efflex.mx.pairViewStackEffects.PairViewStackTweenEffect;
	import org.efflex.mx.pairViewStackEffects.Slide;

	public class SlideInstance extends PairViewStackTweenEffectInstance
	{
		
		public var fromDirection 				: String;
		public var toDirection 					: String;
		
		
		
		public function SlideInstance( target:UIComponent )
		{
			super( target );
		}
		
		override protected function playPairViewStackEffect():void
        {
        	super.playPairViewStackEffect();
        	
			_hidding = new Bitmap( snapShot );
			_showing = new Bitmap( BitmapData( bitmapDatum[ selectedIndexTo ] ) );
        }
        
        override protected function onPairTweenUpdate( hideValue:Number, showValue:Number ):void
		{
			super.onPairTweenUpdate( hideValue, showValue );
			
			switch( fromDirection )
			{
				case Slide.DOWN :
				{
					_hidding.y = contentHeight * hideValue;
					break;
				}
				case Slide.UP :
				{
					_hidding.y = -contentHeight * hideValue;
					break;
				}
				case Slide.LEFT :
				{
					_hidding.x = contentWidth * hideValue;
					break;
				}
				case Slide.RIGHT :
				{
					_hidding.x = -contentWidth * hideValue;
					break;
				}
			}
			
			switch( toDirection )
			{
				case Slide.DOWN :
				{
					_showing.y = -contentHeight * ( 1 - showValue );
					break;
				}
				case Slide.UP :
				{
					_showing.y = contentHeight * ( 1 - showValue );
					break;
				}
				case Slide.LEFT :
				{
					_showing.x = -contentWidth * ( 1 - showValue );
					break;
				}
				case Slide.RIGHT :
				{
					_showing.x = contentWidth * ( 1 - showValue );
					break;
				}
			}
		}
		
	}
}