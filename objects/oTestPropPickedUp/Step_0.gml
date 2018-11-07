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

if (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderl))
{
	instance_destroy();
	instance_create_layer(x,y + sin(get_timer()/200000)*5, "Objects", oTestProp);
	while (oTestProp.pickUpBuff <= 4) oTestProp.pickUpBuff += 1;
	oTestProp.image_xscale = 0.25;
	oTestProp.image_yscale = 0.25;
	//oTestProp.isPickingUp = false;	
}