package
{
	import flash.events.Event;
	import flash.geom.ColorTransform;

	public class Boss
	{
		public var model:MC_boss;
		public var scale:Number = 1;
		public var speed:int = 3;
		public var direction:int = 1;
		public var lifes:int = 3;
		
		public var currentTimeToShoot:int = 0;
		public var timeToShoot:int = 1500;
		
		public var checkRespawn:Boolean;
		
		
		public var originalColor:ColorTransform;
		public var effectColor:ColorTransform;
		
		public var timeToReturnOriginalColor:int = 50;
		public var currentTimeToReturnOriginalColor:int = 0;
		
		public function Boss()
		{
		}
		
		public function spawn ():void
		{
			model = new MC_boss;
			Main.mainStage.addChild(model);
			model.scaleX = model.scaleY = scale;
			//model.mc_checkRight.alpha = 0;
			
			effectColor = new ColorTransform();
			effectColor.color = 0xFFFFFF;
			
			originalColor = model.transform.colorTransform;
		}
		
		
		public function update():void
		{
			if(model != null)
			{
				move();	
				timerToShoot();
			
				if (checkRespawn)
				{
					for (var l:int =0 ; l < Main.vectorEnemyBullets.length; l++) 
					{
						if (Main.vectorEnemyBullets[l] !=null)
						{
							Main.vectorEnemyBullets[l].update();
						}				
					}		
				}
			}
		}
		
		public function move():void
		{
			model.x += speed * direction; 
		}
			
		public function timerToShoot():void
		{
			currentTimeToShoot += 1000 / Main.mainStage.frameRate;
			if(currentTimeToShoot >= timeToShoot)
			{	
				var numBullets:int = 5;
				var fruitAngle:Number = 1;
				for(var i:int=-numBullets/2; i<numBullets/2; i++)
				{
					Main.myEnemyBullet = new EnemyBullet ();
					Main.myEnemyBullet.spawn(model.y + 90, model.x + 10);
					Main.myEnemyBullet.speedX = i * fruitAngle;
				}
					currentTimeToShoot = 0
					if (Main.myEnemyBullet.spawneo)
					{
						checkRespawn = true;
					}
				
					
			}
		}
		
		public function destroy():void
		{
			
			lifes--;
			if (lifes <= 0)
			{
				Main.win();
			}
			if(lifes > 0)
			{
				model.transform.colorTransform = effectColor;
				Main.mainStage.addEventListener(Event.ENTER_FRAME,updateTimeToChangeColor);
			}
		}
		
		public function updateTimeToChangeColor(e:Event):void
		{
			currentTimeToReturnOriginalColor += 1000 / Main.mainStage.frameRate;
			if(currentTimeToReturnOriginalColor >= timeToReturnOriginalColor)
			{
				Main.mainStage.removeEventListener(Event.ENTER_FRAME, updateTimeToChangeColor);
				model.transform.colorTransform = originalColor;
				currentTimeToReturnOriginalColor = 0;
			}
		}
	}
}