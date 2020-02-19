
currentHealth = min(other.hp+currentHealth, maxHealth)
if other.hp > 0 {
	//creates a buff icon in the world next to the adventurer
	var _h = instance_create_layer(x+50, y, "game", oBuffIcon)
	_h.icon = sHeartIconOutlined
	_h.buff_amount = string(other.hp)
	//creates a buff icon display on the gui, repeated below
	var _hg = instance_create_layer(battleWindow.x-20, (battleWindow.y+(300/battleWindow.scale_down)), "game", oBuffIcon)
	_hg.move_icon = false
	_hg.draw_gui = true
	_hg.icon = sHeartIconOutlined
	_hg.buff_amount = string(other.hp)
}

//set timers
attackTimer = (attackTimer/60) + other.attack;
defenseTimer = (defenseTimer/60) + other.defense;
speedTimer = (speedTimer/60) + other.spd;

if attackTimer > 0 {
	var inst = instance_create_layer(x+50, y, "game", oBuffIcon)
	inst.icon = sSwordIconOutlined
	inst.buff_amount = string(attackTimer) + "s"
	var _hg = instance_create_layer((battleWindow.x+(battleWindow.stat_1_x/battleWindow.scale_down)), (battleWindow.y+(battleWindow.stat_1_y/battleWindow.scale_down)), "game", oBuffIcon)
	_hg.move_icon = false
	_hg.draw_gui = true
	_hg.icon = sSwordIconOutlined
	_hg.buff_amount = string(attackTimer) + "s"
	attackMultiplier*=2
	attackTimer*=60
} else {
	attackMultiplier=1	
}

if defenseTimer > 0 {
	var inst = instance_create_layer(x+50, y, "game", oBuffIcon)
	inst.icon = sShieldIconOutlined
	inst.buff_amount = string(defenseTimer) + "s"
	var _hg = instance_create_layer((battleWindow.x+(battleWindow.stat_2_x/battleWindow.scale_down)), (battleWindow.y+(battleWindow.stat_2_y/battleWindow.scale_down)), "game", oBuffIcon)
	_hg.move_icon = false
	_hg.draw_gui = true
	_hg.icon = sShieldIconOutlined
	_hg.buff_amount = string(defenseTimer) + "s"
	defenseMultiplier=2
	defenseTimer*=60
} else {
	defenseMultiplier=1	
}

if speedTimer > 0 {
	var inst = instance_create_layer(x+50, y, "game", oBuffIcon)
	inst.icon = sShoeIconOutlined
	inst.buff_amount = string(speedTimer) + "s"
	var _hg = instance_create_layer((battleWindow.x+(battleWindow.stat_3_x/battleWindow.scale_down)), (battleWindow.y+(battleWindow.stat_3_y/battleWindow.scale_down)), "game", oBuffIcon)
	_hg.move_icon = false
	_hg.draw_gui = true
	_hg.icon = sShoeIconOutlined
	_hg.buff_amount = string(speedTimer) + "s"
	speedMultiplier*=2
	speedTimer*=60
} else {
	speedMultiplier=1	
}

battleWindow.cur_atk = attackTimer
battleWindow.max_atk = attackTimer

battleWindow.cur_def = defenseTimer
battleWindow.max_def = defenseTimer

battleWindow.cur_spd = speedTimer
battleWindow.max_spd = speedTimer

hunger += 50;
if (hunger >= maxhunger) {
	hunger = 100;
	stallHunger = true;
}

if (other.hp < 0 || other.attack < 0 || other.defense < 0 || other.spd < 0) {
	flash = 3;	
} else {
	shaderBuff = 1;	
}

// destroy recipe
with (other) instance_destroy();	