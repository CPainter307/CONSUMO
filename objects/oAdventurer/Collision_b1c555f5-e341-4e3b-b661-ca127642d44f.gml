//HADS
/*
var yy = y - 100;

if (instance_exists(h)) with (h) instance_destroy();
if (instance_exists(a)) with (a) instance_destroy(); 
if (instance_exists(d)) with (d) instance_destroy(); 
if (instance_exists(s)) with (s) instance_destroy(); 

h = instance_create_depth(x-55, yy, -y, oAdvStatus);
a = instance_create_depth(x-27, yy, -y, oAdvStatus);
d = instance_create_depth(x+27, yy, -y, oAdvStatus);
s = instance_create_depth(x+55, yy, -y, oAdvStatus);
*/
if (!other.followingL and !other.followingR) {
	if (maxHealth > currentHealth) {
		currentHealth += other.hp;
	}
	//if (other.hp < 0) h.image_index = 2;
	//else if (other.hp == 0 || maxhp <= hp) h.image_index = 1;

	if (maxattack > attack) {
		baseAttack += other.attack;
		attack += other.attack;
	}
	//if (other.attack < 0) a.image_index = 2;
	//else if (other.attack == 0 || maxattack <= attack) a.image_index = 1;

	if (maxdefense > defense) {
		baseDefense += other.defense;
		defense += other.defense;
	}
	//if (other.defense < 0)       d.image_index = 2;
	//else if (other.defense == 0 || maxdefense <= defense) d.image_index = 1;
	if (maxspeed > spd) {
		baseSpeed += other.spd;
		spd += other.spd;
	}
	//if (other.spd < 0)       s.image_index = 2;
	//else if (other.spd == 0 || maxspeed <= spd) s.image_index = 1;

	if (maxelmatk > elmatk) {
		baseElmAtk += other.elmatk;
		elmatk += other.elmatk;
	}

	if (maxelmdef > elmdef) {
		baseElmDef += other.elmdef;
		elmdef += other.elmdef;
	}

	if (hunger < maxhunger) {
		hunger += 50;
	}
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
}