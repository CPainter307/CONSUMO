//stall hunger timer
if (!stallHunger and hunger >= 0) {
	hunger -= 0.1	
} else if (stallHungerTimer >= 60) {
	stallHunger = false;
	stallHungerTimer = 0;
	hunger = 100;
} else if (stallHunger) {
	stallHungerTimer++;	
}

/*
//delete buff/debuff icon timer
if (!stallHunger and hunger >= 0) {
	hunger -= 0.1	
} else if (stallHungerTimer >= 60) {
	stallHunger = false;
	stallHungerTimer = 0;
	hunger = 100;
} else if (stallHunger) {
	stallHungerTimer++;	
}