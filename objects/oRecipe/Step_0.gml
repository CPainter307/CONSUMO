/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//if (ing[0] != noone && bowl_sprite == sBowl) {

	//sets 3 sprites based on ingredients used
	for (var i = 0; i < 3; i++) {
		switch (string(ing[i])) {
			case "Bosco Berry":
				switch (i) {
					case 0:
						bowl_sprite = sBowlBosco;
						break;
					case 1:
						broth_sprite = sBrothBosco;
						break;
					case 2:
						topping_sprite = sToppingBosco;
						break;
					default:
						//do nothing
				}
				break;
			case "Spider Squirrel Leg":
				switch(i) {
					case 0:
						bowl_sprite = sBowlSpider;
						break;
					case 1:
						broth_sprite = sBrothSpider;
						break;
					case 2:
						topping_sprite = sToppingSpider;
						break;
					default:
						//do nothing
				}
				break;
			case "Fugi Nut":
				switch(i) {
					case 0:
						bowl_sprite = sBowlFugi;
						break;
					case 1:
						broth_sprite = sBrothFugi;
						break;
					case 2:
						topping_sprite = sToppingFugi;
						break;
					default:
						//do nothing
				}
				break;
			case "Goldenshroom":
				switch(i) {
					case 0:
						bowl_sprite = sBowlGolden;
						break;
					case 1:
						broth_sprite = sBrothGolden;
						break;
					case 2:
						topping_sprite = sToppingGolden;
						break;
					default:
						//do nothing
				}
				break;
			default:
				//do nothing
		}
	}

//}