globalvar showInv;
showInv = false;
globalvar maxItems;
maxItems = 6;

for (var i = 0; i < maxItems; i++) {
	global.inventory[i] = noone;
	//button[i] = instance_create_depth(0, 0, -y, oInvButton);
	//button[i].slot = i;
}

globalvar mouseItem;
mouseItem = noone;
instance_create_depth(0, 0, -y, oInvMouseItem);

slotSelected = array_create(maxItems, false);

slotX = array_create(maxItems, -1);
slotY = array_create(maxItems, -1);

slotX[0] = 324;  slotY[0] = 77;
slotX[1] = 570; slotY[1] = 224;
slotX[2] = 570; slotY[2] = 501;
slotX[3] = 324;  slotY[3] = 639;
slotX[4] = 77;  slotY[4] = 501;
slotX[5] = 77;  slotY[5] = 224;

//scr_inv_add(oFish);
//scr_inv_add(oFish);

//slotValue[] = 

/*
itemsInInventory[0] = noone;
itemsInInventory[1] = noone;
itemsInInventory[2] = noone;
itemsInInventory[3] = noone;
itemsInInventory[4] = noone;
itemsInInventory[5] = noone;
itemsInInventory[6] = noone;

anim = 0;
anim_n = 0;