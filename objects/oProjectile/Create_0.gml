//event_inherited()

dirx = 1
diry = 0
spd = 10

hitbox = instance_create_depth(x, y, -y, Hitbox)
hitbox.destroy_timer = -1

movePower = 10;
attack = 20;
attackMultiplier = 1;

hitbox.OwnerClass = "Enemy";
hitbox.targetClass = "Adventurer";
hitbox.movePower = movePower;
hitbox.attack = attack;
hitbox.attackMultiplier = attackMultiplier;