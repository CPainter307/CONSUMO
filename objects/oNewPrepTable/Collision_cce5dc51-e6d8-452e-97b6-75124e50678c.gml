if (!empty) {
	instance_create_layer(x,y-100,"game",oButton)
	//knife sprite
	if (!knifeCreated) {
		instance_create_layer(x+20, y-170, "Objects", oKnifeIcon)
		knifeCreated = true;
	}
	oButton.y = oButton.ystart + sin(get_timer()/100000);
	
	if(global.input_type == inputs.keyboard)
	{
		oButton.sprite_index = sButtonE;	
	}
	else
	{
		oButton.sprite_index = sButtonX;	
	}

}

scr_prep_ingrs();


