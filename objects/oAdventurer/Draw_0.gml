draw_set_alpha(1);
draw_self();
draw_healthbar(x-50, y+100, x+50, y+125, (currentHealth/maxHealth) * 100, c_blue, c_red, c_lime, 0, true, true)


if (flash > 0)
{
	flash--;
	shader_set(shHit);
	draw_self();
	shader_reset();
}

if (shaderBuff > 0)
{
	shaderBuff -= 0.05;
	
	gpu_set_blendmode(bm_add);
	
	shader_set(shBuff);
	shdAlpha = shader_get_uniform(shBuff, "_alpha");
	shader_set_uniform_f(shdAlpha, shaderBuff);
	
	draw_self();
	
	shader_reset();
	gpu_set_blendmode(bm_normal);
}