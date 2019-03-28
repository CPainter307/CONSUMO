/// @arg item

for (var i = 0; i < maxItems; i++) {
	if (global.inventory[i] == argument0)  { // if contains arg0
		return(1);
	}
}
return(0);