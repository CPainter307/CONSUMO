draw_set_alpha(1);
draw_self();
if (global.fightStarted) {
draw_healthbar(x-maxHealth/3, y-225, x+maxHealth/3, y-200, (currentHealth/maxHealth) * 100, c_blue, c_red, c_lime, 0, true, true)
draw_set_color(c_white);
draw_set_font(fBattleFont);
draw_text(x,y-220, currentHealth);
}



if (flash > 0)
{
	flash -= 0.25;
	
	gpu_set_blendmode(bm_add);
	
	shader_set(shHit2);
	shdAlpha1 = shader_get_uniform(shHit2, "_alpha");
	shader_set_uniform_f(shdAlpha1, flash);
	
	draw_self();
	
	shader_reset();
	gpu_set_blendmode(bm_normal);
}