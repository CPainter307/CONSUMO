//create particle system
global.ps = part_system_create();

#region DUST
//init global dust particle
global.pt_dust = part_type_create();
var pt = global.pt_dust;
	
//settings for dust
part_type_sprite(pt, sDustParticle, false, true, true);
part_type_size(pt, .1, .2, 0, 0);
part_type_direction(pt, 1, 360, 0, 5);
part_type_speed(pt, 1, 5, -.1, 0);
part_type_gravity(pt, 0, 270);
part_type_life(pt, 5, 10);
part_type_scale(pt, 5, 5)
#endregion

#region BUFF PARTICLES
//Attack Buff
global.pt_AttackBuff = part_type_create();
part_type_shape(global.pt_AttackBuff, pt_shape_pixel);
part_type_sprite(global.pt_AttackBuff, sSuckyStar, 1, 1, 0);
part_type_size(global.pt_AttackBuff, 1, 1.30, 0, 0);
part_type_scale(global.pt_AttackBuff, 0.25, 0.25);
part_type_orientation(global.pt_AttackBuff, -358, 355, 2, 1, 0);
part_type_color3(global.pt_AttackBuff, 255, 2960895, 16777215);
part_type_alpha3(global.pt_AttackBuff, 1, 1, 1);
part_type_blend(global.pt_AttackBuff, 1);
part_type_life(global.pt_AttackBuff, 60, 65);
part_type_speed(global.pt_AttackBuff, 0.50, 0.50, 0, 1);
part_type_direction(global.pt_AttackBuff, 0, 360, 0, 0);
part_type_gravity(global.pt_AttackBuff, 0.06, 90);

//Defense Buff
global.pt_DefenseBuff = part_type_create();
part_type_shape(global.pt_DefenseBuff, pt_shape_pixel);
part_type_sprite(global.pt_DefenseBuff, sSuckyStar, 1, 1, 0);
part_type_size(global.pt_DefenseBuff, 1, 1.30, 0, 0);
part_type_scale(global.pt_DefenseBuff, 0.25, 0.25);
part_type_orientation(global.pt_DefenseBuff, -358, 355, 2, 1, 0);
part_type_color3(global.pt_DefenseBuff, 16711680, 16776960, 16777215);
part_type_alpha3(global.pt_DefenseBuff, 1, 1, 1);
part_type_blend(global.pt_DefenseBuff, 1);
part_type_life(global.pt_DefenseBuff, 60, 65);
part_type_speed(global.pt_DefenseBuff, 0.50, 0.50, 0, 1);
part_type_direction(global.pt_DefenseBuff, 0, 360, 0, 0);
part_type_gravity(global.pt_DefenseBuff, 0.06, 90);

//Speed Buff
global.pt_SpeedBuff = part_type_create();
part_type_shape(global.pt_SpeedBuff, pt_shape_pixel);
part_type_sprite(global.pt_SpeedBuff, sSuckyStar, 1, 1, 0);
part_type_size(global.pt_SpeedBuff, 1, 1.30, 0, 0);
part_type_scale(global.pt_SpeedBuff, 0.25, 0.25);
part_type_orientation(global.pt_SpeedBuff, -358, 355, 2, 1, 0);
part_type_color3(global.pt_SpeedBuff, 46003, 65535, 16777215);
part_type_alpha3(global.pt_SpeedBuff, 1, 1, 1);
part_type_blend(global.pt_SpeedBuff, 1);
part_type_life(global.pt_SpeedBuff, 60, 65);
part_type_speed(global.pt_SpeedBuff, 0.50, 0.50, 0, 1);
part_type_direction(global.pt_SpeedBuff, 0, 360, 0, 0);
part_type_gravity(global.pt_SpeedBuff, 0.06, 90);

//Pop Effect
global.pt_BuffPop = part_type_create();
part_type_shape(global.pt_BuffPop, pt_shape_star);
part_type_size(global.pt_BuffPop, 0.10, 0.10, 0, 0.10);
part_type_scale(global.pt_BuffPop, 0.25, 0.25);
part_type_orientation(global.pt_BuffPop, -8, 326, 3, 4, 1);
part_type_color3(global.pt_BuffPop, 16777215, 16777215, 16777215);
part_type_alpha3(global.pt_BuffPop, 1, 0.56, 0.08);
part_type_blend(global.pt_BuffPop, 1);
part_type_life(global.pt_BuffPop, 10, 20);
part_type_speed(global.pt_BuffPop, 10, 10, 0, 0);
part_type_direction(global.pt_BuffPop, 0, 360, 0, 0);
part_type_gravity(global.pt_BuffPop, 1, 269);

//Linking Particle Types together (Death and Step)
//part_type_death(global.pt_DefenseBuff, 1, global.pt_BuffPop);
//part_type_death(global.pt_DefenseBuff, 1, global.pt_BuffPop);
//part_type_death(global.pt_SpeedBuff, 1, global.pt_BuffPop);


global.pe_AttackBuff = part_emitter_create(global.ps);
global.pe_DefenseBuff = part_emitter_create(global.ps);
global.pe_SpeedBuff = part_emitter_create(global.ps);

#endregion