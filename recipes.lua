-- Recipes

minetest.register_craft({
	output = "barchairs:barchairs_round_padded",
	recipe = {
              {"","wool:white",""},
              {"","default:wood",""},
              {"default:stick","","default:stick"},
	},
})

minetest.register_craft({
	output = "barchairs:barchairs_plain",
	recipe = {
              {"","default:wood",""},
              {"default:stick","","default:stick"},
              {"default:stick","default:stick","default:stick"},
	},
})


-- Fuel-Recipes
 
minetest.register_craft({
	type = "fuel",
	recipe = "barchairs:barchairs_round_padded",
	burntime = 18,
})

minetest.register_craft({
	type = "fuel",
	recipe = "barchairs:barchairs_plain",
	burntime = 15,
})
