/// @description Insert description here
// You can write your code in this editor
if (oPlayer.facingRight) {
	if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
		sprite_index = sBackArmL; //later swap for sBackArmLMoving
	}
	else {
		sprite_index = sBackArmL;	
	}
	x = oPlayer.x - 6;
	y = oPlayer.y - 6;
}
else {
	if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
		sprite_index = sBackArmR; //later swap for sBackArmRMoving
	}
	else {
		sprite_index = sBackArmR;
	}
	x = oPlayer.x - 6;
	y = oPlayer.y - 6;
}