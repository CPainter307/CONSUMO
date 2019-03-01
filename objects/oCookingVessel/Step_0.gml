/// @description 

// checks to see if recipe is done
if (ds_list_size(item_list) >= 3) {
	
	//raw
	if (timeline_position >= (timeline_max_moment(timeline_index)) - 360 and timeline_position < (timeline_max_moment(timeline_index)) - 270) {
		
	}
	
	// undercooked
	else if (timeline_position >= (timeline_max_moment(timeline_index)) - 270 and timeline_position < (timeline_max_moment(timeline_index)) - 180) {
		
	}
	
	// JUST RIGHT
	else if (timeline_position >= (timeline_max_moment(timeline_index)) - 180 and timeline_position < (timeline_max_moment(timeline_index)) - 90) {
		if (recipe != 0) { // if the recipe exists
			if (position_meeting(x, y, oPlayerPickUpRadius)) {
				if (oPlayerPickUpRadius.keyLeftHand || oPlayerPickUpRadius.keyRightHand) {
					timeline_index = 360;
					timeline_running = false;
					with(steam) instance_destroy();
					scr_create_recipe(recipe[0], recipe[1]);
					ds_list_clear(item_list);
				}
			}
		}
	}
	
	//burnt
	else if (timeline_position >= (timeline_max_moment(timeline_index)) - 90 and timeline_position < (timeline_max_moment(timeline_index))) {
		
	}
	
}