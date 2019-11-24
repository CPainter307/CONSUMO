timer++;

if(timer >= 50)
{
	instance_destroy();
}


//draw_set_alpha((50-timer)/50);
draw_set_color(c_red);
draw_set_font(fBattleTextThick);
//draw_text_transformed(x, (y - (2 * timer)), TD , 1, 1, 0);
draw_text_color(x, y-(2*timer), TD, RED_TEXT, RED_TEXT, RED_TEXT, RED_TEXT, 1-(timer/50))
