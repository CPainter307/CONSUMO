/// scr_create_recipe(name, sprite, quality)
var inst = instance_create_depth(x, y, -y, oRecipe);
inst.name = argument0;
inst.sprite_index = argument1;
inst.quality = argument2;