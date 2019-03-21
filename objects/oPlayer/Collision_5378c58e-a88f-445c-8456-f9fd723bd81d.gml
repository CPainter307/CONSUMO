/// @description Go through the door
if (oPlayerInput.key_down) {
	if (room_exists(other.new_room)) {
		room_goto(other.new_room);
		x = other.new_x;
		y = other.new_y;
//Eventually, we'll want to get rid of these next 2 lines once we make the rooms persistent
		holdingL = false;
		holdingR = false;
	}
}