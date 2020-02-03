/// scr_extract_recipe(quality)

timeline_index = 540;
timeline_running = false;

steam.image_alpha = 0;
	
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
	//stats
	inst.hp = total_hp;
	inst.attack = total_attack;
	inst.defense = total_defense;
	inst.spd = total_spd;
	//ingredient names
	inst.ing[0] = ds_grid_get(item_grid, 0, 0);
	inst.ing[1] = ds_grid_get(item_grid, 0, 1);
	inst.ing[2] = ds_grid_get(item_grid, 0, 2);
	for (var i = 0; i < 3; i++) {
		switch (string(inst.ing[i])) {
			case "Bosco Berry":
				switch (i) {
					case 0:
						inst.bowl_sprite = sBowlBosco;
						break;
					case 1:
						inst.broth_sprite = sBrothBosco;
						break;
					case 2:
						inst.topping_sprite = sToppingBosco;
						break;
					default:
						//do nothing
				}
				break;
			case "Spider Squirrel Leg":
				switch(i) {
					case 0:
						inst.bowl_sprite = sBowlSpider;
						break;
					case 1:
						inst.broth_sprite = sBrothSpider;
						break;
					case 2:
						inst.topping_sprite = sToppingSpider;
						break;
					default:
						//do nothing
				}
				break;
			case "Fugi Nut":
				switch(i) {
					case 0:
						inst.bowl_sprite = sBowlFugi;
						break;
					case 1:
						inst.broth_sprite = sBrothFugi;
						break; 
					case 2:
						inst.topping_sprite = sToppingFugi;
						break;
					default:
						//do nothing
				}
				break;
			case "Goldenshroom":
				switch(i) {
					case 0:
						inst.bowl_sprite = sBowlGolden;
						break;
					case 1:
						inst.broth_sprite = sBrothGolden;
						break;
					case 2:
						inst.topping_sprite = sToppingGolden;
						break;
					default:
						//do nothing
				}
				break;
			default:
				//do nothing
		}
	}

	
//show recipe quality
textDisappearTimer = 0;
drawText = true;
	
show_message("hp: " + string(inst.hp) + " atk: " + string(inst.attack) + " def: " + string(inst.defense) + " spd: " + string(inst.spd))

//clear grid
ds_grid_clear(item_grid, noone);

//holding_big_item
if !is_holding_items() and !oPot.held {
	oPlayer.holding_big_item = true
	add_to_inventory(inst);
}