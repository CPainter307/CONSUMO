if highlighted {
	outline_start(4, c_white, sprite_index, 4)
	
	draw_self()
	
	gpu_set_blendmode(bm_add);
	shader_set(shWhiteFlash);
	shdAlpha = shader_get_uniform(shWhiteFlash, "_alpha");
	shader_set_uniform_f(shdAlpha, 0.3);
	draw_self();
	outline_end()
	gpu_set_blendmode(bm_normal);
	
	image_xscale = lerp(image_xscale, 1.1, 0.3)
	image_yscale = lerp(image_yscale, 1.1, 0.3)
} else {
	image_xscale = lerp(image_xscale, 1, 0.3)
	image_yscale = lerp(image_yscale, 1, 0.3)
	draw_self()	
}