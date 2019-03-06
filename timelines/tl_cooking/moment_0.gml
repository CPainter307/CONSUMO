steam = instance_create_layer(x, y-25, "Cooking", oSteam);
steam.depth = layer_get_depth("Cooking")-1;
with (steam) sprite_index = sSteam1;