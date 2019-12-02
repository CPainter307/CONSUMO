steam = instance_create_layer(x, y-oPot.sprite_height, "Objects", oSteam);
steam.depth = layer_get_depth("Objects")-1;
with (steam) {
	sprite_index = sSteam1
}
