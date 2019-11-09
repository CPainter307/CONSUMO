var _list = ds_list_create();
//if wanting to specify which targets a hitbox can hit
// make all a list?
var _num = instance_place_list(x, y, oLifeform, _list, false);
if _num > 0
{
    for (var i = 0; i < _num; i++)
    {
		if !_list[| i].is_vulnerable {
			break	
		}
		damageToTake = 0;
		
		if(targetClass == _list[| i].Class)
		{
			damageToTake += CalcDamageOutput(movePower, attack, _list[| i].baseDefense, attackMultiplier, _list[| i].defenseMultiplier);	
		}
		
		if(damageToTake != 0)
		{
			var d = instance_create_depth(_list[| i].x + random_range(_list[| i].sprite_width/-2.5, _list[| i].sprite_width/2.5), _list[| i].y +  random_range(_list[| i].sprite_height/-3, _list[| i].sprite_height/3), -1, DamageText);
			d.TD = damageToTake;
			_list[| i].currentHealth -= damageToTake;
		}
    }			
}
	
ds_list_destroy(_list);
//instance_destroy();

