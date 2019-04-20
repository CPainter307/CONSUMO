if (instance_exists(oRecipe)) {
	var inst = instance_nearest(x, y, oRecipe);
	if(inst.quality == 0) {
		raw = true;	
	}
	if(inst.quality == 1) {
		undercooked = true;	
	}
	if(inst.quality == 2) {
		perfect = true;	
	}
	if(inst.quality == 3) {
		burnt = true;	
	}
}