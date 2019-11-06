/// @description 

// checks to see if recipe is done
if (ds_list_size(item_list) >= 3) {
	// JUST RIGHT
	if (timeline_position >= 270 and timeline_position < 540) {
		scr_extract_recipe(0);
	}
	//burnt
	else if (timeline_position >= 540) {
		scr_extract_recipe(1);
	}
}

vesselList = ds_list_create()
vesselRadius = collision_circle_list(x, y, 80, oIngredient, false, true, vesselList, true)

if vesselRadius > 0 {
	//if item is not held and pot is not full
	if (ds_list_size(item_list) < 3) and !vesselList[| 0].apply_gravity { // if the item is currently being thrown, then it will be added to the pot
		//add conditions for prepared item
		ds_list_add(item_list, vesselList[| 0]);	
		vesselList[| 0].beingCooked = true;
		
		//play potdrop sound
		switch (ds_list_size(item_list)) {
			case 1:
				audio_sound_pitch(snd_pot_drop_1, 1)
				scr_pitchshift_sound(snd_pot_drop_1, 6, false)
			break;
		
			case 2:
				audio_sound_pitch(snd_pot_drop_2, 1.1)
				scr_pitchshift_sound(snd_pot_drop_2, 6, false)
			break;
		
			case 3:
				audio_sound_pitch(snd_pot_drop_3, 1.2)
				scr_pitchshift_sound(snd_pot_drop_3, 6, false)
			break;
		}

		with(vesselList[| 0]) {
			if (beingCooked) {
				//moved to another place - REMEMBER TO EVENTUALLY DESTROY ONE DAY
				phy_position_x = oIngredientHolder.x;
				phy_position_y = oIngredientHolder.y;
			}
		}
	}

	if (ds_list_size(item_list) >= 3 && currentlyCooking == false) {	
		//set list of ingredients for script
		currentlyCooking = true;
		ing1 = ds_list_find_value(item_list, 0);
		ing2 = ds_list_find_value(item_list, 1);
		ing3 = ds_list_find_value(item_list, 2);
		//run timeline
		timeline_index = tl_cooking;
		timeline_position = 0;
		timeline_running = true;
		timeline_loop = false;
	}
}

ds_list_destroy(vesselList)