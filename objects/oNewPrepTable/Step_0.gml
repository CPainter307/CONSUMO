//check to see if there are preparable objects on table
empty = true;

//if there's an ingredient in ingr1, if unprepared, empty is false
if (ingr1 != noone) {
	if (!ingr1.prepared) {
		empty = false;
	}
}

//if there's an ingredient in ingr2, if unprepared, empty is false
if (ingr2 != noone) {
	if (!ingr2.prepared) {
		empty = false;
	}
}

//if there's an ingredient in ingr3, if unprepared, empty is false
if (ingr3 != noone) {
	if (!ingr3.prepared) {
		empty = false;
	}
}

//positioning on table ingr1
if (ingr1 != noone) {
	ingr1.gravity = 0;
	ingr1.speed = 0;
    ingr1.x = x - 28;
    ingr1.y = y - 5;

    //removing from table
    if (ingr1.followingL || ingr1.followingR) {
		ingr1.placed = false;
        ingr1 = noone;
    }
}

//positioning on table ingr2
if (ingr2 != noone) {
	ingr2.gravity = 0;
	ingr2.speed = 0;
    ingr2.x = x;
    ingr2.y = y - 5;

    //removing from table
    if (ingr2.followingL || ingr2.followingR) {
		ingr2.placed = false;
        ingr2 = noone;
    }
}

//positioning on table ingr3
if (ingr3 != noone) {
	ingr3.gravity = 0;
	ingr3.speed = 0;
    ingr3.x = x + 28;
    ingr3.y = y - 5;

    //removing from table
    if (ingr3.followingL || ingr3.followingR) {
		ingr3.placed = false;
        ingr3 = noone;
    }
}

/**
//left justification
if (ingr2 == noone) {
	if (ingr3 != noone) {
		ingr2 = ingr3;
		ingr3 = noone;
	}
}
if (ingr1 == noone) {
	if (ingr2 != noone) {
		ingr1 = ingr2;
		ingr2 = noone;
	}
}*/

//Destroys button if player walks away
if instance_exists(oButton)
{
	if(!place_meeting(oPlayerPickUpRadius.x, oPlayerPickUpRadius.y, oNewPrepTable))
	{
		instance_destroy(oButton)	
	}
}

//Destroys knife icon if player walks away
if instance_exists(oKnifeIcon)
{
	if(!place_meeting(x, y, oPlayerPickUpRadius))
	{
		instance_destroy(oKnifeIcon)	
		knifeCreated = false;
	}
}

//Destroy bar if player walks away
if (instance_exists(oChoppingGameBar)) {
	if (!place_meeting(x, y, oPlayerPickUpRadius)) { //used to also or empty and fullOfPrepped
		instance_destroy(oChoppingGameBar);
	}
	if (empty) instance_destroy(oChoppingGameBar);
}

//Destroy bar if player walks away
if (instance_exists(oChoppingGameReticle)) {
	if (!place_meeting(x, y, oPlayerPickUpRadius)) { //used to also or empty and fullOfPrepped
		instance_destroy(oChoppingGameReticle);
	}
	if (empty) instance_destroy(oChoppingGameReticle);
}

/**
//calculate whether table is full prepped food
if (ingr1 != noone && ingr2 != noone && ingr3 != noone) {
	if (ingr1.prepared && ingr2.prepared && ingr3.prepared) {
		fullOfPrepped = true;
	}
	else {
		fullOfPrepped = false;
	}
}
if (ingr1 != noone && ingr2 != noone && ingr3 == noone) {
	if (ingr1.prepared && ingr2.prepared) {
		fullOfPrepped = true;
	}
	else {
		fullOfPrepped = false;
	}
}
if (ingr1 != noone && ingr2 == noone && ingr3 == noone) {
	if (ingr1.prepared) {
		fullOfPrepped = true;
	}
	else {
		fullOfPrepped = false;
	}
} */