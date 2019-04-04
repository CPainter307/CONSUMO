/// @description creates gui that shows player hand inventory
display_set_gui_size(view_wport[0], view_hport[0]);
var gwidth = global.view_width, gheight = global.view_height;

//draw white windows
draw_sprite(sHandWindow, 0, 300, 820);
draw_sprite(sHandWindow, 0, 1600, 820);
//var xl_start = gwidth*1/6, xr_start = gwidth*5/6, y_start = gheight*67.5/100, w_width=gwidth*1/20*1.5, w_height=gheight*17/120*1.5
//draw_sprite_stretched(sHandWindow, 0, xl_start, y_start, w_width, w_height);
//draw_sprite_stretched(sHandWindow, 0, xr_start, y_start, w_width, w_height);


//draw controller scheme
if (gamepad_is_connected(0)) {
	draw_sprite(sLeftBumper, 0, 300, 990);
	draw_sprite(sRightBumper,0, 1600, 990);
}
if (!gamepad_is_connected(0)) {
	draw_sprite(sLeftClick, 0, 300, 990);
	draw_sprite(sRightClick, 0, 1600, 990);
}

//draw objects in hands (currently the "are we holding" check
if (oPlayerPickUpRadius.itemInLeftHand == noone) {
	draw_sprite(sEmpty, 0, 300, 850);
}
else {
	var leftH = oPlayerPickUpRadius.itemInLeftHand
	if (instance_exists(leftH)) {
		draw_sprite(leftH.sprite_index, 0, 300, 850);
		
		//draw text
		draw_set_font(fGUITextThick)
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		if (leftH.object_index == oRecipe) {
			draw_text_outlined(300, 645, OFFWHITE_COL, BROWN_COL, leftH.mealName)	
		} else if (object_get_parent(leftH.object_index) == oIngredient) {
			draw_text_outlined(300, 645, OFFWHITE_COL, BROWN_COL, leftH.ingrName)	
		}
		
		//draw icons
		scr_draw_icons(300, 695, leftH, draw_icons_l, which_icons_l);
	}
}
if (oPlayerPickUpRadius.itemInRightHand == noone) {
	draw_sprite(sEmpty, 0, 1600, 850);
}
else {
	var rightH = oPlayerPickUpRadius.itemInRightHand
	if (instance_exists(rightH)) {
		draw_sprite(rightH.sprite_index, 0, 1600, 850);
		
		//draw text
		draw_set_font(fGUITextThick);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		if (rightH.object_index == oRecipe) {
			draw_text_outlined(1600, 645, OFFWHITE_COL, BROWN_COL, rightH.mealName)	
		} else if (object_get_parent(rightH.object_index) == oIngredient) {
			draw_text_outlined(1600, 645, OFFWHITE_COL, BROWN_COL, rightH.ingrName)	
		}
		
		//draw icons
		scr_draw_icons(1600, 695, rightH, draw_icons_r, which_icons_r);
	}
}


//battle window
if (instance_exists(Enemy)) {
	adv1 = ds_list_find_value(Enemy.allAdventurers, 0);
	adv2 = ds_list_find_value(Enemy.allAdventurers, 1);
	adv3 = ds_list_find_value(Enemy.allAdventurers, 2);
}
var xpos = view_xport[0]+46;
var ypos = view_yport[0]+34;
if (instance_exists(adv1)) {
	draw_sprite(sBattleWindowStatBG, 1, xpos+32, ypos+105);
	draw_sprite_ext(sBattleWindowStat, 1, xpos+42, ypos+137, 1, (adv1.attack/adv1.maxattack), 0, c_white, 1);  // attack
	draw_sprite_ext(sBattleWindowStat, 1, xpos+78, ypos+137, 1, (adv1.defense/adv1.maxdefense), 0, c_white, 1);  // defense
	draw_sprite_ext(sBattleWindowStat, 1, xpos+112, ypos+137, 1, (adv1.spd/adv1.maxspeed), 0, c_white, 1);  // speed
	draw_sprite_ext(sBattleWindowStat, 1, xpos+148, ypos+137, 1, (adv1.elmatk/adv1.maxelmatk), 0, c_white, 1);  // elm atk
	draw_sprite_ext(sBattleWindowStat, 1, xpos+184, ypos+137, 1, (adv1.elmdef/adv1.maxelmdef), 0, c_white, 1);  // elm def
	draw_sprite(sBattleWindow, 1, xpos, ypos);
	draw_sprite_ext(sBattleWindowHealth, 1, xpos+104, ypos+44, (adv1.currentHealth/adv1.maxHealth), 1, 0, c_white, 1);  // hp
	if (!adv1.stallHunger) {
		draw_sprite_ext(sBattleWindowHunger, 1, xpos+104, ypos+74, (adv1.hunger/adv1.maxhunger), 1, 0, c_white, 1);  // hunger
	} else {
		draw_sprite_ext(sBattleWindowHunger, 1, xpos+104, ypos+74, (adv1.hunger/adv1.maxhunger), 1, 0, c_red, 1);  // hunger
	}
	/*draw_set_color(textCol);
	draw_set_font(fBattleTextThick);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_text(xpos+105, ypos+29, "HEALTH:")*/


}
var xpos = view_xport[0]+46;
var ypos = view_yport[0]+234;
if (instance_exists(adv2)) {
	draw_sprite(sBattleWindowStatBG, 1, xpos+32, ypos+105);
	draw_sprite_ext(sBattleWindowStat, 1, xpos+42, ypos+137, 1, (adv2.attack/adv2.maxattack), 0, c_white, 1);  // attack
	draw_sprite_ext(sBattleWindowStat, 1, xpos+78, ypos+137, 1, (adv2.defense/adv2.maxdefense), 0, c_white, 1);  // defense
	draw_sprite_ext(sBattleWindowStat, 1, xpos+112, ypos+137, 1, (adv2.spd/adv2.maxspeed), 0, c_white, 1);  // speed
	draw_sprite_ext(sBattleWindowStat, 1, xpos+148, ypos+137, 1, (adv2.elmatk/adv2.maxelmatk), 0, c_white, 1);  // elm atk
	draw_sprite_ext(sBattleWindowStat, 1, xpos+184, ypos+137, 1, (adv2.elmdef/adv2.maxelmdef), 0, c_white, 1);  // elm def
	draw_sprite(sBattleWindow, 1, xpos, ypos);
	draw_sprite_ext(sBattleWindowHealth, 1, xpos+104, ypos+44, (adv2.currentHealth/adv2.maxHealth), 1, 0, c_white, 1);  // hp
	if (!adv2.stallHunger) {
		draw_sprite_ext(sBattleWindowHunger, 1, xpos+104, ypos+74, (adv2.hunger/adv2.maxhunger), 1, 0, c_white, 1);  // hunger
	} else {
		draw_sprite_ext(sBattleWindowHunger, 1, xpos+104, ypos+74, (adv2.hunger/adv2.maxhunger), 1, 0, c_red, 1);  // hunger
	}
	/*draw_set_color(textCol);
	draw_set_font(fBattleTextThick);
	draw_text(xpos+105, ypos+29, "HEALTH:")*/
	

}
var xpos = view_xport[0]+46;
var ypos = view_yport[0]+434;
if (instance_exists(adv3)) {
	draw_sprite(sBattleWindowStatBG, 1, xpos+32, ypos+105);
	draw_sprite_ext(sBattleWindowStat, 1, xpos+42, ypos+137, 1, (adv3.attack/adv3.maxattack), 0, c_white, 1);  // attack
	draw_sprite_ext(sBattleWindowStat, 1, xpos+78, ypos+137, 1, (adv3.defense/adv3.maxdefense), 0, c_white, 1);  // defense
	draw_sprite_ext(sBattleWindowStat, 1, xpos+112, ypos+137, 1, (adv3.spd/adv3.maxspeed), 0, c_white, 1);  // speed
	draw_sprite_ext(sBattleWindowStat, 1, xpos+148, ypos+137, 1, (adv3.elmatk/adv3.maxelmatk), 0, c_white, 1);  // elm atk
	draw_sprite_ext(sBattleWindowStat, 1, xpos+184, ypos+137, 1, (adv3.elmdef/adv3.maxelmdef), 0, c_white, 1);  // elm def
	draw_sprite(sBattleWindow, 1, xpos, ypos);
	draw_sprite_ext(sBattleWindowHealth, 1, xpos+104, ypos+44, (adv3.currentHealth/adv3.maxHealth), 1, 0, c_white, 1);  // hp
	if (!adv3.stallHunger) {
		draw_sprite_ext(sBattleWindowHunger, 1, xpos+104, ypos+74, (adv3.hunger/adv3.maxhunger), 1, 0, c_white, 1);  // hunger
	} else {
		draw_sprite_ext(sBattleWindowHunger, 1, xpos+104, ypos+74, (adv3.hunger/adv3.maxhunger), 1, 0, c_red, 1);  // hunger
	}
	/*draw_set_color(textCol);
	draw_set_font(fBattleTextThick);
	draw_text(xpos+105, ypos+29, "HEALTH:")*/
	
}

// textbox gui
//nine_slice_box(s9slice, 475, 539, mouse_x, mouse_y);