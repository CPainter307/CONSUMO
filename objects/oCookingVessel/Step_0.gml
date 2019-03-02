/// @description 

// checks to see if recipe is done
if (ds_list_size(item_list) >= 3) {
	
	//raw
	if (timeline_position >= 0 and timeline_position < 90) {
		scr_extract_recipe(0);
	}
	
	// undercooked
	else if (timeline_position >= 90 and timeline_position < 180) {
		scr_extract_recipe(1);
	}
	
	// JUST RIGHT
	else if (timeline_position >= 180 and timeline_position < 270) {
		scr_extract_recipe(2);
	}
	
	//burnt
	else {
		scr_extract_recipe(3);
	}
}