is_empty = false
for (var i = 0; i < 3; i++) {
	if oPlayer.held_items[i] != noone {
		is_empty = true
		break
	}
}
return is_empty