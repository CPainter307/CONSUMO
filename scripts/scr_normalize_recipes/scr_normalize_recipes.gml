for (var i = 0; i < recipe_amount; i++) {
	for (var j = 0; j < recipe_amount; j++) {
		for (var k = 0; k < recipe_amount; k++) {
			var first_rec = ds_3d_get(ingredients, i, j, k);
			if (first_rec != 0) {
				ds_3d_set(ingredients, i, k, j, first_rec);
				ds_3d_set(ingredients, j, i, k, first_rec);
				ds_3d_set(ingredients, j, k, i, first_rec);
				ds_3d_set(ingredients, k, i, j, first_rec);
				ds_3d_set(ingredients, k, j, i, first_rec);
			}
		}
	}
}