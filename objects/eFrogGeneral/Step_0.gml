event_inherited()

projectile_timer--
if projectile_timer <= 0 {
	var inst = instance_create_layer(x, y-100, "Objects", oProjectile)
	inst.dirx = sign(x-oPlayer.x)*-1
	image_xscale = sign(x-oPlayer.x);
	projectile_timer = SHOOT_TIME
}

#region collision
//collision
if (!place_meeting(x,y+motiony,oWall))
{
	//add gravity
	motiony += grv;
	
	//if the frog has reached the peak of his jump, start slamming
	if (motiony > 0) {
		motiony = 50;
		falling = true;
	}
}

//if the frog has touched the ground
if(place_meeting(x, y+motiony, oWall)) { 
	while(!place_meeting(x, y+sign(motiony), oWall)) {
		y += sign(motiony);
	}
	motiony = 0;
	falling = false;
	time++;
}

//if our frog boi has been on the ground for 5 seconds, jump
if (!falling && time == 300) {
	time = 0;
	motiony = -20;
	
}

y += motiony;
#endregion

if (place_meeting(x, y, oPlayer)) {
	game_restart();	
}