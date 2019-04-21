
jumpString = "";
moveString = "";

leftHandString = "";
rightHandString = "";
lockString = "";

//used to keep track of where we are in tutorial cutscene
text1 = true;
text2 = false;
text3 = false;
text4 = false;
text5 = false;
text6 = false;

//placeholders for objects?
pTarget1 = noone;

tar1 = noone;
tar2 = noone;


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

oldManText1 = true;
oldManText2 = false;
oldManText3 = false;
oldManText4 = false;
oldManText5 = false;
oldManText6 = false;