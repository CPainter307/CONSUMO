Class = "";

maxHealth = 100;
currentHealth = 50;

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

move_1 = [0, 0];
move_2 = [0, 0];

timer_m1 = 0;
timer_m2 = 0;

stallHunger = false;
stallHungerTimer = 0;

h = noone;
a = noone;
d = noone;
s = noone;

healthThisFrame = currentHealth;
flash = 0;
shaderBuff = 0;

global.fightStarted = false;
startFight = false;

battleWindow = instance_create_depth(100, 100, -y, oBattlePortrait)
battleWindow.owner = self

attackSprite = noone;
idleSprite = noone;

I_FRAME_LENGTH = 30
i_frames = I_FRAME_LENGTH

is_vulnerable = true