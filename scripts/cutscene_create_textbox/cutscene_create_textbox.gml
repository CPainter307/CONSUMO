///@description cutscene_create_textbox
///@arg text
///@arg name

var _text = argument0
var _name = argument1;

if (myTextbox == noone) {
	myTextbox = instance_create_layer(global.textboxPosX, global.textboxPosY, "Text", oTextbox)
	myTextbox.text = _text;
	myTextbox.creator = self;
	myTextbox.name = _name;
	myTextbox.alarm[0] = 10; // key press frame buffer
}