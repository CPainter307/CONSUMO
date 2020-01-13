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

#region AURA
//init global aura particle
global.pt_aura = part_type_create();
var pta = global.pt_aura;

//settings for aura
part_type_sprite(pta, sAuraStar, false, true, true);
part_type_size(pt, 1, 1, 2, 2);
part_type_direction(pta, 1, 360, 0, 5);
part_type_speed(pta, 1, 5, -.1, 0);
part_type_gravity(pta, 0, 270);
part_type_life(pta, 60, 120);
part_type_scale(pta, 5, 5)
#endregion