event_inherited();

myName = "Old Man";
myVoice = voice.oldman
myPortrait = sOldmanPortrait

if (gamepad_is_connected(0)) {
	jumpString = "the A button";
	moveString = "the left stick";
	leftHandString = "the left bumper";
	rightHandString = "the right bumper";
	lockString = "the right trigger";
	chopString = "the X button";
}
else {
	jumpString = "the space bar";
	moveString = "WASD";
	leftHandString = "left click";
	rightHandString = "right click";
	lockString = "shift";
	chopString = "E";
}

myText1[0] = "I've put some targets in this room. All you have to do is touch them."
myText1[1] = "#0Use #3WASD#0 to #3move#0, #3SPACE#0 to #3jump#0, and #3SHIFT#0 to #3sprint#0."
myText1[2] = "#0You #4demi#0 can also use #3RIGHT CLICK#0 to perform a #3dash#0 to increase your distance."

myText2[0] = "#0Press #3E#0 to #3pick up#0 these pebbles."

myText3[0] = "#0You've got those #2pebbles#0 stored in your #3pouch#0 I see."
myText3[1] = "#0Why not press #3Q#0 to #3open it up#0?"

myText4[0] = "#0Use #3LEFT CLICK#0 to hold those #2pebbles#0 in your throwing hand!"

myText5[0] = "#0While you're #3holding#0 an #2item#0 you can press #3LEFT CLICK#0 to #3throw#0 it in the direction of your #3mouse#0.";
myText5[1] = "Try giving these targets a hit, boy! Show me what you're made of!";

myText6[0] = "#0This is placeholder text! #4Charles#0 needs to get his act together!";