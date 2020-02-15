
currentlyCooking = false;
timeline_position = 0

//clear grid
for (var i = 2; i >= 0; i--) {
	if ds_grid_get(item_grid, 0, i) != noone {
		inst = instance_create_layer(x, y-60, "Objects", ds_grid_get(item_grid, 8, i))
		throw_object(inst, x, y-50, 1000, oPot)
		ds_grid_set_region(item_grid, 0, i, 8, i, noone)
		break
	}
}

// COMMENTED OUT WHILE MAKING STUFF SHOOT OUT OF POT, UNCOMMENT FOR TAKING THINGS OUT NORMALLY
////holding_big_item
//if !is_holding_items() and !oPot.held {
//	oPlayer.holding_big_item = true
//	add_to_inventory(inst);
//}