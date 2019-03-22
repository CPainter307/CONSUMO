//HADS
var yy = y - 100;

if (instance_exists(h)) with (h) instance_destroy();
if (instance_exists(a)) with (a) instance_destroy(); 
if (instance_exists(d)) with (d) instance_destroy(); 
if (instance_exists(s)) with (s) instance_destroy(); 

h = instance_create_depth(x-55, yy, -y, oAdvStatus);
a = instance_create_depth(x-27, yy, -y, oAdvStatus);
d = instance_create_depth(x+27, yy, -y, oAdvStatus);
s = instance_create_depth(x+55, yy, -y, oAdvStatus);

if (maxhp > hp) hp += other.hp;
if (other.hp < 0) h.image_index = 2;
else if (other.hp == 0 || maxhp <= hp) h.image_index = 1;

if (maxattack > attack) attack += other.attack;
if (other.attack < 0) a.image_index = 2;
else if (other.attack == 0 || maxattack <= attack) a.image_index = 1;

if (maxdefense > defense) defense += other.defense;
if (other.defense < 0)       d.image_index = 2;
else if (other.defense == 0 || maxdefense <= defense) d.image_index = 1;

if (maxspeed > spd) spd += other.spd;
if (other.spd < 0)       s.image_index = 2;
else if (other.spd == 0 || maxspeed <= spd) s.image_index = 1;

if (hunger < maxhunger) hunger += 50;
if (hunger >= maxhunger) {
	hunger = 100;
	stallHunger = true;
}

with (other) instance_destroy();