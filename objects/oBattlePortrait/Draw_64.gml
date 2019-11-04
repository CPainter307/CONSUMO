var scale_down = 5
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

//draw hunger bar
draw_set_color(c_red)
scr_health_circle(x, y, 203/scale_down, 100, 100, -90, -180, 1, c_red)
scr_health_circle(x, y, 203/scale_down, 100, cur_hunger, -90, -180, 1, c_yellow)

//draw health bar
draw_set_color(c_red)
scr_health_circle(x, y-(51/scale_down), 263/scale_down, 100, 100, -90, -180, -1, c_red)
scr_health_circle(x, y-(51/scale_down), 263/scale_down, 100, cur_health, -90, -180, -1, c_green)

//draw_portrait
draw_sprite_ext(sBattleWindowBG, 0, x, y, 1/scale_down, 1/scale_down, 0, c_white, 1)
draw_sprite_ext(sLizardPortraitBattle, 0, x, y, 1/scale_down, 1/scale_down, 0, c_white, 1)

//draw outline
draw_sprite_ext(sBattleWindowOutline, 0, x, y, 1/scale_down, 1/scale_down, 0, c_white, 1)