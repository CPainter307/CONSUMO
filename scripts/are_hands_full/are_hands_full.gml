is_full = true
for (var i = 0; i < 3; i++) {
	if oPlayer.held_items[i] == noone {
		is_full = false
		break
	}
}
return is_full