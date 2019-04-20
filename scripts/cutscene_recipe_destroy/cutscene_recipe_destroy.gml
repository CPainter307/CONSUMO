///@description cutscene_recipe_destroy

if (instance_exists(oRecipe)) {
	instance_destroy(oRecipe);
}

cutscene_end_action();