//if item is not held and pot is not full
if ((!other.followingL && !other.followingR) && ds_list_size(item_list) < 3) {
	//add conditions for unprepared item
	if (!other.prepared && ds_list_size(item_list) == 0) {
		var empty1 = instance_create_depth(oIngredientHolder.x, oIngredientHolder.y, 300, oEmptyIngredient);
		var empty2 = instance_create_depth(oIngredientHolder.x, oIngredientHolder.y, 300, oEmptyIngredient);
		ds_list_add(item_list, empty1);
		ds_list_add(item_list, other); //the item is added second for rune display
		other.beingCooked = true;
		ds_list_add(item_list, empty2);
	}
	//add conditions for prepared item
	if (other.prepared) {
		ds_list_add(item_list, other);	
		other.beingCooked = true;
	}
	with(other) {
			if (beingCooked) {
			//moved to another place - REMEMBER TO EVENTUALLY DESTROY ONE DAY
			x = oIngredientHolder.x;
			y = oIngredientHolder.y;
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