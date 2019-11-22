//NEW TUTORIAL CUTSCENE
//Written by Charles Painter (oh boy - can't wait to see what problems this causes)
//WIP
//List of known bugs:
//// - In every cutscene, global.canMove is turned off. However, if the player has momentum before
////   the cutscene begins, they will continue to move while it executes. I'm trying to find a way to
////   fix this.
//// - Currently the camera does not focus on the old man when he's talking. That's because our camera
////   doesn't work in rTutorial for some reason. Researching that too.
//// - When the old man asks the player to open their inventory there's nothing to stop them from selecitng
////   an item. This is a problem, because the next dialog chunk requires that the player takes that item out.
////   Maybe it won't be an issue and things will proceed smoothly. I can't test that right now because of a
////   weird inventory error. 
////
////   updated 11/19/2019 @ 1:00 AM

//these variables correspond to the various dialog chunks
text1 = true;
text2 = false;
text3 = false;
text4 = false;
text5 = false;
text6 = false;

//these variables determine what the old man says when you talk to him
oldManText1 = false;
oldManText2 = false;
oldManText3 = false;
oldManText4 = false;
oldManText5 = false;
oldManText6 = false;

//these variables track various things the cutscene needs to know
pebbles_exist = false;