movePower = argument0;
Attack = argument1;
Defense = argument2;
attackMultiplier = argument3;
defenseMultiplier = argument4;

damage = floor((((((((2 * 50)/5) + 2) * movePower * (Attack/Defense))/50) + 2) * (attackMultiplier/defenseMultiplier)) * (random_range(85, 115)/100));

return(damage);