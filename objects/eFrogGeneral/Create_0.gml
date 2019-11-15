event_inherited()

SHOOT_TIME = 120

projectile_timer = SHOOT_TIME

is_above = false;
grv = 0.3;
motiony = 0;
falling = false;
time = 0;

phase = 1;

//AS IT STANDS RIGHT NOW, EVERYTHING BELOW THIS LINE HAS BEEN COPIED FROM eFrogEgg
//Feel free to change anything below
Class = "Enemy";

is_vulnerable = true

maxHealth = 500;
//debug only
//maxHealth = 51;
currentHealth = maxHealth;

baseAttack = 10;
baseDefense = 10;
baseSpeed = 8;

healthMultiplier = 1;
attackMultiplier = 1;
defenseMultiplier = 1;

//[speed, damage, (single/group)]
move_1 = [10, 5, 0];
move_2 = [35, 15, 0];

timer_m1 = 0;
timer_m2 = 0;

healthThisFrame = currentHealth;
flash = 0;
timer_m2 = 0;