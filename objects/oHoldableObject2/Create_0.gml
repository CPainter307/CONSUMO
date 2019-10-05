GRAV = 1;					//normal gravity constant
GRAV_DIR = 270;				//direction gravity acts in
THROW_SPEED = 0;			//initial throw speed
POST_THROW_SPEED = 0;		//speed to be set after throw
THROW_DURATION = 0;			//amount of frames throw is active (throw is initial vector while gravity is off)
throw_i = 0;				//tracker for number of frames throw has been active

on_floor = false;			//boolean value true if object is on the ground

//turns on gravity
gravity = GRAV;
gravity_direction = GRAV_DIR;

name = ""
followingL = false;
followingR = false;
highlighted = false;
playedPickupSound = false;
objDepth = depth;
placed = false;

image_xscale = .5
image_yscale = .5

pickUpSound = snd_pickup_generic;