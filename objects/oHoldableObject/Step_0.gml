/// @description Here's what your average pickupabble item will do every frame.

//removes highlight if no longer in range of player 
if oPlayer.pickupRadius <= 0 { 
	highlighted = false	 
} 

//play sound
scr_play_pickup_sound(pickUpSound);


