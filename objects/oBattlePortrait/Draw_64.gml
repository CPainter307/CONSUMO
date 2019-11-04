var scale_down = 4
var color_stat = make_color_rgb(0, 152, 220)
var color_health = make_color_rgb(90, 197, 79)
var color_hunger = make_color_rgb(255, 235, 87)
var color_empty = make_color_rgb(137, 30, 43)

if keyboard_check(ord("C")) {
	cur_hunger += 1
	cur_hunger = clamp(cur_hunger, 0, 100)
}
if keyboard_check(ord("V")) {
	cur_health += 1
	cur_health = clamp(cur_health, 0, 100)
}
if keyboard_check(ord("Z")) {
	cur_hunger -= 1
	cur_hunger = clamp(cur_hunger, 0, 100)
}
if keyboard_check(ord("X")) {
	cur_health -= 1
	cur_health = clamp(cur_health, 0, 100)
}
if keyboard_check(ord("B")) {
	cur_atk -= 1
	cur_atk = clamp(cur_atk, 0, 100)
}
if keyboard_check(ord("N")) {
	cur_def -= 1
	cur_def = clamp(cur_def, 0, 100)
}
if keyboard_check(ord("M")) {
	cur_spd -= 1
	cur_spd = clamp(cur_spd, 0, 100)
}

//draw hunger bar
draw_set_color(c_red)
scr_health_circle(x, y, 203/scale_down, 100, 100, -90, -180, 1, color_empty)
scr_health_circle(x, y, 203/scale_down, 100, cur_hunger, -90, -180, 1, color_hunger)

//draw health bar
draw_set_color(c_red)
scr_health_circle(x, y-(51/scale_down), 263/scale_down, 100, 100, -90, -180, -1, color_empty)
scr_health_circle(x, y-(51/scale_down), 263/scale_down, 100, cur_health, -90, -180, -1, color_health)

//draw_portrait
draw_sprite_ext(sBattleWindowBG, 0, x, y, 1/scale_down, 1/scale_down, 0, c_white, 1)
draw_sprite_ext(sLizardPortraitBattle, 0, x, y, 1/scale_down, 1/scale_down, 0, c_white, 1)

//draw outline
draw_sprite_ext(sBattleWindowOutline, 0, x, y, 1/scale_down, 1/scale_down, 0, c_white, 1)

//draw stat circles
var stat_1_x = 363
var stat_1_y = -211
var stat_2_x = 408   
var stat_2_y = -22
var stat_3_x = 363
var stat_3_y = 166

//sword
draw_sprite_ext(sStatBG, 0, x+(stat_1_x/scale_down), y+(stat_1_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
draw_sprite_ext(sSwordIcon, 0, x+(stat_1_x/scale_down), y+(stat_1_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
scr_health_ring(x+(stat_1_x/scale_down), y+(stat_1_y/scale_down), 60/scale_down, 15/scale_down, 100, cur_atk, 90, 360, 1, color_stat)

////shield
draw_sprite_ext(sStatBG, 0, x+(stat_2_x/scale_down), y+(stat_2_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
draw_sprite_ext(sShieldIcon, 0, x+(stat_2_x/scale_down), y+(stat_2_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
scr_health_ring(x+(stat_2_x/scale_down), y+(stat_2_y/scale_down), 60/scale_down, 15/scale_down, 100, cur_def, 90, 360, 1, color_stat)

//shoe
draw_sprite_ext(sStatBG, 0, x+(stat_3_x/scale_down), y+(stat_3_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
draw_sprite_ext(sShoeIcon, 0, x+(stat_3_x/scale_down), y+(stat_3_y/scale_down), 1/scale_down, 1/scale_down, 0, c_white, 1)
scr_health_ring(x+(stat_3_x/scale_down), y+(stat_3_y/scale_down), 60/scale_down, 15/scale_down, 100, cur_spd, 90, 360, 1, color_stat)