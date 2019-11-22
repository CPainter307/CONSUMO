var recipeName = "";
var containsGrain = false;

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

//check spices
for (var i = 0; i < 3; i++) {
	if (ds_list_find_value(item_list, i).classification == "fruit") {
		inst.name += "Tropical ";
		break;
	}
}

//check meats *INCOMPLETE*
var meatName = "";
for (var i = 0; i < 3; i++) {
	if (ds_list_find_value(item_list, i).classification == "meat") {
		meatName = ds_list_find_value(item_list, i).name;
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

//check for grain type
for (var i = 0; i < 3; i++) {
	if (ds_list_find_value(item_list, i).classification == "grain") {
		containsGrain = true;
	
	}
}

//add meal name
if (containsGrain) {
	inst.name += mealType3;
}
else {
	//add cooking type
	inst.name += mealType;
}


if string_pos("Vegetable", inst.name) != 0 || string_pos("Seasoned", inst.name) != 0
{
	inst.sprite_index = sWhiteSoup; //This line sets our newly cooked meal to be white soup
}
if string_pos("Fish", inst.name) != 0
{
	inst.sprite_index = sGreenSoup;	
}
if string_pos("Meat", inst.name) != 0
{
	inst.sprite_index = sBrownSoup;	
}
if string_pos("Stew", inst.name) != 0
{
	inst.sprite_index = sOrangeSoup;
}

//for cooking single objects
for (var i = 0; i < 3; i++) {
	if (!ds_list_find_value(item_list, i).prepared) {
		inst.name = mealType2 + ds_list_find_value(item_list, i).name;
		break;
	}
}
