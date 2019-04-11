//create list of all adventueres

allAdventurers = ds_list_create();
for (var i = 0; i < instance_number(oAdventurer); i++)
{
	ds_list_add(allAdventurers, instance_find(oAdventurer, i));
}