/// scr_extract_recipe(quality)
if (recipe != 0) { // if the recipe exists
	if (position_meeting(x, y, oPlayerPickUpRadius) and (oPlayerPickUpRadius.keyLeftHand or oPlayerPickUpRadius.keyRightHand)) {
		timeline_index = 360;
		timeline_running = false;
		with(steam) instance_destroy();
		scr_create_recipe(recipe[0], recipe[1], argument0);
		ds_list_clear(item_list);
	} 
} else {
	ds_list_clear(item_list);
} 
