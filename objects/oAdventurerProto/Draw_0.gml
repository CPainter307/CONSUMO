draw_self();
/*
//draw hunger bar
if (stallHunger) {
	draw_set_color(c_red);
	draw_rectangle(x-55, y-55, x+55, y-75, false);
}
draw_healthbar(x-50, y-60, x+50, y-70, (hunger/maxhunger)*100, c_gray, c_orange, c_orange, 0, true, true);

//draw health bar
draw_healthbar(x-50, y-70, x+50, y-80, (hp/maxhp)*100, c_gray, c_green, c_green, 0, true, true);