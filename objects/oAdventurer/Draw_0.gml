if (global.fightStarted) {
	draw_healthbar(x-50, y+100, x+50, y+125, (currentHealth/maxHealth) * 100, c_blue, c_red, c_lime, 0, true, true)
}

draw_self()


if point_in_rectangle(x, y, camera_get_view_x(view), camera_get_view_y(view), oDisplayManager.camera_width+camera_get_view_x(view), oDisplayManager.camera_height+camera_get_view_y(view)) {
	battleWindow.draw_gui = false
	battleWindow.x = lerp(battleWindow.x, x+100, 0.2)
	battleWindow.y = lerp(battleWindow.y, y-100, 0.2)
} else {
	battleWindow.draw_gui = true
	battleWindow.x = lerp(battleWindow.x, (win1_x), 0.2)
	battleWindow.y = lerp(battleWindow.y, (win1_y), 0.2)
}
with battleWindow {
	if collision_circle(x, y, sprite_get_width(sBattleWindowOutline)/4/2, oPlayer, false, true) {
		alpha = lerp(alpha, 0.2, 0.5)
	} else {
		alpha = lerp(alpha, 1, 0.5)
	}
}

if (flash > 0)
 {
	flash -= 0.25;
	
	gpu_set_blendmode(bm_add);
	
	shader_set(shHit2);
	shdAlpha1 = shader_get_uniform(shHit2, "_alpha");
	shader_set_uniform_f(shdAlpha1, flash);
	
	draw_self()
	
	shader_reset();
	gpu_set_blendmode(bm_normal);
}

if (shaderBuff > 0)
{
	shaderBuff -= 0.05;
	
	gpu_set_blendmode(bm_add);
	
	shader_set(shBuff);
	shdAlpha = shader_get_uniform(shBuff, "_alpha");
	shader_set_uniform_f(shdAlpha, shaderBuff);
	
	draw_self()
	
	shader_reset();
	gpu_set_blendmode(bm_normal);
}
