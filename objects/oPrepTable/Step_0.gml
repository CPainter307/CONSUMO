/// @description What happens every step

//positioning on table
if (leftIngr != noone) {
	leftIngr.gravity = 0;
	leftIngr.speed = 0;
    leftIngr.x = x - 28;
    leftIngr.y = y - 5;

    //removing from table
    if (leftIngr.followingL || leftIngr.followingR) {
        leftIngr = noone;
    }
}

if (rightIngr != noone) {
	rightIngr.gravity = 0;
	rightIngr.speed = 0;
    rightIngr.x = x + 28;
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

//Destroys button if player walks away
if instance_exists(oButton)
{
	if(!place_meeting(x,y,oPrepTable))
	{
		instance_destroy(oButton)	
	}
}