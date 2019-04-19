//create list of all targets
allThrowTargets = ds_list_create();
for (var i = 0; i < instance_number(oThrowTarget); i++)
{
	ds_list_add(allThrowTargets, instance_find(oThrowTarget, i));
}

//track three targets
tar1 = ds_list_find_value(allThrowTargets, 0);
tar2 = ds_list_find_value(allThrowTargets, 1);
tar3 = ds_list_find_value(allThrowTargets, 2);

//at the start, this is false
allHit = false;