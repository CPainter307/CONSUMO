Class = "Enemy";

//maxHealth = 200;
//debug only
maxHealth = 51;
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