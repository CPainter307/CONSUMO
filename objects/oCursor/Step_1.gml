
if mouse_check_button(mb_left) {
	image_index = 1
}
if mouse_check_button_released(mb_left) {
	image_index = 0
}

if sprite_index == sPointerCursor {
	if image_speed != 0 {
		image_index = 0	
	}
	image_speed = 0	
} else {
	image_speed = 2
}

x = device_mouse_x(0)
y = device_mouse_y(0)