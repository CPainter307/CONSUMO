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
	if (ds_list_size(item_list) < 3) {
		//add conditions for prepared item
		ds_list_add(item_list, vesselList[| 0]);	
		vesselList[| 0].beingCooked = true;
		with(vesselList[| 0]) {
			if (beingCooked) {
				//moved to another place - REMEMBER TO EVENTUALLY DESTROY ONE DAY
				phy_position_x = oIngredientHolder.x;
				phy_position_y = oIngredientHolder.y;
				var sound_num = irandom_range(0,2);
				switch (sound_num) {
					case 0: // play pot drop sound 1
						audio_play_sound(snd_pot_drop_1, 5, false);
						break;
					case 1: // play pot drop sound 2
						audio_play_sound(snd_pot_drop_2, 5, false);
						break;
					case 2: // play pot drop sound 3
						audio_play_sound(snd_pot_drop_3, 5, false);
						break;
				}
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