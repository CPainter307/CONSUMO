var direction8 = global.direction8;
xx = oPlayer.x
yy = oPlayer.y
damp = 0.9967

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
spd = oHoldableObject.throw_speed; // pix/sec
spd = spd / oHoldableObject.update_speed   // pix/step
//start at x,y of launcher, (my sprite has the origns in the middle of the Y part of the sling)
empty = true;
//what are the dx,dy for movement
	if (direction8) {
		dir = scr_8_to_deg();
			}

vx = lengthdir_x(spd,dir); // pix/sec
vy = lengthdir_y(spd,dir);


//the gravity
lGrav = oHoldableObject.grav; // meter/sec^2

//dragging, draw the lineif(mouse_check_button(mb_left))
count = 0;

    draw_primitive_begin(pr_linelist)
    draw_vertex_color(xx,yy,c_lime,1)
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
		spd = spd //* damp
		vx = lengthdir_x(spd,dir);
		vy = lengthdir_y(spd,dir);
		

		if (instance_position(xx, yy, oWall)) {
			empty = false;
			//For some reason, the image speed has to be set to a really low value
			image_speed = 0.15; //Animates the reticle
			draw_sprite(sReticle, image_index, xx, yy) //somehow animate 
			
		}
		else {
			draw_vertex_color(xx,yy,c_lime,1)
		}
    }
    draw_primitive_end();
    

