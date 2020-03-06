Class = "";

maxHealth = 100;
currentHealth = maxHealth;
previousHealth = currentHealth

baseAttack = 0;
attackTimer = 0;

baseDefense = 0;
defenseTimer = 0;

baseSpeed = 0;
speedTimer = 0;

hunger = 0;
maxhunger = 100;

healthMultiplier = 0;
attackMultiplier = 0;
defenseMultiplier = 0;
speedMultiplier = 0

move_1 = [0, 0];
move_2 = [0, 0];

timer_m1 = 0;
timer_m2 = 0;

stallHunger = false;
stallHungerTimer = 0;

healthThisFrame = currentHealth;
flash = 0;
shaderBuff = 0;

global.fightStarted = true;
startFight = true;

var sf = oDisplayManager.scale_factor*1.2
win1_x = (sprite_get_width(sBattleWindowOutline))/sf
win1_y = sprite_get_height(sBattleWindowOutline)/sf
battleWindow = instance_create_depth(win1_x, win1_y, -y, oBattlePortrait)
battleWindow.owner = self
battleWindow.scale_down = sf

// ------------------------------------- MULTIPLE BATTLE WINDOWS
//battleWindow2 = instance_create_depth(win1_x*2+buff, win1_y, -y, oBattlePortrait)
//battleWindow2.owner = self
//battleWindow2.scale_down = sf
//battleWindow3 = instance_create_depth(win1_x*4, win1_y, -y, oBattlePortrait)
//battleWindow3.owner = self
//battleWindow3.scale_down = sf

attackSprite = noone;
idleSprite = noone;

I_FRAME_LENGTH = 30
i_frames = I_FRAME_LENGTH

is_vulnerable = true

//Buff Particle Information
alternate = false //used for double particle creation 
partNum = 0 //used for triple particle creation. 0 = attack, 1 = defense, 2 = speed

//Soup Particle Information
lastBowl = sBowlBurnt

path_building = noone

walking_on = oCollidable