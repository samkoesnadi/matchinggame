package  {
	import flash.display.*;
	import flash.events.*;
	public class MatchingGame extends MovieClip{
		private static const boardWidth:uint = 6;
        private static const boardHeight:uint = 6;
        private static const cardHorizontalSpacing:Number = 52;
        private static const cardVerticalSpacing:Number = 52;
        private static const boardOffsetX:Number = 120;
        private static const boardOffsetY:Number = 45;
		private var firstCard:Card;
		private var secondCard:Card;
		
	public function MatchingGame() :void{
			// constructor code
			var cardList:Array=new Array();
			for(var i:uint=0;i<boardWidth*boardHeight/2;i++){
				cardList.push(i);
				cardList.push(i);
			}
			for(var x:uint=0;x<6;x++){
				for(var y:uint=0;y<6;y++){
					var thisCard:Card=new Card();
					thisCard.stop();
					thisCard.x=x*52+120
					thisCard.y=y*52+45
					var r:uint=Math.floor(Math.random()*cardList.length);
					thisCard.cardface = cardList[r];
					cardList.splice(r,1);
					thisCard.addEventListener(MouseEvent.CLICK,clickCard);
					thisCard.buttonMode=true;
					addChild(thisCard);
				}
			}
		}
		public function clickCard(event:MouseEvent){
				var thisCard:Card=(event.currentTarget as Card);
				if(firstCard==null){
					firstCard=thisCard;
					thisCard.gotoAndStop(thisCard.cardface+2);
				}else if(firstCard==thisCard){
					firstCard=null;
					thisCard.gotoAndStop(1);
				}else if(secondCard==null){
					secondCard=thisCard;
					thisCard.gotoAndStop(thisCard.cardface+2);
					if(firstCard.cardface==secondCard.cardface){
					removeChild(firstCard);
					removeChild(secondCard);
					firstCard=null;
					secondCard=null;
					}
				}else{
					firstCard.gotoAndStop(1);
					secondCard.gotoAndStop(1);
					secondCard = null;
					firstCard = thisCard;
					firstCard.gotoAndStop(thisCard.cardface+2);
				}
			}
	}
}