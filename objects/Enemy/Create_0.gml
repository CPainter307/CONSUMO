Class = "Enemy";

is_vulnerable = true

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

contact_hitbox = instance_create_depth(x, y, -y, Hitbox)
contact_hitbox.destroy_timer = -1
contact_hitbox.OwnerClass = "Enemy";
contact_hitbox.targetClass = "Adventurer";
contact_hitbox.movePower = 10;
contact_hitbox.attack = 20;
contact_hitbox.attackMultiplier = 1;
contact_hitbox.sprite_index = sprite_index
contact_hitbox.image_xscale = .7
contact_hitbox.image_yscale = .7