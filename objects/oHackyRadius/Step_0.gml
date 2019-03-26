/// @description Insert description here
// You can write your code in this editor
if instance_exists(oHacky)
{
	x = oPlayer.x;
	y = oPlayer.y;
}

if (position_meeting(mouse_x,mouse_y,oHackyRadius))
{
	mouseInRadius = true;	
}
else
{
	mouseInRadius = false;	
}