/*if (showInv) {
	var invx, invy;
	invx = (view_xport[0] + view_wport[0] * .5) - 326
	invy = (view_yport[0] + view_hport[0] * .5) - 358
	
	
	draw_text_color(300, 50, string(_dir), c_white, c_white, c_white, c_white, 1)
	
	draw_sprite(sRadialMenu, 0, invx, invy);
	
	var click = mouse_check_button_pressed(mb_left);

	if (_dir >= 60 and _dir < 120) { // slot 0
		draw_sprite(sRadialMenuHighlight, 0, invx+slotX[0], invy+slotY[0]);
	}
	if (_dir >= 0 and _dir < 60) { // slot 1
		draw_sprite(sRadialMenuHighlight, 0, invx+slotX[1], invy+slotY[1]);
	}
	/*
	if ((abs(mouse_x - x) < 64) and (abs(mouse_y - y) < 64)) {
		draw_sprite(sRadialMenuHighlight, 0, x, y);
		if (click) {
			if (item != noone) {
				scr_inv_remove_slot(slot);
			}
			if (mouseItem != noone) {
				scr_inv_add_slot(mouseItem, slot)
			}
			mouseItem = item;
		}
	}
	*/
	/*
	if (item != noone) {
		draw_sprite_ext(object_get_sprite(item), 0, x, y, 1, 1, 0, c_white, 1)
	}*/
	//draw_sprite_ext(sApple, 0, invx+81, invy+20, .3, .3, 0, c_white, 1);
	/*
	for (var i = 0; i < maxItems; i++) {
		//button[i].x = invx+slotX[i];
		//button[i].y = invy+slotY[i];
		if (global.inventory[i] != noone) {
			//draw sprite corresponding to item into inventory
			draw_sprite(object_get_sprite(global.inventory[i]), 0, invx+slotX[i], invy+slotY[i]);
		}
	}
}

/*anim += mouse_wheel_down() - mouse_wheel_up();
anim = clamp(anim, 0, array_length_1d(array) - 1)
anim_n = reach_tween(anim_n, anim, 5);

		//button[i].x = invx+slotX[i];
		//button[i].y = invy+slotY[i];


for (var i = 0; i < array_length_1d(array); i++) {
	//draw_text(mouse_x+16, mouse_y+((i-anim_n)*18)-8, array[i]);
	draw_set_color(c_white);
	draw_set_valign(fa_center);
	draw_text_transformed(
		mouse_x+lengthdir_x(64, (i-anim_n)*-40), 
		mouse_y+lengthdir_y(64, (i-anim_n)*-40), 
		array[i], 1, 1, (i-anim_n)*-13);
}*/