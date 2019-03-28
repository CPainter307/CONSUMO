/// @arg item

for (var i = 0; i < maxItems; i++) {
	if (global.inventory[i] == noone)  { // if empty
		global.inventory[i] = argument0;
		return(1);
	}
}
return(0);