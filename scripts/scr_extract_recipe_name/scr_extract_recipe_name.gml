var recipeName = "";

//check for meat and vegetable
var meatAndVeggie = false;
var isMeat = false;
var isVeggie = false;

for (var i = 0; i < 3; i++) {
	if (ds_list_find_value(item_list, i).classification == "meat") {
		isMeat = true;
	}
	if (ds_list_find_value(item_list, i).classification == "vegetable") {
		isVeggie = true;
	}
}
if (isMeat && isVeggie) {
	meatAndVeggie = true;
}

//cooking with multiple ingredients//
var numOfNouns = 0;

//check seasonings
for (var i = 0; i < 3; i++) {
	if (ds_list_find_value(item_list, i).classification == "seasoning") {
		inst.name += "Seasoned ";
		break;
	}
}

//check spices
for (var i = 0; i < 3; i++) {
	if (ds_list_find_value(item_list, i).classification == "spice") {
		inst.name += "Spicy ";
		break;
	}
}

//check meats *INCOMPLETE*
var meatName = "";
for (var i = 0; i < 3; i++) {
	if (ds_list_find_value(item_list, i).classification == "meat") {
		meatName = ds_list_find_value(item_list, i).ingrName;
		if (numOfNouns != 0) {
			var str = string_copy(inst.name, string_length(inst.name) - string_length(meatName), string_length(inst.name));
			str = string_delete(str, string_length(str), 1)
			if (str != meatName) {
				inst.name = inst.name + "& " + meatName + " ";
			}
		}
		if (numOfNouns == 0) {
			inst.name = inst.name + meatName + " ";
			numOfNouns++;
		}
	}
}

//check vegetables
for (var i = 0; i < 3; i++) {
	if (ds_list_find_value(item_list, i).classification == "vegetable") {
		if (meatAndVeggie) {
			inst.name += "& Vegetable ";
			break;
		}
		if (!meatAndVeggie) {
			inst.name += "Vegetable ";		
			break;
		}
	}

}

//check cooking type
inst.name += mealType;


//for cooking single objects
for (var i = 0; i < 3; i++) {
	if (!ds_list_find_value(item_list, i).prepared) {
		inst.name = mealType2 + ds_list_find_value(item_list, i).ingrName;
		break;
	}
}
