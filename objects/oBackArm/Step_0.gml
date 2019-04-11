//if player facing right
if (oPlayer.facingRight) {
	if (oPlayer.hsp != 0) {
		sprite_index = sBackArmL; //later swap for sBackArmLMoving
	}
	else {
		sprite_index = sBackArmL;	
	}
	x = oPlayer.x - 0;
	y = oPlayer.y - 8;
}

//if player facing left
else {
	if (oPlayer.hsp != 0) {
		sprite_index = sBackArmR; //later swap for sBackArmRMoving
	}
	else {
		sprite_index = sBackArmR;
	}
	x = oPlayer.x - 0;
	y = oPlayer.y - 12;
}
