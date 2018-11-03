/// @description Insert description here
// You can write your code in this editor

x = oPlayer.x - 12;
y = oPlayer.y - 12;

if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
	sprite_index = sForwardArmMoving;
}
else {
	sprite_index = sForwardArm;
}

//Flips arm based on player position and movement (incomplete)
if (oPlayer.hsp < 0)
{
	image_xscale = 0.07 * sign(oPlayer.hsp);
	x = oPlayer.x + 12;
}
else if (oPlayer.hsp > 0)
{
	image_xscale = 0.07 / sign(oPlayer.hsp);
	x = oPlayer.x - 12;
}