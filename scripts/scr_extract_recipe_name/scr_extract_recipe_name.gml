//if all three inst.ingredients are the same usinst.ing variables:
//	all_different
//	two_same01
//	two_same02
//	two_same12
//	all_same

// helpful notes
//
//	the value stored in ing[] is the ingredient's name
//	the value stored in ds_grid_get(item_grid, 6, i) is the ingredient's adjective
//	the value stored in ds_grid_get(item_grid, 7, i) is the ingredient's half_name

//assume all three are different
all_different = true

//determine flags (probably not the prettiest way to do this, sorry)
if (inst.ing[0] == inst.ing[1]) {
	all_different = false
	two_same01 = true
	
	if (inst.ing[0] == inst.ing[2]) {
		two_same01 = false
		all_same = true
	}
}

if (inst.ing[0] == inst.ing[2]) {
	all_different = false
	two_same02 = true
	
	if (inst.ing[1] == inst.ing[2]) {
		two_same02 = false
		all_same = true
	}
}

if (inst.ing[1] == inst.ing[2]) {
	all_different = false
	two_same12 = true
	
	if (inst.ing[0] == inst.ing[2]) {
		two_same12= false
		all_same = true
	}
}

//apply names to oRecipe
if (all_different) {
	inst.name = ds_grid_get(item_grid, 6, 0) + " " + inst.ing[1] + " " + ds_grid_get(item_grid, 7, 2)
}

if (two_same01) {
	inst.name = ds_grid_get(item_grid, 6, 2) + " " + inst.ing[0]
}

if (two_same02) {
	inst.name = ds_grid_get(item_grid, 6, 1) + " " + inst.ing[0]
}

if (two_same12) {
	inst.name = ds_grid_get(item_grid, 6, 0) + " " + inst.ing[1]	
}

if (all_same) {
	inst.name = inst.ing[0]
}

//last step - add "Soup" to the end and clear flags
inst.name = inst.name + " Soup"

all_different = false
two_same01 = false
two_same02 = false
two_same12 = false
all_same = false