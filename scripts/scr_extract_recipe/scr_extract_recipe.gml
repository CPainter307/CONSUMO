/// scr_extract_recipe(quality)
if (position_meeting(x, y, oPlayerPickUpRadius) and (oPlayerPickUpRadius.keyLeftHand or oPlayerPickUpRadius.keyRightHand)) {
	timeline_index = 360;
	timeline_running = false;
	with(steam) instance_destroy();
	
	var modifier_amount = 0;
	var listOfMods = array_create(3, noone);
	
	//add booster values to oRecipe
	var total_hp = ing1.hp + ing2.hp + ing3.hp;
	var total_attack = ing1.attack + ing2.attack + ing3.attack;
	var total_defense = ing1.defense + ing2.defense + ing3.defense;
	var total_spd = ing1.spd + ing2.spd + ing3.spd;
	
	//create oRecipe
	var inst = instance_create_depth(x, y, -y, oRecipe);
	
	//check for amount of modifiers
	for (var i = 0; i < 3; i++) {
		if (ds_list_find_value(item_list, i).type == "modifier") {
			listOfMods[modifier_amount] = ds_list_find_value(item_list, i);
			modifier_amount++;
		}
	}
	//multiply by modifier1 for only one modifier
	if (modifier_amount == 1) {
		total_hp = total_hp * listOfMods[0].modifier1[0];
		total_attack = total_attack * listOfMods[0].modifier1[1];
		total_defense = total_defense * listOfMods[0].modifier1[2];
		total_spd = total_spd * listOfMods[0].modifier1[3];
	}
	else if (modifier_amount == 2) {
		//if two same modifiers, multiply by modifier2
		if (listOfMods[0].ingrName == listOfMods[1].ingrName) {
			total_hp = total_hp * listOfMods[0].modifier2[0];
			total_attack = total_attack * listOfMods[0].modifier2[1];
			total_defense = total_defense * listOfMods[0].modifier2[2];
			total_spd = total_spd * listOfMods[0].modifier2[3];
		} else {
			// if different multiplier, choose greatest of each HADS value
			// HADS = hp, attack, defense, speed
			var hadsArray = array_create(4, noone);
			for (var i = 0; i < 4; i++) {
				if (listOfMods[0].modifier1[i] >= listOfMods[1].modifier1[i]) {
					hadsArray[i] = listOfMods[0].modifier1[i];
				} else {
					hadsArray[i] = listOfMods[1].modifier1[i];
				}
			}
			// multiply by new HADS multiplier
			total_hp = total_hp * hadsArray[0];
			total_attack = total_attack * hadsArray[1];
			total_defense = total_defense * hadsArray[2];
			total_spd = total_spd * hadsArray[3];
		}
	}
	
	// add vessel bonus
	total_hp = total_hp + vesselHp;
	total_attack = total_attack + vesselAttack;
	total_defense = total_defense + vesselDefense;
	total_spd = total_spd + vesselSpeed;
	
	//add quality bonus
	switch (argument0) {
		case 0: // raw
			total_hp *= -1;
			total_attack *= -1;
			total_defense *= -1;
			total_spd *= -1;
			break;
		case 1: // undercooked
			total_hp *= .5;
			total_attack *= .5;
			total_defense *= .5;
			total_spd *= .5;
			break;
		case 2: // JUST RIGHT
			break;
		case 3: // burnt
			total_hp *= .25;
			total_attack *= .25;
			total_defense *= .25;
			total_spd *= .25;
			break;
	}
	
	//assign to recipe
	inst.hp = total_hp;
	inst.attack = total_attack;
	inst.defense = total_defense;
	inst.spd = total_spd;
	inst.name = ing1.ingrName + ing2.ingrName + ing3.ingrName;
	
	//show recipe quality
	show_message("Health: " + string(inst.hp) + " Attack: " + string(inst.attack) + " Defense: " + string(inst.defense) + " Speed: " + string(inst.spd) + " Name: " + string(inst.name));
	
	ds_list_clear(item_list);
}