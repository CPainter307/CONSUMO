/// @arg item

for (var i = 0; i < maxItems; i++) {
	if (global.inventory[i] == argument0)  { // if contains arg0
		global.inventory[i] = noone;
		return(1);
	}
}
return(0);