var attackOn = argument0; //boolean if attackTimer > 0
var defenseOn = argument1; //boolean if defenseTimer > 0
var speedOn = argument2; //boolean if speedTimer > 0

// keeps track of what situation we have 
var onlyOne = false
var attackAndDefense = false
var attackAndSpeed = false
var defenseAndSpeed = false
var allThree = false


//this is cursed, but let's check those flags
if (attackOn and !defenseOn and !speedOn) onlyOne = true
if (!attackOn and defenseOn and !speedOn) onlyOne = true
if (!attackOn and !defenseOn and speedOn) onlyOne = true
if (attackOn and defenseOn and !speedOn) attackAndDefense = true
if (attackOn and !defenseOn and speedOn) attackAndSpeed = true
if (!attackOn and defenseOn and speedOn) defenseAndSpeed = true
if (attackOn and defenseOn and speedOn) allThree = true

if (onlyOne) {
	if (attackOn) {
		part_emitter_burst(global.ps, global.pe_AttackBuff, global.pt_AttackBuff, 1)
		part_emitter_region(global.ps, global.pe_AttackBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);
	}

	if (defenseOn) {
		part_emitter_burst(global.ps, global.pe_DefenseBuff, global.pt_DefenseBuff, 1)
		part_emitter_region(global.ps, global.pe_DefenseBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);
	}

	if (speedOn) {
		part_emitter_burst(global.ps, global.pe_SpeedBuff, global.pt_SpeedBuff, 1)
		part_emitter_region(global.ps, global.pe_SpeedBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);
	}
}

if (attackAndDefense) { //alternate between red and blue particles
	if (alternate) { //red
		part_emitter_burst(global.ps, global.pe_AttackBuff, global.pt_AttackBuff, 1)
		part_emitter_region(global.ps, global.pe_AttackBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);		
	}
	if (!alternate) { //blue
		part_emitter_burst(global.ps, global.pe_DefenseBuff, global.pt_DefenseBuff, 1)
		part_emitter_region(global.ps, global.pe_DefenseBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);		
	}
}

if (attackAndSpeed) {
	if (alternate) { //red
		part_emitter_burst(global.ps, global.pe_AttackBuff, global.pt_AttackBuff, 1)
		part_emitter_region(global.ps, global.pe_AttackBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);		
	}
	if (!alternate) { //yellow
		part_emitter_burst(global.ps, global.pe_SpeedBuff, global.pt_SpeedBuff, 1)
		part_emitter_region(global.ps, global.pe_SpeedBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);		
	}
}

if (defenseAndSpeed) {
	if (alternate) { //blue
		part_emitter_burst(global.ps, global.pe_DefenseBuff, global.pt_DefenseBuff, 1)
		part_emitter_region(global.ps, global.pe_DefenseBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);		
	}
	if (!alternate) { //yellow
		part_emitter_burst(global.ps, global.pe_SpeedBuff, global.pt_SpeedBuff, 1)
		part_emitter_region(global.ps, global.pe_SpeedBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);		
	}
}

if (allThree) {
	if (partNum == 0) { //red
		part_emitter_burst(global.ps, global.pe_AttackBuff, global.pt_AttackBuff, 1)
		part_emitter_region(global.ps, global.pe_AttackBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);		
	}
	if (partNum == 1) { //blue
		part_emitter_burst(global.ps, global.pe_DefenseBuff, global.pt_DefenseBuff, 1)
		part_emitter_region(global.ps, global.pe_DefenseBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);		
	}
	if (partNum == 2) { //yellow
		part_emitter_burst(global.ps, global.pe_SpeedBuff, global.pt_SpeedBuff, 1)
		part_emitter_region(global.ps, global.pe_SpeedBuff, x-19, x+19, y+9, y+9, ps_shape_rectangle, ps_distr_gaussian);		
	}
}

//make flags work
if (alternate = false) {
	alternate = true;
} else {
	alternate = false;
}

partNum++
if (partNum >=3) {
	partNum = 0;
}