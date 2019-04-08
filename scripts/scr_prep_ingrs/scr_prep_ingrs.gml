
if (oPlayerInput.key_interact && !empty) {
	if (!instance_exists(reticle) && !instance_exists(bar)) {
		bar = instance_create_layer(x, y - 25, "Cooking", oChoppingGameBar);
		reticle = instance_create_layer(bar.x - 59, y - 25, "Cooking", oChoppingGameReticle);
		reticle.depth--;
		boundRight = bar.x + 60;
		boundLeft = bar.x - 62;
	}
	else {
		if (reticle.x > boundLeft && reticle.x <= boundLeft + 61) {
			if (ingr1 != noone && !ingr1.prepared) {
				ingr1.chops = ingr1.chops + 1;
			}
			if (ingr2 != noone && !ingr2.prepared) {
				ingr2.chops = ingr2.chops + 1;
			}
			if (ingr3 != noone && !ingr3.prepared) {
				ingr3.chops = ingr3.chops + 1;
			}
			//play poor chop sound
		}
		if (reticle.x > boundLeft + 61 && reticle.x <= boundLeft + 94) {
			if (ingr1 != noone && !ingr1.prepared) {
				ingr1.chops = ingr1.chops + 3;
			}
			if (ingr2 != noone && !ingr2.prepared) {
				ingr2.chops = ingr2.chops + 3;
			}
			if (ingr3 != noone && !ingr3.prepared) {
				ingr3.chops = ingr3.chops + 3;
			}
			//play okay chop sound
		}
		if (reticle.x > boundLeft + 94 && reticle.x <= boundLeft + 114) {
			if (ingr1 != noone && !ingr1.prepared) {
				ingr1.chops = ingr1.chops + 5;
			}
			if (ingr2 != noone && !ingr2.prepared) {
				ingr2.chops = ingr2.chops + 5;
			}
			if (ingr3 != noone && !ingr3.prepared) {
				ingr3.chops = ingr3.chops + 5;
			}
			//play good chop sound
		}
		if (reticle.x > boundLeft + 114 && reticle.x <= boundRight) {
			if (ingr1 != noone && !ingr1.prepared) {
				ingr1.chops = ingr1.chops + 15;
			}
			if (ingr2 != noone && !ingr2.prepared) {
				ingr2.chops = ingr2.chops + 15;
			}
			if (ingr3 != noone && !ingr3.prepared) {
				ingr3.chops = ingr3.chops + 15;
			}
			//play superb *licks lips* chop sound
		}
		
	}
	
}

//calculate how many chops and reset reticle
if (instance_exists(reticle) && instance_exists(bar)) {
	//reticle.x++;
	reticle.x = reticle.x + 5;
	if (reticle.x >= boundRight) {
		reticle.x = boundLeft;
	}
	if (oPlayerInput.key_interact) {
		reticle.x = boundLeft;
	}
}

//deletes and creates new ingredient
if (ingr1 != noone && !ingr1.prepared && ingr1.chops >= 15) {
	var newIngr = instance_create_depth(oIngredientHolder.x, oIngredientHolder.y, ingr1.objDepth, ingr1.preppedVersion);
	newIngr.image_xscale = 0.5;
	newIngr.image_yscale = 0.5;
	var oldIngr = ingr1;
	instance_destroy(oldIngr);
	ingr1 = newIngr;
}
if (ingr2 != noone && !ingr2.prepared && ingr2.chops >= 15) {
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
