///@desc Animates and moves a character
///@arg character
///@arg animation
///@arg imgSpeed
///@arg xmovment
///@arg xspeed
///@arg ymovement
///@arg yspeed

var char = argument0;
var xmov = argument3;
var ymov = argument5;
var xspd = argument4;
var yspd = argument6;
char.sprite_index = argument1;  // Setting the animation
char.image_speed = argument2;	// Setting the animation speed

// X movmenet
if (instance_exists(char)) {
	if (xmov != 0) || (xspd != 0) // If we're moving
	{
		if (char.x < xmov) {
			char.x += xspd;
			if (char.x >= xmov) && ((char.y >= ymov) || (char.y <= ymov)) { // THIS is the code we need to change. This really only works if we're not moving the y position at the same time. Same goes for all other lines like this
				cutscene_end_action();
			}
		} else if (char.x > xmov) {
			char.x -= xspd;
			if (char.x <= xmov) && ((char.y >= ymov) || (char.y <= ymov)) {
				cutscene_end_action();
			}
		}
	}
}

// Y movment
if (instance_exists(char)) {
	if (ymov != 0) || (yspd != 0)
	{
		if (char.y < ymov) {
			char.y += yspd;
			if (char.y >= ymov) && ((char.x >= xmov) || (char.x <= xmov)) {
				cutscene_end_action();
			}
		} else if (char.y > ymov) {
			char.y -= yspd;
			if (char.y <= ymov) && ((char.y >= ymov) || (char.y <= ymov)) {
				cutscene_end_action();
			}
		}
	}
}


//cutscene_end_action();