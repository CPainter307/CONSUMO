Class = "Enemy";

maxHealth = 1000;
currentHealth = maxHealth;

baseAttack = 100;
baseDefense = 100;
baseSpeed = 100;

healthMultiplier = 1;
attackMultiplier = 1;
defenseMultiplier = 1;

//[speed, damage, (single/group)]
move_1 = [10, 1, 0];
move_2 = [110, 10, 1];

timer_m1 = 0;
timer_m2 = 0;

allAdventurers = ds_list_create();
for (var i = 0; i < instance_number(oAdventurer); i++)
{
	ds_list_add(allAdventurers, instance_find(oAdventurer, i));
}