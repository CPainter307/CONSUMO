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
	fall,
	launch
}

enum ingr {
	oBuffer,
	oMeat,
	oFish,
	oApple,
	oOnion,
	oLettuce,
	oSalt,
	oPaprika,
	oMushroom,
	oRice
}

global.direction8 = false;
global.switchBlue = true;

//CampFire Variables
global.campfire_list = [pointer_null];	//array that stores IDs of campfires in rotation order
global.campfire_list_i = 0;	//index for storing IDs in the campfire_list
global.campfire_pulse = false;	//variable that's true for one step when all campfires should shift a spot
campfire_i = 0;	//counter for campfire_pulse
campfire_check = 120;	//time limit to reach for pulse
campfire_link_count = 0;	//number of links that are in the room
global.campfire_link_i = 0;	//counter for number of links that are setup
global.campfire_link_initial_setup = false;	//true if all initial link setup is complete
global.campfire_link_complete = false;	//true if all link setup is complete
pot_count = 0;	//number of pots that are in the room
global.pot_i = 0;	//counter for number of pots that are setup
global.campfire_complete = false;	//true if all pots and campfire setup is complete (timer can start)