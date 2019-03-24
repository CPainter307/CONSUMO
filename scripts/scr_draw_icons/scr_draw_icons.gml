/// @desc scr_draw_icons (nx, ny, hand, draw_icons, which_icons)
/// @arg nx
/// @arg ny
/// @arg hand
/// @arg draw_icons
/// @arg which_icons

var numBoosts = 0;
var icons_drawn = 0;
var nx = argument0;
var ny = argument1;
var hand = argument2;
var draw_icons = argument3;
var which_icons = argument4;

if (hand.hp != 0) {
	draw_icons[0] = 1;
	if (hand.hp > 0) {
		which_icons[0] = sIconsPositive;
	} else if (hand.hp < 0) {
		which_icons[0] = sIconsNegative;
	}
	numBoosts++;
} else draw_icons[0] = 0;
if (hand.attack != 0) {
	draw_icons[1] = 1;
	if (hand.attack > 0) {
		which_icons[1] = sIconsPositive;
	} else if (hand.attack < 0) {
		which_icons[1] = sIconsNegative;
	}
	numBoosts++;
} else draw_icons[1] = 0;
if (hand.defense != 0) {
	draw_icons[2] = 1;
	if (hand.defense > 0) {
		which_icons[2] = sIconsPositive;
	} else if (hand.defense < 0) {
		which_icons[2] = sIconsNegative;
	}
	numBoosts++;
} else draw_icons[2] = 0;
if (hand.spd != 0) {
	draw_icons[3] = 1;
	if (hand.spd > 0) {
		which_icons[3] = sIconsPositive;
	} else if (hand.spd < 0) {
		which_icons[3] = sIconsNegative;
	}
	numBoosts++;
} else draw_icons[3] = 0;
if (hand.elmatk != 0) {
	draw_icons[4] = 1;
	if (hand.elmatk > 0) {
		which_icons[4] = sIconsPositive;
	} else if (hand.elmatk < 0) {
		which_icons[4] = sIconsNegative;
	}
	numBoosts++;
} else draw_icons[4] = 0;
if (hand.elmdef != 0) {
	draw_icons[5] = 1;
	if (hand.elmdef > 0) {
		which_icons[5] = sIconsPositive;
	} else if (hand.elmdef < 0) {
		which_icons[5] = sIconsNegative;
	}
	numBoosts++;
} else draw_icons[5] = 0;
		
switch (numBoosts) {
	case 0:
	break;
			
	case 1:
		for (var i = 0; i < 6; i++) {
			if (draw_icons[i] == 1) {
				draw_sprite(which_icons[i], i, nx, ny);
				break;
			}
		}
	break;
			
	case 2:
		for (var i = 0; i < 6; i++) {
			if (draw_icons[i] == 1) {
				if (icons_drawn == 0) {
					draw_sprite(which_icons[i], i, nx-20, ny);
					icons_drawn++;
				} else if (icons_drawn == 1) {
					draw_sprite(which_icons[i], i, nx+20, ny);
					break;
				}
			}
		}
	break;
			
	case 3:
		for (var i = 0; i < 6; i++) {
			if (draw_icons[i] == 1) {
				if (icons_drawn == 0) {
					draw_sprite(which_icons[i], i, nx, ny);
					icons_drawn++;
				} else if (icons_drawn == 1) {
					draw_sprite(which_icons[i], i, nx-40, ny);
					icons_drawn++;
				} else if (icons_drawn == 2) {
					draw_sprite(which_icons[i], i, nx+40, ny);
					break;
				}
			}
		}
	break;
			
	case 4:
		for (var i = 0; i < 6; i++) {
			if (draw_icons[i] == 1) {
				if (icons_drawn == 0) {
					draw_sprite(which_icons[i], i, nx-60, ny);
					icons_drawn++;
				} else if (icons_drawn == 1) {
					draw_sprite(which_icons[i], i, nx-20, ny);
					icons_drawn++;
				} else if (icons_drawn == 2) {
					draw_sprite(which_icons[i], i, nx+20, ny);
					icons_drawn++
				}  else if (icons_drawn == 3) {
					draw_sprite(which_icons[i], i, nx+60, ny);
					break;
				}
			}
		}			
	break;
			
	case 5:
		for (var i = 0; i < 6; i++) {
			if (draw_icons[i] == 1) {
				if (icons_drawn == 0) {
					draw_sprite(which_icons[i], i, nx, ny);
					icons_drawn++;
				} else if (icons_drawn == 1) {
					draw_sprite(which_icons[i], i, nx-40, ny);
					icons_drawn++;
				} else if (icons_drawn == 2) {
					draw_sprite(which_icons[i], i, nx+40, ny);
					icons_drawn++
				}  else if (icons_drawn == 3) {
					draw_sprite(which_icons[i], i, nx-80, ny);
					icons_drawn++
				}   else if (icons_drawn == 4) {
					draw_sprite(which_icons[i], i, nx+80, ny);
					break;
				}
			}
		}
	break;
			
	case 6:
		for (var i = 0; i < 6; i++) {
			if (draw_icons[i] == 1) {
				if (icons_drawn == 0) {
					draw_sprite(which_icons[i], i, nx-100, ny);
					icons_drawn++;
				} else if (icons_drawn == 1) {
					draw_sprite(which_icons[i], i, nx-60, ny);
					icons_drawn++;
				} else if (icons_drawn == 2) {
					draw_sprite(which_icons[i], i, nx-20, ny);
					icons_drawn++
				} else if (icons_drawn == 3) {
					draw_sprite(which_icons[i], i, nx+20, ny);
					icons_drawn++
				} else if (icons_drawn == 4) {
					draw_sprite(which_icons[i], i, nx+60, ny);
					icons_drawn++
				} else if (icons_drawn == 5) {
					draw_sprite(which_icons[i], i, nx+100, ny);
					break;
				}
			}
		}
	break;
			
	default:
	break;
}