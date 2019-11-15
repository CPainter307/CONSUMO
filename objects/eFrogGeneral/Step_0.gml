event_inherited()

// If health remaining is 2/3 of the max
if (currentHealth <= ((maxHealth / 3) * 2) && currentHealth > (maxHealth / 3)) {
	phase = 2;
	show_debug_message("Entered phase 2");
	draw_text(x,y,"2");
}

// If health remaing is 1/3 of the max
if (currentHealth <= (maxHealth / 3)) {
	phase = 3;	
	show_debug_message("Entered phase 3");
	draw_text(x,y,"3");
}
////////////////////////////////
//Phase 1: Projectile behavior//
////////////////////////////////
if (phase == 1) {
	projectile_timer--
	if projectile_timer <= 0 {
		var inst = instance_create_layer(x, y-100, "Objects", oProjectile)
		inst.dirx = sign(x-oPlayer.x)*-1
		image_xscale = sign(x-oPlayer.x);
		projectile_timer = SHOOT_TIME
	}
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
		shake = shake_duration
	}
	motiony = 0;
	falling = false;
	time++;
	
	
}
if (shake > 0 and shake != -10) {
	view_xport[0] = view_x + choose(-random(shake_magnitude), random(shake_magnitude))
	view_yport[0] = view_y + choose(-random(shake_magnitude), random(shake_magnitude))
	shake = shake - 1
}
else if (shake != -10) {
		view_xport[0] = view_x
		view_yport[0] = view_y
		shake = -10;
}
//if our frog boi has been on the ground for 5 seconds, jump
if (!falling && time == 300) {
	time = 0;
	motiony = -20;
	
}
y += motiony;

//////////////////////////////
//Phase 2: Slamming behavior//
//////////////////////////////
if (phase == 2) {
	if (motiony < 0 && is_above == false) {
		if (x > oPlayer.x + sprite_width/2 && x < oPlayer.x - sprite_width/2) {
			x += sign(oPlayer.x - x) * (abs(x - oPlayer.x)/(sprite_width)) *20 ;
		}
		else {
			x += sign(oPlayer.x - x) * 10;	
		}
	}
	if (abs(x - oPlayer.x) < 10) {
			is_above = true;
	}
	else if ((oPlayer.x > x + sprite_width/2 || oPlayer.x < x - sprite_width/2)){
		is_above = false;
	}
}

//Debug trick for bring health down
if (keyboard_check(ord("H"))) currentHealth--;

#endregion

if (place_meeting(x, y, oPlayer)) {
	//game_restart();	
}