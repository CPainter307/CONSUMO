/// @description What happens every step

//positioning on table
if (leftIngr != noone) {
	leftIngr.gravity = 0;
	leftIngr.speed = 0;
    leftIngr.x = x - 10;
    leftIngr.y = y - 5;

    //removing from table
    if (leftIngr.followingL || leftIngr.followingR) {
        leftIngr = noone;
    }
}

if (rightIngr != noone) {
	rightIngr.gravity = 0;
	rightIngr.speed = 0;
    rightIngr.x = x + 10;
    rightIngr.y = y - 5;

    //removing from table
    if (rightIngr.followingL || rightIngr.followingR) {
        rightIngr = noone;
    }
}


//left justification
if (leftIngr == noone && rightIngr != noone) {
    leftIngr = rightIngr;
    rightIngr = noone;
}
