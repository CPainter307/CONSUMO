/// scr_extract_recipe(quality)
if oPlayerInput.key_interact and place_meeting(x, y, oPlayer) {
	timeline_index = 540;
	timeline_running = false;
	with(steam) instance_destroy();
	
	//add booster values to oRecipe
	var total_hp = ing1.hp + ing2.hp + ing3.hp;
	var total_attack = ing1.attack + ing2.attack + ing3.attack;
	var total_defense = ing1.defense + ing2.defense + ing3.defense;
	var total_spd = ing1.spd + ing2.spd + ing3.spd;
	
	//create oRecipe
	inst = instance_create_layer(x, y, "Objects", oRecipe); //creates oRecipe based on second item because it'll always be a full ingredient
	currentlyCooking = false;
	
	// add vessel bonus
	total_hp = total_hp + vesselHp;
	total_attack = total_attack + vesselAttack;
	total_defense = total_defense + vesselDefense;
	total_spd = total_spd + vesselSpeed;
	inst.mealName = mealType;

	//name recipe
	//scr_extract_recipe_name();
	
	//add quality bonus
	switch (argument0) {
		case 0: // JUST RIGHT
			inst.quality = 0;
			break;
		case 1: // burnt
			total_hp *= 0;
			total_attack *= 0;
			total_defense *= 0;
			total_spd *= 0;
			inst.name = "Burnt " + inst.name;
			inst.quality = 1;
			break;
	}
	
	//assign to recipe
	inst.hp = total_hp;
	inst.attack = total_attack;
	inst.defense = total_defense;
	inst.spd = total_spd;
	
	//show recipe quality
	textDisappearTimer = 0;
	drawText = true;
	
	show_debug_message("hp: " + string(inst.hp) + " atk: " + string(inst.attack) + " def: " + string(inst.defense) + " spd: " + string(inst.spd))
	
	ds_list_clear(item_list);
}