var recipeName = "";
var hasMeat = false;
var hasVeg = false;
var hasFish = false;
var hasFruit = false;

for (var i = 0; i < 3; i++) {
	if (ds_list_find_value(item_list, i).classification == "meat") {
		hasMeat = true;
	}
	if (ds_list_find_value(item_list, i).classification == "fish") {
		hasFish = true;
	}
	if (ds_list_find_value(item_list, i).classification == "vegetable") {
		hasVeg = true;
	}
	if (ds_list_find_value(item_list, i).classification == "fruit") {
		hasFruit = true;
	}
}



