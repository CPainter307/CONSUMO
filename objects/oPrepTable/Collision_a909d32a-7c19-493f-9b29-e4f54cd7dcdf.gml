/// @description Handles catching unprepped ingredients into the table

//accept ingredients only if they're unprepared and not being held
if (!other.prepared && !other.followingL && !other.followingR) {
	if (leftIngr == noone) {
		leftIngr = other;
	}
	if (!leftIngr == noone && rightIngr == noone) {
		rightIngr = other;
	}
}
