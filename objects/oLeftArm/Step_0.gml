/// @description Insert description here
// You can write your code in this editor


x = oPlayer.x - 12;
y = oPlayer.y - 12;

if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
	sprite_index = sLeftArmMoving;
}
else {
	sprite_index = sLeftArm;
}

