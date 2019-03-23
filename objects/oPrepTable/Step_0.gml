/// @description What happens every step

//left justification
if (leftIngr == noone && !rightIngr == noone) {
	leftIngr = rightIngr;
	rightIngr = noone;
}

//positioning on table
if (!leftIngr == noone) {
	leftIngr.x = x - 10;
	leftIngr.y = y - 5;
}

if (!rightIngr == noone) {
	rightIngr.x = x + 10;
	rightIngr.y = y - 5;
}

//removing from table
if (leftIngr.followingL || leftIngr.followingR) {
	leftIngr = noone;
}

if (rightIngr.followingL || rightIngr.followingR) {
	rightIngr = noone;
}