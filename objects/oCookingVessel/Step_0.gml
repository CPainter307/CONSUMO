/// @description 
if (phy_speed_x == 0 and phy_speed_y == 0) {
	if !onFire
		sprite_index = sPottyDormant;
}

if instance_exists(steam) {
	steam.x = x
	steam.y = y-oPot.sprite_height
}

// checks to see if recipe is done
if (!ds_grid_value_exists(item_grid, 0, 0, 0, 2, noone)) {
	// JUST RIGHT
	if (timeline_position >= 270 and timeline_position < 540) {
		if oPlayerInput.key_heavy_throw and place_meeting(x, y, oPlayer) { // ---------oPlayerInput.key_heavy_throw <-> oPlayerInput.key_interact
			scr_extract_recipe(0);
		}
	}
	//burnt
	else if (timeline_position >= 540) {
		if oPlayerInput.key_heavy_throw and place_meeting(x, y, oPlayer) { // ---------oPlayerInput.key_heavy_throw <-> oPlayerInput.key_interact
			scr_extract_recipe(1);
		}
	}
}
if (!onFire || held) {
	currentlyCooking = false;
	timeline_running = false;
	with(steam) {
		steam = noone
		instance_destroy();	
	}
}

//pot inventory
if collision_circle(x, y, pot_radius, oPlayer, false, true) {
	if (oPlayerInput.key_interact and !held and !is_holding_items()) { // ---------oPlayerInput.key_interact <-> oPlayerInput.key_sprint_held
		held = true;
	}
}

vesselList = ds_list_create()
vesselRadius = collision_circle_list(x, y, pot_radius, oIngredient, false, true, vesselList, true)

if vesselRadius > 0 /*and vesselList[| 0].prepared*/ {
	//if item is not held and pot is not full
	// if the item is currently being thrown, then it will be added to the pot
	if (ds_grid_value_exists(item_grid, 0, 0, 0, 2, noone)) {
		add_to_pot(vesselList[| 0])
	}
}

if collision_circle(x, y, pot_radius, oCampfire, false, true) {
	if !currentlyCooking
		sprite_index = sPottyGlowing;
	onFire = true;
}
else {
	onFire = false;	
}

if (!ds_grid_value_exists(item_grid, 0, 0, 0, 2, noone) && currentlyCooking == false && onFire && !held) {	
	//set list of ingredients for script
	currentlyCooking = true;

	//run timeline
	timeline_index = tl_cooking;
	timeline_position = 0;
	timeline_running = true;
	timeline_loop = false;
}

if (currentlyCooking) {
	if onFire {
		sprite_index = sPottyCooking;
	}
}

if held/* and !is_holding_items() and !oPlayer.holding_big_item*/ {
	lineToggle = true;
	sprite_index = sPottyHeld;
	if (oPlayer.player_dir == 1) {
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}
	phy_position_x = oPlayer.x + (-20 * sign(oPlayer.player_dir));
	phy_position_y = oPlayer.y - 15;
	
	phy_linear_velocity_x = 0;
	phy_linear_velocity_y = 0;
}
if (oPlayerInput.key_throw && held) {  // ---------oPlayerInput.key_throw <-> !oPlayerInput.key_sprint_held
	oPlayer.holding_big_item = false
	lineToggle = false;
	oPlayer.image_index = 0
	oPlayer.sprite_index = sPlayerThrow
	oPlayer.player_dir = sign(oPlayer.x - mouse_x) // sets the player's direction to the direction they are throwing during the animation
	image_xscale = -sign(x - mouse_x) //sets the pot's direction to the direction they're thrown
	throw_object(self, mouse_x, mouse_y, throw_speed)	
	held = false;
	phy_fixed_rotation = true;
	phy_angular_velocity = 0;
	//physics_world_gravity(0, gravity_loc)
}

if ((phy_speed_x != 0 or phy_speed != 0) and !held) {
	sprite_index = sPottyThrown;
	if (phy_speed_x > 0) {
		image_xscale = 1;
	}else {
		image_xscale = -1;
	}
}


if held {
	oPlayer.holding_big_item = true
}
show_debug_message(string(oPlayer.holding_big_item))

phy_rotation = 0;
ds_list_destroy(vesselList)