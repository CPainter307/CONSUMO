if draw_gui {
	exit	
}

draw_set_alpha(alpha)

var color_stat_atk = make_color_rgb(196, 36, 48)
var color_stat_def = make_color_rgb(45, 3, 217)
var color_stat_spd = make_color_rgb(255, 200, 37)
var color_health = make_color_rgb(90, 197, 79)
var color_hunger = make_color_rgb(255, 235, 87)
var color_empty = make_color_rgb(137, 30, 43)
var color_lost = make_color_rgb(234, 50, 60)
var color_healed = make_color_rgb(153, 230, 95)

//draw hunger bar
draw_set_color(c_red)
scr_health_circle(x, y, 203/scale_down, 100, 100, -90, -180, 1, color_empty)
scr_health_circle(x, y, 203/scale_down, 100, cur_hunger, -90, -180, 1, color_hunger)

//draw health bar
draw_set_color(c_red)
scr_health_circle(x, y-(51/scale_down), 263/scale_down, 100, 100, -90, -180, -1, color_empty)
scr_health_circle(x, y-(51/scale_down), 263/scale_down, 100, prev_health, -90, -180, -1, color_lost)
scr_health_circle(x, y-(51/scale_down), 263/scale_down, 100, cur_healed, -90, -180, -1, color_healed)
scr_health_circle(x, y-(51/scale_down), 263/scale_down, 100, cur_health, -90, -180, -1, color_health)

//draw_portrait
draw_sprite_ext(sBattleWindowBG, 0, x, y, 1/scale_down, 1/scale_down, 0, c_white, 1)
draw_sprite_ext(portrait, 0, x, y, 1/scale_down, 1/scale_down, 0, c_white, 1)

//draw outline
draw_sprite_ext(sBattleWindowOutline, 0, x, y, 1/scale_down, 1/scale_down, 0, c_white, 1)

//draw stat circles
stat_1_x = 363
stat_1_y = -211
stat_2_x = 408   
stat_2_y = -22
stat_3_x = 363
stat_3_y = 166

//sword
if cur_atk > 0 {
	draw_sprite_ext(sStatBG, 0, x+(stat_1_x/scale_down), y+(stat_1_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
	draw_sprite_ext(sSwordIconOutlined, 0, x+(stat_1_x/scale_down), y+(stat_1_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
	scr_health_ring(x+(stat_1_x/scale_down), y+(stat_1_y/scale_down), 60/scale_down, 15/scale_down, max_atk, cur_atk, 90, 360, 1, color_stat_atk)
}

//shield
if cur_def > 0 {
	draw_sprite_ext(sStatBG, 0, x+(stat_2_x/scale_down), y+(stat_2_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
	draw_sprite_ext(sShieldIconOutlined, 0, x+(stat_2_x/scale_down), y+(stat_2_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
	scr_health_ring(x+(stat_2_x/scale_down), y+(stat_2_y/scale_down), 60/scale_down, 15/scale_down, max_def, cur_def, 90, 360, 1, color_stat_def)
}

//shoe
if cur_spd > 0 {
	draw_sprite_ext(sStatBG, 0, x+(stat_3_x/scale_down), y+(stat_3_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
	draw_sprite_ext(sShoeIconOutlined, 0, x+(stat_3_x/scale_down), y+(stat_3_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
	scr_health_ring(x+(stat_3_x/scale_down), y+(stat_3_y/scale_down), 60/scale_down, 15/scale_down, max_spd, cur_spd, 90, 360, 1, color_stat_spd)
}
draw_set_alpha(1)