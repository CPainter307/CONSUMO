show_inventory = false
inv_slots = 12
inv_slot_width = 3
inv_slot_height = 4

global.inventory = ds_grid_create(2, 12)
//var _item = [fish.object_index, fish.sprite_index, fish.name]

inventory_x = 0
inventory_y = 0

scale = 2

cell_size = 32*scale
buffer = 4

m_slotx = 0
m_sloty = 0

pickup_slot = -1
selected_slot = -1

item_scale = .5

