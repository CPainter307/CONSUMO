ds_list_add(item_list, other.ing_id);
with(other) instance_destroy();

if (ds_list_size(item_list) >= 3) {
	var ing1 = ds_list_find_value(item_list, 0);
	var ing2 = ds_list_find_value(item_list, 1);
	var ing3 = ds_list_find_value(item_list, 2);
	
	var recipe = ds_3d_get(ingredients, ing1, ing2, ing3);
	
	if (recipe != 0) {
		show_message(recipe[0]);
		scr_create_recipe(recipe[0], recipe[1]);
	}
	ds_list_destroy(item_list);
	item_list = ds_list_create();
}
