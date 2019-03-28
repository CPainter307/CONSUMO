if (oPlayerInput.key_inventory && !showInv) {
	showInv = true;
} else if (oPlayerInput.key_inventory && showInv) {
	showInv = false;
}
for (var i = 0; i < maxItems; i++) {
	show_debug_message(string(i) + ": " + string(global.inventory[i]));
}