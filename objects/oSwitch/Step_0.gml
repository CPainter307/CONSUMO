/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, oHoldableObject) && !touching) {
	global.switchBlue = !global.switchBlue;
	touching = true;
}
if (!place_meeting(x, y, oHoldableObject)) {
	touching = false;	
}

if (!global.switchBlue)
{
	sprite_index = sTargetOrange;	
}
else
{
	sprite_index = sTargetBlue;	
}