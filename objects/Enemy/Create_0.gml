Class = "Enemy";

maxHealth = 300;
currentHealth = maxHealth;

baseAttack = 10;
baseDefense = 10;
baseSpeed = 10;

healthMultiplier = 1;
attackMultiplier = 1;
defenseMultiplier = 1;

//[speed, damage, (single/group)]
move_1 = [10, 1, 0];
move_2 = [110, 10, 1];

timer_m1 = 0;
timer_m2 = 0;

healthThisFrame = currentHealth;
flash = 0;