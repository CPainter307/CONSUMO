if (global.canMove && instance_exists(oPlayer)) { //Temp crash fix
	var direction8 = global.direction8;
	xx = oPlayer.x
	yy = oPlayer.y
	damp = 0.9967

	//from oHoldableObject, used because it causes a crash when there is only one holdable in the room
	throw_speed = 1000;
	gravity_loc = 90;
	meter_per_pix =  0.1
	update_speed = 120
	grav = gravity_loc; // meter/sec^2
	grav = grav / meter_per_pix   //  pix/sec^2
	grav = grav /  sqr(update_speed)

	draw_freq = 5
	outline_size = 4
	circle_size = 3
	spin_rate = 20
	rotation_speed = 2

	//draw_self();
	//figure the mouse dir and distance for aiming and force
	if global.input_type == inputs.keyboard {
		dir = point_direction(xx, yy, mouse_x, mouse_y);
	}
	if global.input_type == inputs.analog_stick {
		if abs(oPlayerInput.haxis) > .1 or abs(oPlayerInput.vaxis)  > .1 {
			dir = point_direction(0, 0, oPlayerInput.haxis, oPlayerInput.vaxis);
		}
	}

	spd = throw_speed; // pix/sec
	spd = spd / update_speed   // pix/step

	//start at x,y of launcher, (my sprite has the origns in the middle of the Y part of the sling)
	empty = true;
	//what are the dx,dy for movement
		if (direction8) {
			dir = scr_8_to_deg();
				}

	vx = lengthdir_x(spd,dir); // pix/sec
	vy = lengthdir_y(spd,dir);


	//the gravity
	lGrav = grav; // meter/sec^2
	//dragging, draw the lineif(mouse_check_button(mb_left))
	count = 0;
	    //draw_primitive_begin(pr_linelist)
	    //draw_vertex_color(xx,yy,c_lime,1)
	    //while(0<yy<500)
	
		while(empty)
	    {
			count++
			if (count >= 300) {
				empty = false;	
			}
        
	        vy+= lGrav; //add gravity to dy
			dir = point_direction(xx, yy, xx + vx, yy + vy)
			xx+=vx; //add dx
	        yy+=vy; //add dy
			spd = sqrt(sqr(vx) + sqr(vy))
		//	spd = spd * damp
			vx = lengthdir_x(spd,dir);
			vy = lengthdir_y(spd,dir);
		

			if (instance_position(xx, yy, oWall)) {
				empty = false;
				//For some reason, the image speed has to be set to a really low value
				//image_speed = 0.15; //Animates the reticle
				image_angle+=rotation_speed
				draw_sprite_ext(sReticle, 0, xx, yy, 1+sin(get_timer()/100000)/spin_rate, 1+sin(get_timer()/100000)/spin_rate, image_angle, c_white, 1) //somehow animate 
			}
			else if count % draw_freq == 0 {
				draw_circle_color(xx, yy, outline_size, c_white, c_white, false)
				draw_circle_color(xx, yy, circle_size, c_red, c_red, false)
				//draw_vertex_color(xx,yy,c_lime,1)
			}
	    }
	    //draw_primitive_end();
	    //rotation+=rotation_speed
}
