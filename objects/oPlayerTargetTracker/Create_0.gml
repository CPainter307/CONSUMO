//create list of all targets
allPlayerTargets = ds_list_create();
for (var i = 0; i < instance_number(oPlayerTarget); i++)
{
	ds_list_add(allPlayerTargets, instance_find(oPlayerTarget, i));
}

//track three targets
tar1 = ds_list_find_value(allPlayerTargets, 0);
tar2 = ds_list_find_value(allPlayerTargets, 1);
tar3 = ds_list_find_value(allPlayerTargets, 2);

//at the start, this is false
allHit = false;