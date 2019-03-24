/// @description Insert description here
// You can write your code in this editor

if((leftIngr != noone && !leftIngr.prepared) || (rightIngr != noone && !rightIngr.prepared)) {	
	instance_create_layer(x,y-50,"game",oButton)
	oButton.y = oButton.ystart + sin(get_timer()/100000);
	
	if(gamepad_is_connected(0))
	{
		oButton.sprite_index = sButtonX;	
	}
	else
	{
		oButton.sprite_index = sButtonE;	
	}
}

scr_prep_ingr();