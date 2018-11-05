/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button_pressed(mb_left) && isPickingUp == false)
{
	isPickingUp = true;
}

if (isPickingUp)
{
	//Destroys the idle test object and creates the picked up object and places it in your hand
	instance_create_layer(oFrontArm.x,oFrontArm.y,"leftArmLayer",oTestPropPickedUp);
	instance_destroy();	
}