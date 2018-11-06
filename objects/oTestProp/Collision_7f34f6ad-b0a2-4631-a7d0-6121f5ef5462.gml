/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_left) && isPickingUp == false)
{
	isPickingUp = true;
}

if (isPickingUp)
{
	//Destroys the idle test object and creates the picked up object and places it in your hand
	if (oPlayer.facingRight)
	{
		instance_create_layer(oFrontArm.x + 6,oFrontArm.y + 25,"leftArmLayer",oTestPropPickedUp);
	}
	else
	{
		instance_create_layer(oFrontArm.x - 50,oFrontArm.y + 25,"leftArmLayer",oTestPropPickedUp);
	}
	instance_destroy();	
}