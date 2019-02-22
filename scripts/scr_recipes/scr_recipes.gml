/**************************************
HOW TO CREATE A NEW RECIPE

USE SYNTAX BELOW

recipe_attributes[0] = "Recipe Name";
recipe_attributes[1] = sprite_name;
ds_3d_set(ingredients, oIngredient1.ing_id, oIngredient2.ing_id, oIngredient3.ing_id, recipe_attributes);
            
**************************************/
recipe_amount = 3;
var recipe_attributes = array_create(2);

ingredients = array_create(recipe_amount*3, noone);
ds_3d_create(ingredients, recipe_amount*3, recipe_amount*3, recipe_amount*3);

//**********************************************************************************
// RECIPES
//**********************************************************************************

// Meat 'n Fish
recipe_attributes[0] = "Meat 'n Fish";
recipe_attributes[1] = spr_placeholder_recipe;
ds_3d_set(ingredients, oMeat.ing_id, oMeat.ing_id, oFish.ing_id, recipe_attributes);

// 3 Meat Treat
recipe_attributes[0] = "3 Meat Treat";
recipe_attributes[1] = spr_placeholder_recipe2;
ds_3d_set(ingredients, oMeat.ing_id, oMeat.ing_id, oMeat.ing_id, recipe_attributes);



//**********************************************************************************
scr_normalize_recipes();