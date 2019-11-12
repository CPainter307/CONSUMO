if (maxHealth > currentHealth) {
	currentHealth += other.hp;
}

attackTimer = (attackTimer/60) + other.attack;
defenseTimer = (defenseTimer/60) + other.defense;
speedTimer = (speedTimer/60) + other.spd;

if attackTimer > 0 {
	attackMultiplier*=2
	attackTimer*=60
} else {
	attackMultiplier=1	
}
if defenseTimer > 0 {
	defenseMultiplier=2
	defenseTimer*=60
} else {
	defenseMultiplier=1	
}
if speedTimer > 0 {
	speedMultiplier*=2
	speedTimer*=60
} else {
	speedMultiplier=1	
}

battleWindow.cur_atk = attackTimer
battleWindow.max_atk = attackTimer

battleWindow.cur_def = defenseTimer
battleWindow.max_def = defenseTimer

battleWindow.cur_spd = speedTimer
battleWindow.max_spd = speedTimer

hunger += 50;
if (hunger >= maxhunger) {
	hunger = 100;
	stallHunger = true;
}

if (other.hp < 0 || other.attack < 0 || other.defense < 0 || other.spd < 0)
{
	flash = 3;	
}
else
{
	shaderBuff = 1;	
}

with (other) instance_destroy();	