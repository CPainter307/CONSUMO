if highlighted {
	//draw the E
	//draw_sprite_ext(sButtonE, 0, x, y-(sprite_height/2)-30+sin(get_timer()/100000), 1, 1, 0, c_white, 1)
	
	//dont do the outline stuff if we're the pot
	if object_index == oPot {
		exit	
	}
	
	outline_start(4, c_white, sprite_index, 4)
	
	draw_self()
	
	gpu_set_blendmode(bm_add);
	shader_set(shWhiteFlash);
	shdAlpha = shader_get_uniform(shWhiteFlash, "_alpha");
	shader_set_uniform_f(shdAlpha, 0.3);
	draw_self();
	outline_end()
	gpu_set_blendmode(bm_normal);

	image_xscale = lerp(image_xscale, 1.1 * sign(image_xscale), 0.3)
	image_yscale = lerp(image_yscale, 1.1 * sign(image_yscale), 0.3)
} else {
	if object_index == oPot {
		exit	
	}
	image_xscale = lerp(image_xscale, 1 * sign(image_xscale), 0.3)
	image_yscale = lerp(image_yscale, 1 * sign(image_yscale), 0.3)
	outline_end()
	gpu_set_blendmode(bm_normal);
	draw_self()	
}
