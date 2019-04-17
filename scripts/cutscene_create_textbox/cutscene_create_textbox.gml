///@description cutscene_create_textbox
///@arg text
///@arg name
///@arg voice

var _text = argument0
var _name = argument1;
var _voice = argument2;

if (myTextbox == noone) {
	myTextbox = instance_create_layer(textboxPosX, textboxPosY, "Text", oTextbox)
	myTextbox.text = _text;
	myTextbox.creator = self;
	myTextbox.name = _name;
	myTextbox.voice = _voice;
	myTextbox.portrait = sLizardPortrait;
	myTextbox.alarm[0] = 10; // key press frame buffer
}