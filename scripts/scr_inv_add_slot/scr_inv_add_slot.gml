/// @arg item
/// @arg slot


if (global.inventory[argument1] == noone)  {
	global.inventory[argument1] = argument0;
	return(1);
}
return(0);