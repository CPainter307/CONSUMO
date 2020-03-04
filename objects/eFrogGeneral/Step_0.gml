event_inherited()

//change target
for (var i = 0; i < ds_list_size(oParty.allAdventurers); i++) {
	if instance_exists(ds_list_find_value(oParty.allAdventurers, i)) {
		target = ds_list_find_value(oParty.allAdventurers, i)
	}
}

//dont do anything if target is dead
if !instance_exists(target) {
	exit	
}

//change collision for one way platforms
if target.walking_on == oOneWayPlatform {
	collidable = oCollidable
} else {
	collidable = oWall	
}

motionx = 0;

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
		proj_hitbox = instance_create_layer(x, y-100, "Objects", oProjectile)
		proj_hitbox.dirx = sign(x-target.x)*-1
		image_xscale = sign(x-target.x);
		projectile_timer = SHOOT_TIME
	}
}

#region collision
//collision
if (!place_meeting(x,y+motiony,collidable))
{
	//add gravity
	motiony += grv;
	
	//if the frog has reached the peak of his jump, start slamming
	if (motiony > 0) {
		if !falling {
			slam_hitbox = instance_create_depth(x, y, -y, Hitbox)
			slam_hitbox.destroy_timer = -1
		}
		slam_hitbox.x = x
		slam_hitbox.y = y
		slam_hitbox.movePower = 10;
		slam_hitbox.attack = 20;
		slam_hitbox.attackMultiplier = 1;
		motiony = 50;
		falling = true;
	}
}

//if the frog has touched the ground
if(place_meeting(x, y+motiony, collidable)) { 
	while(!place_meeting(x, y+sign(motiony), collidable)) {
		y += sign(motiony);
		shake = shake_duration
	}
	motiony = 0;
	falling = false;
	
	if instance_exists(slam_hitbox) {
		instance_destroy(slam_hitbox)	
	}
	
	time++;
}

//screenshake
if (shake > 0) {
	scr_screenshake(20, 30)
	shake -= 1
} else {
	shake = 0	
}
//if our frog boi has been on the ground for 5 seconds, jump
if (!falling && time == 300) {
	time = 0;
	motiony = -20;
}


//////////////////////////////
//Phase 2: Slamming behavior//
//////////////////////////////
if (phase == 2) {
	if (motiony < 0 && is_above == false) {
		if (x > target.x + sprite_width/2 && x < target.x - sprite_width/2) {
			motionx = sign(target.x - x) * (abs(x - target.x)/(sprite_width)) *20 ;
		}
		else {
			motionx = sign(target.x - x) * 10;	
		}
	}
	if (abs(x - target.x) < 10) {
			is_above = true;
			
	}
	else if ((target.x > x + sprite_width/2 || target.x < x - sprite_width/2)){
		is_above = false;
	}
}
if(place_meeting(x + motionx, y, collidable)) { 
	while(!place_meeting(x + sign(motionx), y, collidable)) {
		x += sign(motionx);
	}
	motionx = 0;
}

//Debug trick for bring health down
if (keyboard_check(ord("H"))) currentHealth--;

#endregion

if (place_meeting(x, y, target)) {
	//game_restart();	
}
y += motiony;
x += motionx;
