steam = instance_create_layer(x, y-25, "decorLayer", oSteam);
steam.depth = layer_get_depth("decorLayer")-1;
with (steam) sprite_index = sSteam1;