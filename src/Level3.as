package
{
	public class Level3
	{
		public var level : MC_level3;
		
		public function Level3()
		{
		}
		
		public function spawn ():void
		{
			level = new MC_level3;
			Main.mainStage.addChild(level);
			level.y = Main.mainStage.height /2 - 2200;
			level.x = Main.mainStage.width /2 - 50;
			loadPlatforms();
			loadEnemysRespawnPoints();
			Main.myHero = new Hero();
			Main.myHero.spawn();
			//Main.myHero.model.x
			heroRespawnPointLV3();
			Main.myBoss = new Boss();
			Main.myBoss.spawn();
			Main.myBoss.model.x = 500;
			Main.myBoss.model.y = 100;
			for(var i:int = 0 ; i < 2; i++)
			{
				Main.myEnemy = new Enemy();
				Main.myEnemy.spawn();
				if(i == 0)
				{
					Main.myEnemy.model.x = 300;
					Main.myEnemy.model.y = 500;
				}
				if(i == 1)
				{
					Main.myEnemy.model.x = 600;
					Main.myEnemy.model.y = 300;
				}
				//	}
			}
		}
		
		public function heroRespawnPointLV3 ():void
		{
			Main.myHero.model.x = 530;
			Main.myHero.model.y = 570;
		}
		
		public function loadPlatforms():void
		{
			for(var i:int=0; i<level.numChildren; i++)
			{
				if(level.getChildAt(i).name == "mc_platform")
				{
					Main.platforms.push( level.getChildAt(i) );
					//level.getChildAt(i).alpha = 0;
				}
			}
		}
		public function loadEnemysRespawnPoints():void
		{
			for(var i:int=0; i<level.numChildren; i++)
			{
				if(level.getChildAt(i).name == "mc_enemyRespawnPoint")
				{
					Main.enemysRespawnPoints.push( level.getChildAt(i) );
					//level.getChildAt(i).alpha = 0;
				}
			}
		}
	}
}