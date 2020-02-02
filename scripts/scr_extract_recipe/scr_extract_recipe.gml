/// scr_extract_recipe(quality)

timeline_index = 540;
timeline_running = false;
with(steam) {
	steam = noone
	instance_destroy();	
}
	
//add booster values to oRecipe
var total_hp = ds_grid_get_sum(item_grid, 1, 0, 1, 2);
var total_attack = ds_grid_get_sum(item_grid, 2, 0, 2, 2);
var total_defense = ds_grid_get_sum(item_grid, 3, 0, 3, 2);
var total_spd = ds_grid_get_sum(item_grid, 4, 0, 4, 2);
currentlyCooking = false;
//create oRecipe

inst = instance_create_layer(x, y, "Objects", oRecipe); //creates oRecipe based on second item because it'll always be a full ingredientdd
	
	
// add vessel name
inst.mealName = mealType;

//name recipe
//scr_extract_recipe_name(); (teehee - come back to this Charles)
	
//add quality bonus
switch (argument0) {
	case 0: // JUST RIGHT
		inst.quality = 0;
		break;
	case 1: // burnt
		total_hp *= 0;
		total_attack *= 0;
		total_defense *= 0;
		total_spd *= 0;
		inst.name = "Burnt " + inst.name;
		inst.quality = 1;
		break;
		
}
	
//assign to recipe
inst.hp = total_hp;
inst.attack = total_attack;
inst.defense = total_defense;
inst.spd = total_spd;
	
//show recipe quality
textDisappearTimer = 0;
drawText = true;
	
show_debug_message("hp: " + string(inst.hp) + " atk: " + string(inst.attack) + " def: " + string(inst.defense) + " spd: " + string(inst.spd))
ds_grid_clear(item_grid, noone);
if !is_holding_items() and !oPot.held {
	oPlayer.holding_big_item = true
	add_to_inventory(inst);
}