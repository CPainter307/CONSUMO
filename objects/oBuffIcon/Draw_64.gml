if !draw_gui {
	exit
}

draw_set_font(fBattleTextThick)
draw_set_halign(fa_left)
draw_set_valign(fa_center)

//if _scale < 2 and !finished_scale_up {
_scale = ease("out-elastic", timer, 1, 2, 30)
_scale_icon = ease("out-elastic", timer, 1, 2, 30)
//}
//if _scale >= 2 or finished_scale_up {
//	finished_scale_up = true
//	_scale = ease("out-back", timer, 3, 2, max_time/2)
//	_scale_icon = ease("out-back", timer, 3, 2, max_time/2)
//}

draw_text_ext_transformed_color(x, y, "+" + buff_amount, 0, 500, _scale, _scale, 0, c_white, c_white, c_white, c_white, alpha)
draw_sprite_ext(icon, 0, x+(string_width("+" + buff_amount)*_scale)+((sprite_get_width(sHeartIconOutlined)/2)*.4)+20, y+((string_height("+" + buff_amount)*_scale)/2), _scale_icon*.4, _scale_icon*.4, 0, c_white, alpha)

timer++
if move_icon {
	y=(y-(_scale/3))-1
}
if timer > max_time {
	instance_destroy()
} else if timer > max_time/2 {
	alpha-=0.1
}

