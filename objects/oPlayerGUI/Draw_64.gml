/// @description creates gui that shows player hand inventory

//draw white windows
draw_sprite(sHandWindow, 0, 300, 820);
draw_sprite(sHandWindow, 0, 1600, 820);

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
if (oPlayer.holdingL = false) {
	draw_sprite(sEmpty, 0, 300, 850);
}
else {
	if (instance_exists(oPlayerPickUpRadius.itemInLeftHand)) {
		draw_sprite(oPlayerPickUpRadius.itemInLeftHand.sprite_index, 0, 300, 850);
	}
}
if (oPlayer.holdingR = false) {
	draw_sprite(sEmpty, 0, 1600, 850);
}
else {
	if (instance_exists(oPlayerPickUpRadius.itemInRightHand)) {
		draw_sprite(oPlayerPickUpRadius.itemInRightHand.sprite_index, 0, 1600, 850);
	}
}

//battle window
var xpos = view_xport[0]+46;
var ypos = view_yport[0]+34;
if (instance_exists(oAdventurer)) {
	draw_sprite(sBattleWindowStatBG, 1, xpos+41, ypos+152);
	draw_sprite_ext(sBattleWindowStat, 1, xpos+63, ypos+206, 1, (oAdventurer.attack/oAdventurer.maxattack), 0, c_white, 1);  // attack
	draw_sprite_ext(sBattleWindowStat, 1, xpos+117, ypos+206, 1, (oAdventurer.defense/oAdventurer.maxdefense), 0, c_white, 1);  // defense
	draw_sprite_ext(sBattleWindowStat, 1, xpos+168, ypos+206, 1, (oAdventurer.spd/oAdventurer.maxspeed), 0, c_white, 1);  // speed
	draw_sprite_ext(sBattleWindowStat, 1, xpos+222, ypos+206, 1, (oAdventurer.elmatk/oAdventurer.maxelmatk), 0, c_white, 1);  // elm atk
	draw_sprite_ext(sBattleWindowStat, 1, xpos+276, ypos+206, 1, (oAdventurer.elmdef/oAdventurer.maxelmdef), 0, c_white, 1);  // elm def
	draw_sprite(sBattleWindow, 1, xpos, ypos);
	draw_sprite_ext(sBattleWindowHealth, 1, xpos+156, ypos+66, (oAdventurer.hp/oAdventurer.maxhp), 1, 0, c_white, 1);  // hp
	if (!oAdventurer.stallHunger) {
		draw_sprite_ext(sBattleWindowHunger, 1, xpos+156, ypos+111, (oAdventurer.hunger/oAdventurer.maxhunger), 1, 0, c_white, 1);  // hunger
	} else {
		draw_sprite_ext(sBattleWindowHunger, 1, xpos+156, ypos+111, (oAdventurer.hunger/oAdventurer.maxhunger), 1, 0, c_red, 1);  // hunger
	}
}


// textbox gui
//nine_slice_box(sTextbox, 30, 50, mouse_x, mouse_y);