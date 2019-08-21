/// scr_extract_recipe(quality)
if (position_meeting(x, y, oPlayerPickUpRadius) and (oPlayerInput.key_left_hand or oPlayerInput.key_right_hand)) {
	if (oPlayerInput.key_left_hand and oPlayerPickUpRadius.itemInLeftHand == noone) {
		timeline_index = 540;
		timeline_running = false;
		with(steam) instance_destroy();
	
		var modifier_amount = 0;
		var listOfMods = array_create(3, noone);
	
		//add booster values to oRecipe
		var total_hp = ing1.hp + ing2.hp + ing3.hp;
		var total_attack = ing1.attack + ing2.attack + ing3.attack;
		var total_defense = ing1.defense + ing2.defense + ing3.defense;
		var total_spd = ing1.spd + ing2.spd + ing3.spd;
		var total_elmatk = ing1.elmatk + ing2.elmatk + ing3.elmatk;
		var total_elmdef = ing1.elmdef + ing2.elmdef + ing3.elmdef;
	
		//create oRecipe
		inst = instance_create_depth(x, y, ing2.objDepth, oRecipe); //creates oRecipe based on second item because it'll always be a full ingredient
		currentlyCooking = false;
	
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
			total_elmatk = total_elmatk * listOfMods[0].modifier1[4];
			total_elmdef = total_elmdef * listOfMods[0].modifier1[5];
		}
		else if (modifier_amount == 2) {
			//if two same modifiers, multiply by modifier2
			if (listOfMods[0].ingrName == listOfMods[1].ingrName) {
				total_hp = total_hp * listOfMods[0].modifier2[0];
				total_attack = total_attack * listOfMods[0].modifier2[1];
				total_defense = total_defense * listOfMods[0].modifier2[2];
				total_spd = total_spd * listOfMods[0].modifier2[3];
				total_elmatk = total_elmatk * listOfMods[0].modifier2[4];
				total_elmdef = total_elmdef * listOfMods[0].modifier2[5];
			} else {
				// if different multiplier, choose greatest of each HADS value
				// HADS = hp, attack, defense, speed
				var hadsArray = array_create(6, noone);
				for (var i = 0; i < 6; i++) {
					if (listOfMods[0].modifier1[i] >= listOfMods[1].modifier1[i]) {
						hadsArray[i] = listOfMods[0].modifier1[i];
					} else {
						hadsArray[i] = listOfMods[1].modifier1[i];
					}
				}
				// multiply by new HADSEE multiplier
				total_hp = total_hp * hadsArray[0];
				total_attack = total_attack * hadsArray[1];
				total_defense = total_defense * hadsArray[2];
				total_spd = total_spd * hadsArray[3];
				total_elmatk = total_elmatk * hadsArray[4];
				total_elmdef = total_elmdef * hadsArray[5];
			}
		}
	
		// add vessel bonus
		total_hp = total_hp + vesselHp;
		total_attack = total_attack + vesselAttack;
		total_defense = total_defense + vesselDefense;
		total_spd = total_spd + vesselSpeed;
		total_elmatk = total_elmatk + vesselElmatk;
		total_elmdef = total_elmdef + vesselElmdef;
		inst.mealName = mealType;

		//name recipe
		scr_extract_recipe_name();
	
		//add quality bonus
		switch (argument0) {
			case 0: // raw
				total_hp *= -1;
				total_attack *= -1;
				total_defense *= -1;
				total_spd *= -1;
				total_elmatk *= -1;
				total_elmdef *= -1;
				inst.name = "Raw " + inst.name;
				inst.quality = 0;
				break;
			case 1: // undercooked
				total_hp *= .5;
				total_attack *= .5;
				total_defense *= .5;
				total_spd *= .5;
				total_elmatk *= .5;
				total_elmdef *= .5;
				inst.name = "Undercooked " + inst.name;
				inst.quality = 1;
				break;
			case 2: // JUST RIGHT
				inst.quality = 2;
				break;
			case 3: // burnt
				total_hp *= .25;
				total_attack *= .25;
				total_defense *= .25;
				total_spd *= .25;
				total_elmatk *= .25;
				total_elmdef *= .25;
				inst.name = "Burned " + inst.name;
				inst.quality = 3;
				break;
		}
	
		//assign to recipe
		inst.hp = total_hp;
		inst.attack = total_attack;
		inst.defense = total_defense;
		inst.spd = total_spd;
		inst.elmatk = total_elmatk;
		inst.elmdef = total_elmdef;

	
		//show recipe quality
		textDisappearTimer = 0;
		drawText = true;
	
		ds_list_clear(item_list);
	}


if (oPlayerInput.key_right_hand and oPlayerPickUpRadius.itemInRightHand == noone) {
		timeline_index = 540;
		timeline_running = false;
		with(steam) instance_destroy();
	
		var modifier_amount = 0;
		var listOfMods = array_create(3, noone);
	
		//add booster values to oRecipe
		var total_hp = ing1.hp + ing2.hp + ing3.hp;
		var total_attack = ing1.attack + ing2.attack + ing3.attack;
		var total_defense = ing1.defense + ing2.defense + ing3.defense;
		var total_spd = ing1.spd + ing2.spd + ing3.spd;
		var total_elmatk = ing1.elmatk + ing2.elmatk + ing3.elmatk;
		var total_elmdef = ing1.elmdef + ing2.elmdef + ing3.elmdef;
	
		//create oRecipe
		inst = instance_create_depth(x, y, -y, oRecipe);
		currentlyCooking = false;
	
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
			total_elmatk = total_elmatk * listOfMods[0].modifier1[4];
			total_elmdef = total_elmdef * listOfMods[0].modifier1[5];
		}
		else if (modifier_amount == 2) {
			//if two same modifiers, multiply by modifier2
			if (listOfMods[0].ingrName == listOfMods[1].ingrName) {
				total_hp = total_hp * listOfMods[0].modifier2[0];
				total_attack = total_attack * listOfMods[0].modifier2[1];
				total_defense = total_defense * listOfMods[0].modifier2[2];
				total_spd = total_spd * listOfMods[0].modifier2[3];
				total_elmatk = total_elmatk * listOfMods[0].modifier2[4];
				total_elmdef = total_elmdef * listOfMods[0].modifier2[5];
			} else {
				// if different multiplier, choose greatest of each HADS value
				// HADS = hp, attack, defense, speed
				var hadsArray = array_create(6, noone);
				for (var i = 0; i < 6; i++) {
					if (listOfMods[0].modifier1[i] >= listOfMods[1].modifier1[i]) {
						hadsArray[i] = listOfMods[0].modifier1[i];
					} else {
						hadsArray[i] = listOfMods[1].modifier1[i];
					}
				}
				// multiply by new HADSEE multiplier
				total_hp = total_hp * hadsArray[0];
				total_attack = total_attack * hadsArray[1];
				total_defense = total_defense * hadsArray[2];
				total_spd = total_spd * hadsArray[3];
				total_elmatk = total_elmatk * hadsArray[4];
				total_elmdef = total_elmdef * hadsArray[5];
			}
		}
	
		// add vessel bonus
		total_hp = total_hp + vesselHp;
		total_attack = total_attack + vesselAttack;
		total_defense = total_defense + vesselDefense;
		total_spd = total_spd + vesselSpeed;
		total_elmatk = total_elmatk + vesselElmatk;
		total_elmdef = total_elmdef + vesselElmdef;
		inst.mealName = mealType;

		//name recipe
		scr_extract_recipe_name();
	
		//add quality bonus
		switch (argument0) {
			case 0: // raw
				total_hp *= -1;
				total_attack *= -1;
				total_defense *= -1;
				total_spd *= -1;
				total_elmatk *= -1;
				total_elmdef *= -1;
				inst.name = "Raw " + inst.name;
				inst.quality = 0;
				break;
			case 1: // undercooked
				total_hp *= .5;
				total_attack *= .5;
				total_defense *= .5;
				total_spd *= .5;
				total_elmatk *= .5;
				total_elmdef *= .5;
				inst.name = "Undercooked " + inst.name;
				inst.quality = 1;
				break;
			case 2: // JUST RIGHT
				inst.quality = 2;
				break;
			case 3: // burnt
				total_hp *= .25;
				total_attack *= .25;
				total_defense *= .25;
				total_spd *= .25;
				total_elmatk *= .25;
				total_elmdef *= .25;
				inst.name = "Burned " + inst.name;
				inst.quality = 3;
				break;
		}
	
		//assign to recipe
		inst.hp = total_hp;
		inst.attack = total_attack;
		inst.defense = total_defense;
		inst.spd = total_spd;
		inst.elmatk = total_elmatk;
		inst.elmdef = total_elmdef;

	
		//show recipe quality
		textDisappearTimer = 0;
		drawText = true;
	
		ds_list_clear(item_list);
	}
}