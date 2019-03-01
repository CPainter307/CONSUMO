if (!other.followingL && !other.followingR) {
	ds_list_add(item_list, other.ing_id);
	if(object_get_name(other.object_index) != "oRecipe") {
		with(other) {
			instance_destroy();
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