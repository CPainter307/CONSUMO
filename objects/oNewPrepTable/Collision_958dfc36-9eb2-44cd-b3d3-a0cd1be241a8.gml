/// @description Handles catching unprepped ingredients into the table

//accept ingredients only if they're unprepared and not being held
if (!other.placed && !other.followingL && !other.followingR) {
	if (ingr1 == noone) {
		ingr1 = other;
		ingr1.placed = true;
	}
	if (!other.placed && ingr2 == noone && ingr1 != noone) {
		ingr2 = other;
		ingr2.placed = true;
	}
	if (!other.placed && ingr3 == noone && ingr2 != noone && ingr1 != noone) {
		ingr3 = other;
		ingr3.placed = true;
	}
}