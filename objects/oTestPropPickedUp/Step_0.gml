/// @description Insert description here
// You can write your code in this editor

//Determines player position and updates object position (WIP)
if (oPlayer.hsp > 0)
{
	x = oFrontArm.x + 6;
	y = oFrontArm.y + 25;
}
else if (oPlayer.hsp < 0)
{
	x = oFrontArm.x - 50;
	y = oFrontArm.y + 25
}
else if (oPlayer.facingRight && oPlayer.hsp == 0) {
	x = oFrontArm.x + 6;
	y = oFrontArm.y + 25;
}
else if (!oPlayer.facingRight && oPlayer.hsp == 0){
	if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
		x = oFrontArm.x - 50;
		y = oFrontArm.y + 25;
	}
}