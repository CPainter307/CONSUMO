if !instance_exists(point_to) {
	exit	
}

var col = c_white
if point_to.currentHealth <= point_to.maxHealth * percent_to_show_danger {
	timer++
	if timer >= blink_spd {
		col = c_red
		scale = lerp(scale, 2, 0.5)
		if timer >= blink_spd*2 {
			timer = 0
		}
	} else {
		scale = lerp(scale, 1, 0.5)	
	}
} else {
	scale = lerp(scale, 1, 0.5)	
}

draw_sprite_ext(sOffscreenBubble, 0, x, y, scale, scale, angle, col, alpha)
draw_sprite_ext(sLizardBattlePortrait, 0, x, y, scale, scale, 0, col, alpha)