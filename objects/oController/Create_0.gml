//An object that should always be in every room
//Used to store enums and global variables
//Used to run any step checks that should never stop running... ever

enum direc {
	none,
	right,
	up,
	left,
	down,
	up_right,
	up_left,
	down_left,
	down_right
}

enum targ_type {
	pass,
	fall
}

enum ingr {
	oMeat,
	oFish,
	oOnion,
	oSalt,
	oApple,
	oLettuce,
	oPaprika,
	oMushroom,
	oRice
}

global.direction8 = false;
global.switchBlue = true;