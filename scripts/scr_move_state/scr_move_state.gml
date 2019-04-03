oPlayer.moveStateExecuted = true;
var framesInAir = 0;

//room restart
if(oPlayerInput.key_room_reset) {
	SlideTransition(TRANS_MODE.ROOM_RESTART);
}

if(oPlayerInput.key_jump) {
	jumpQueuFramesElapsed = 0;
}

//increases the Coyote Jump buffer if falling
if(!place_meeting(x, y + vsp, oWall)) {
	buff += 0.3;
}

if (buff >= 1.2 && currentJumps == 0) {
	currentJumps += 1;
}

//increase gravity if falling
if(vsp > 0) {
	vsp += .75
}

//calculate movement (player locking mechanics included)
if (oPlayerInput.key_locked) {
	isLocked = true;
} else {
	isLocked = false;	
}

if (isLocked) {
	var move = 0;
} else {
	var move = oPlayerInput.key_right - oPlayerInput.key_left;	
}
 
if (vsp == 0 && place_meeting(x ,y + 1,oWall)) { 
	hsp = walksp * move;
	vsp += grv;
} else if (hsp == 0) {
	hsp = walksp * move;
} else if (oPlayerInput.key_right && hsp < 0) {  //moving 
	hsp += (1/power(2, framesInAir));
	vsp += grv;
	framesInAir += .01;
} else if (oPlayerInput.key_left && hsp > 0) {
	hsp -= (1/power(2, framesInAir));
	vsp += grv;
	framesInAir += .01;
}

if (((totalJumps - currentJumps) > 0) && (jumpQueuFramesElapsed <= 3)) {	 
	vsp = -JUMP_HEIGHT;
	currentJumps += 1;
}

if  (vsp < 0 && !oPlayerInput.key_jump_held) {
	vsp = max(vsp, 0);
	currentJumps += 1;
}

if (!oPlayerInput.key_jump) {
	vsp += grv;
}

if (oPlayerInput.key_jump_held && place_meeting(x,y + vsp,oWall)) {
	vsp += grv;
}


if (hsp != 0) {
	hsp_dir = sign(hsp);	
}
if (vsp != 0) {
	vsp_dir = sign(vsp);
}



//horizontal collision
if(place_meeting(x+hsp, y, oWall)) {
	while(!place_meeting(x+sign(hsp), y, oWall)) {
		x += sign(hsp);
	}
	hsp = 0; 
}
x += hsp;
 
 
 
//vertical collision (includes Coyote Jump buffer reset)
if(place_meeting(x, y+vsp, oWall)) { 
	buff = 0.3;
	while(!place_meeting(x, y+sign(vsp), oWall)) {
		y += sign(vsp);
	}
	framesInAir = 0;
	vsp = 0;
}
y += vsp;
 
 
 
//ground detection
if(place_meeting(x, y+1, oWall)) {
	currentJumps = 0;
	currentWallJumps = 0;
	spriteTurnFrames = 0;
	//sprite_index = sPlayerIdle;
}



//ledge grab
var spr_pos = (79/2)+6;
var offsetx = 30;
if (oPlayer.facingRight) {
	offsetx = 30
} else {
	offsetx = -30
}
var was_free = !position_meeting(x+((spr_pos)*hsp_dir+offsetx), yprevious-4, oWall);
var is_not_free = position_meeting(x+((spr_pos)*hsp_dir+offsetx), y-4, oWall);
var near_ground = position_meeting(x, y+(spr_pos*vsp_dir)+60, oWall);
var moving_down = yprevious < y;
if (!near_ground && was_free && is_not_free && moving_down && !(oPlayer.holdingL && oPlayer.holdingR)) {
	hsp = 0;
	vsp = 0;
	
	//move against the ledge
	while (!place_meeting(x+hsp_dir, y, oWall)) {
		x += hsp_dir;
	}
	
	//make sure we are the right height
	while (position_meeting(x+(spr_pos*hsp_dir), y-5, oWall)) {
		y -= 1;	
	}
	
	state = scr_ledge_grab_state;
}
 
 
 
//animation
if(!place_meeting(x, y+1, oWall)) {
	if(sign(vsp) < 0) {
		sprite_index = sPlayerJump;
	} else if(sign(vsp) > 0) {
		sprite_index = sPlayerFall;
	} 
} else {
	if(hsp == 0) {
		sprite_index = sPlayerIdle;
	} else {
		sprite_index = sPlayerRun;
	}
}




//if (hsp != 0) image_xscale = sign(hsp);
if ((place_meeting (x, y + 1, oWall)) && hsp != 0) {
	if (sign(hsp) < 0) {
		facingRight = false;
	} 
	else if (sign(hsp) > 0) {
		facingRight = true;
	}
	image_xscale = 0.5 * sign(hsp);
}

jumpQueuFramesElapsed++;

// Back Arm
//if player facing right
if (oPlayer.facingRight) {
	if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
		oBackArm.sprite_index = sBackArmL; //later swap for sBackArmLMoving
	}
	else {
		oBackArm.sprite_index = sBackArmL;	
	}
	oBackArm.x = oPlayer.x - 0;
	oBackArm.y = oPlayer.y - 8;
}

//if player facing left
else {
	if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
		oBackArm.sprite_index = sBackArmR; //later swap for sBackArmRMoving
	}
	else {
		oBackArm.sprite_index = sBackArmR;
	}
	oBackArm.x = oPlayer.x - 0;
	oBackArm.y = oPlayer.y - 12;
}

// Front Arm
//if player facing right
if (oPlayer.facingRight) {
	if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
		oFrontArm.sprite_index = sFrontArmRMoving;
	}
	else {
		oFrontArm.sprite_index = sFrontArmR;	
	}
	oFrontArm.x = oPlayer.x - 13;
	oFrontArm.y = oPlayer.y - 12;
}

//if player facing left
else {
	if (oPlayer.hsp != 0 && oPlayer.vsp == 0) {
		oFrontArm.sprite_index = sFrontArmL; //later swap for sFrontArmLMoving
	}
	else {
		oFrontArm.sprite_index = sFrontArmL;
	}
	oFrontArm.x = oPlayer.x + 21;
	oFrontArm.y = oPlayer.y - 12;
}
