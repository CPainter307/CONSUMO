
if (oPlayerInput.key_interact) {
	if (!instance_exists(reticle) && !instance_exists(bar)) {
		reticle = instance_create_layer(x, y - 25, "Cooking", oChoppingGameReticle);
		bar = instance_create_layer(x, y - 25, "Cooking", oChoppingGameBar);
		boundRight = reticle.x + 60;
		boundLeft = reticle.x - 60;
	}
	else {
		if (reticle.x <= bar.x + 12 && reticle.x >= bar.x - 13) {
			if (ingr1 != noone && !ingr1.prepared) {
				ingr1.chops = ingr1.chops + 15;
			}
			if (ingr2 != noone && !ingr2.prepared) {
				ingr2.chops = ingr2.chops + 15;
			}
			if (ingr3 != noone && !ingr3.prepared) {
				ingr3.chops = ingr3.chops + 15;
			}
		}
		if (reticle.x <= bar.x - 14 && reticle.x >= bar.x - 32) || (reticle.x >= bar.x + 13 && reticle.x <= bar.x + 31) {
			if (ingr1 != noone && !ingr1.prepared) {
				ingr1.chops = ingr1.chops + 5;
			}
			if (ingr2 != noone && !ingr2.prepared) {
				ingr2.chops = ingr2.chops + 5;
			}
			if (ingr3 != noone && !ingr3.prepared) {
				ingr3.chops = ingr3.chops + 5;
			}
		}
		if (reticle.x <= bar.x - 33 && reticle.x >= bar.x - 59) || (reticle.x >= bar.x + 34 && reticle.x <= bar.x + 60) {
			if (ingr1 != noone && !ingr1.prepared) {
				ingr1.chops = ingr1.chops + 3;
			}
			if (ingr2 != noone && !ingr2.prepared) {
				ingr2.chops = ingr2.chops + 3;
			}
			if (ingr3 != noone && !ingr3.prepared) {
				ingr3.chops = ingr3.chops + 3;
			}
		}
		
	}
	
}

if (instance_exists(reticle) && instance_exists(bar)) {
	if (reticle.movingRight) {
		reticle.x++;
	}

	if (reticle.x == boundRight) {
		reticle.movingRight = false;
	}

	if (!reticle.movingRight) {
		reticle.x--;
	}

	if (reticle.x == boundLeft) {
		reticle.movingRight = true;
	}
}

//deletes and creates new ingredient
if (ingr1 != noone && !ingr1.prepared && ingr1.chops >= 15) {
	var newIngr = instance_create_depth(x, y, ingr1.objDepth, ingr1.preppedVersion);
	newIngr.image_xscale = 0.5;
	newIngr.image_yscale = 0.5;
	var oldIngr = ingr1;
	instance_destroy(oldIngr);
	ingr1 = newIngr;
}
if (ingr2 != noone && ingr2.prepared && ingr2.chops >= 15) {
	var newIngr = instance_create_depth(x, y, ingr2.objDepth, ingr2.preppedVersion);
	newIngr.image_xscale = 0.5;
	newIngr.image_yscale = 0.5;
	var oldIngr = ingr2;
	instance_destroy(oldIngr);
	ingr2 = newIngr;
}
if (ingr3 != noone && !ingr3.prepared && ingr3.chops >= 15) {
	var newIngr = instance_create_depth(x, y, ingr3.objDepth, ingr3.preppedVersion);
	newIngr.image_xscale = 0.5;
	newIngr.image_yscale = 0.5;
	var oldIngr = ingr3;
	instance_destroy(oldIngr);
	ingr3 = newIngr;
}
