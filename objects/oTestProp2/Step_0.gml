/// @description Insert description here
// You can write your code in this editor
x = x;
y = ystart + sin(get_timer()/200000)*5;

if (place_meeting(x,y,oPlayerPickUpRadius))
{
	isTouching = true;
}
else
{
	isTouching = false;	
}
if (isTouching && (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderl)))
{
	isPickingUpL = true;
	isTouching = false;
}
if (isPickingUpL)
{
	//Destroys the idle test object and creates the picked up object and places it in your hand
	if (oPlayer.facingRight)
	{
		instance_create_layer(oFrontArm.x + 6,oFrontArm.y + 25,"leftArmLayer",oTestPropPickedUp2);
	}
	else
	{
		instance_create_layer(oFrontArm.x - 50,oFrontArm.y + 25,"leftArmLayer",oTestPropPickedUp2);
	}
	instance_destroy();	
	isPickingUpL = false;
}