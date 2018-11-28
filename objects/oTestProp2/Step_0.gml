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

//check for left arm pick up
if (isTouching && oPlayer.holdingL = false && (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderl)))
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
	instance_destroy(id);	
	isPickingUpL = false;
	oPlayer.holdingL = true;
}

//check for right arm pick up
if (isTouching && oPlayer.holdingR = false && (mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0,gp_shoulderr)))
{
	isPickingUpR = true;
	isTouching = false;
}
if (isPickingUpR)
{
	//Destroys the idle test object and creates the picked up object and places it in your hand
	if (oPlayer.facingRight)
	{
		instance_create_layer(oFrontArm.x + 50, oFrontArm.y + 25,"rightObjectLayer",oTestPropPickedUp2);
	}
	else
	{
		instance_create_layer(oFrontArm.x - 10, oFrontArm.y + 35,"rightObjectLayer",oTestPropPickedUp2);
	}
	instance_destroy(id);	
	isPickingUpR = false;
	oPlayer.holdingR = true;
}

//SELF DESTRUCT SEQUENCE
self_destruct = keyboard_check(vk_delete);
	if (self_destruct) {
		instance_destroy(id);
	}