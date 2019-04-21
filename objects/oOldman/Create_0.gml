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

myText1[0] = "Use " + moveString + " to move around and press " + jumpString + " to jump."

myText2[0] = "Use " + leftHandString + " to hold in your left hand and " + rightHandString + " to hold in your right."
myText2[1] = "Press again to throw. Hold " + lockString +" to aim with precision."

myText3[0] = "Throw the meat into the pot and it'll cook."
myText3[1] = "Take it too early and raw food will hurt your client. Too long it'll burn and lose potency. Wait till it's just right."

myText4[0] = "Throw those on the table then use " + chopString + " to chop them up. Then cook them into a dish!";

myText5[0] = "The client's waitin'! Get out of here!";