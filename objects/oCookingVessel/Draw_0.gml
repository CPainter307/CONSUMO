draw_self()

if (ds_list_size(item_list) > 0) {
	var yval = 75
	var xval = 45
	draw_sprite(sVesselWindow, 0, x, y+yval+sin(get_timer()/100000))
	if ds_list_size(item_list) >= 1 { //draw first ingredient
		draw_sprite_ext(ds_list_find_value(item_list, 0).sprite_index, 0, x-xval, y+yval+5+sin(get_timer()/100000), .5, .5, 0, c_white, 1)
	}
	if ds_list_size(item_list) >= 2 { //draw second ingredient
		draw_sprite_ext(ds_list_find_value(item_list, 1).sprite_index, 0, x, y+yval+5+sin(get_timer()/100000), .5, .5, 0, c_white, 1)
	}
	if ds_list_size(item_list) >= 3 { //draw third ingredient
		draw_sprite_ext(ds_list_find_value(item_list, 2).sprite_index, 0, x+xval, y+yval+5+sin(get_timer()/100000), .5, .5, 0, c_white, 1)
	}
}


//--------------DEBUG RADIUS
//draw_set_alpha(.5)
//draw_set_color(c_blue)