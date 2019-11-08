draw_self()

if (ds_list_size(item_list) > 0) {

	// pot flash effect
	if (shaderBuff > 0) {
		image_xscale = lerp(image_xscale, 1.5, 0.5)
		image_yscale = lerp(image_yscale, 1.5, 0.5)
		shaderBuff -= 0.15;
	
		gpu_set_blendmode(bm_add);
	
		shader_set(shWhiteFlash);
		shdAlpha = shader_get_uniform(shWhiteFlash, "_alpha");
		shader_set_uniform_f(shdAlpha, shaderBuff);
	
		draw_self();
	
		shader_reset();
		gpu_set_blendmode(bm_normal);
	} else {
		image_xscale = lerp(image_xscale, 1, 0.6)
		image_yscale = lerp(image_yscale, 1, 0.6)	
	}
	
	// ingredient window
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