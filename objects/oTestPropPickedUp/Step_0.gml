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
	x = oFrontArm.x - 6;
	y = oFrontArm.y + 25
}
else
{
	x = oFrontArm.x + 6;
	y = oFrontArm.y + 25	
}


if (mouse_check_button_pressed(mb_left))
{
	//Destroys the held object and creates the idle object (WIP. Currently not working)
	instance_destroy();
	instance_create_layer(x,y + sin(get_timer()/200000)*5, "Objects", oTestProp);
	oTestProp.isPickingUp = false;
}