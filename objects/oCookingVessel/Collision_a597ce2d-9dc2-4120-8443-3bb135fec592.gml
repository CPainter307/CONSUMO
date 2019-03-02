if (!other.followingL && !other.followingR) {
	ds_list_add(item_list, other.ing_id);
	if(object_get_name(other.object_index) != "oRecipe") {
		with(other) {
			instance_destroy();
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

if (ds_list_size(item_list) >= 3) {
	ing1 = ds_list_find_value(item_list, 0);
	ing2 = ds_list_find_value(item_list, 1);
	ing3 = ds_list_find_value(item_list, 2);
	
	recipe = ds_3d_get(ingredients, ing1, ing2, ing3);
	
	if (recipe != 0) {
		timeline_index = tl_cooking;
		timeline_position = 0;
		timeline_running = true;
		timeline_loop = false;
	}
}