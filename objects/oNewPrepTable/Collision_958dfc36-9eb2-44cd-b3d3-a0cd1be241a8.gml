/// @description Handles catching unprepped ingredients into the table

//accept ingredients only if they're unprepared and not being held
if (!other.placed && !other.followingL && !other.followingR && !other.prepared) {
	if (ingr1 == noone && !other.placed) {
		ingr1 = other;
		ingr1.placed = true;
	}
	if (ingr2 == noone && !other.placed) {
		ingr2 = other;
		ingr2.placed = true;
	}
	if (ingr3 == noone && !other.placed) {
		ingr3 = other;
		ingr3.placed = true;
	}
}