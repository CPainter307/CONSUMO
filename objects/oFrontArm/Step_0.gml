/// @description Insert description here
// You can write your code in this editor

x = oPlayer.x - 12;
y = oPlayer.y - 12;

if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
	sprite_index = sFrontArmMoving;
}
else {
	sprite_index = sFrontArm;
}

//Flips arm based on player position and movement (incomplete)
if (oPlayer.hsp < 0)
{
	sprite_index = sBackArm;
	image_xscale = 0.07 * sign(oPlayer.hsp);
	x = oPlayer.x - 6;
	facingBool = false;
	layer_element_move(oFrontArm, "backArmLayer");
}
else if (oPlayer.hsp > 0)
{
	image_xscale = 0.07 * sign(oPlayer.hsp);
	x = oPlayer.x - 12;
	facingBool = true;
	layer_element_move(oFrontArm, "forwardArmLayer");
}
if (oPlayer.hsp == 0 && facingBool == false) {
	sprite_index = sBackArm;
	layer_element_move(oFrontArm, "backArmLayer");
	//image_xscale = sign(oPlayer.hsp);
}

//new code for arm flipping
