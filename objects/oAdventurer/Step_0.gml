//check if dead
if(currentHealth <= 0)
{
	instance_destroy()
}

//move 1
if(((timer_m1) * (baseSpeed/100)) >= move_1[0] and instance_exists(Enemy))
{
	var Hitbox_1 = instance_create_depth(Enemy.x, Enemy.y, 0, Hitbox);
	Hitbox_1.OwnerClass = "Adventurer";
	Hitbox_1.targetClass = "Enemy";
	Hitbox_1.movePower = move_1[1];
	Hitbox_1.attack = baseAttack;
	Hitbox_1.attackMultiplier = attackMultiplier;

	timer_m1 = 0;
}

//move 2
if(((timer_m2) * (baseSpeed/100)) >= move_2[0] and instance_exists(Enemy))
{
	var Hitbox_2 = instance_create_depth(Enemy.x, Enemy.y, 0, Hitbox);
	Hitbox_2.OwnerClass = "Adventurer";
	Hitbox_2.targetClass = "Enemy";
	Hitbox_2.movePower = move_2[1];
	Hitbox_2.attack = baseAttack;
	Hitbox_2.attackMultiplier = attackMultiplier;

	timer_m2 = 0;
}

timer_m2++;
timer_m1++;

if (!stallHunger and hunger >= 0) {
	hunger -= 0.1	
} else if (stallHungerTimer >= 60) {
	stallHunger = false;
	stallHungerTimer = 0;
	hunger = 100;
} else if (stallHunger) {
	stallHungerTimer++;	
}