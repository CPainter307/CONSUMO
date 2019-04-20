steam = instance_create_layer(x, y-25, "Objects", oSteam);
steam.depth = layer_get_depth("Objects")-1;
with (steam) sprite_index = sSteam1;