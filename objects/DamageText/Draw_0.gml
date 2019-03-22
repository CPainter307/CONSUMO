timer++;

if(timer >= 50)
{
	instance_destroy();
}


draw_set_alpha((50-timer)/50);
draw_set_color(c_red);
draw_set_font(DamageFont);
draw_text_transformed(x, (y - (2 * timer)), TD , 1, 1, 0);


