/// @desc CreateEnemyHitbox(type, power)
/// @arg type
/// @arg power
switch (argument0) {
	case 0: // single target
		var num = irandom_range(0, ds_list_size(oParty.allAdventurers)-1); // choose random target
		var target = ds_list_find_value(oParty.allAdventurers, num);
		if (instance_exists(target)) {
			var HitBox_1 = instance_create_depth(target.x, target.y, 0, Hitbox);
			HitBox_1.OwnerClass = "Enemy";
			HitBox_1.targetClass = "Adventurer";
			HitBox_1.movePower = argument1;
			HitBox_1.attack = baseAttack;
			HitBox_1.attackMultiplier = attackMultiplier;
		}
		break;
	
	case 1: //all target
		for (var i = 0; i < ds_list_size(oParty.allAdventurers); i++) {
			var target = ds_list_find_value(oParty.allAdventurers, i);
			if (instance_exists(target)) {
				var HitBox_2 = instance_create_depth(target.x, target.y, 0, Hitbox);
				HitBox_2.OwnerClass = "Enemy";
				HitBox_2.targetClass = "Adventurer";
				HitBox_2.movePower = argument1;
				HitBox_2.attack = baseAttack;
				HitBox_2.attackMultiplier = attackMultiplier;	
			}
		}
		break;
}