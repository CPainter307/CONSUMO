/// @description Insert description here
// You can write your code in this editor

//if player facing right
if (oPlayer.facingRight) {
	if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
		sprite_index = sFrontArmRMoving;
	}
	else {
		sprite_index = sFrontArmR;	
	}
	x = oPlayer.x - 13;
	y = oPlayer.y - 12;
}

//if player facing left
else {
	if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
		sprite_index = sFrontArmL; //later swap for sFrontArmLMoving
	}
	else {
		sprite_index = sFrontArmL;
	}
	x = oPlayer.x + 21;
	y = oPlayer.y - 12;
}
