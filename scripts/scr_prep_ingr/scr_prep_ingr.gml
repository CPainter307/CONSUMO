//case 1
if (leftIngr != noone && !leftIngr.prepared && rightIngr == noone) {
	if (oPlayerInput.key_interact) {
		leftIngr.chops++;
	}
}

//case2
if (leftIngr != noone && rightIngr != noone && !leftIngr.prepared && !rightIngr.prepared) {
	if (oPlayerInput.key_interact) {
		leftIngr.chops++;
	}
}

//case3
if (leftIngr != noone && rightIngr != noone && !leftIngr.prepared && rightIngr.prepared) {
	if (oPlayerInput.key_interact) {
		leftIngr.chops++;
	}
}

//case4
if (leftIngr != noone && rightIngr != noone && leftIngr.prepared && !rightIngr.prepared) {
	if (oPlayerInput.key_interact) {
		rightIngr.chops++;
	}
}

//deletes and creates new ingredient
if (leftIngr != noone && !leftIngr.prepared && leftIngr.chops >= 10) {
	var newIngr = instance_create_depth(x, y, leftIngr.objDepth, leftIngr.preppedVersion);
	newIngr.image_xscale = 0.5;
	newIngr.image_yscale = 0.5;
	var oldIngr = leftIngr;
	instance_destroy(oldIngr);
	leftIngr = newIngr;
}
if (rightIngr != noone && !rightIngr.prepared && rightIngr.chops >= 10) {
	var newIngr = instance_create_depth(x, y, rightIngr.objDepth, rightIngr.preppedVersion);
	newIngr.image_xscale = 0.5;
	newIngr.image_yscale = 0.5;
	var oldIngr = rightIngr;
	instance_destroy(oldIngr);
	rightIngr = newIngr;
}