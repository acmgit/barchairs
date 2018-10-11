local modpath = minetest.get_modpath(minetest.get_current_modname())

local cbox = {
	type = "fixed",
	fixed = { -0.3125, -0.5, -0.3125, 0.3125, 0.5, 0.3125 },
}

local nbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, 0, 0.5 },
		{-0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
	}
}

minetest.register_node("barchairs:barchairs_round_padded", 
{
	description = "Round Barchair padded",
    drawtype = "mesh",
	mesh = "barchairs_barchair_round_padded.obj",
    --mesh = "barchairs_barchair_round_padded.3ds",
	tiles = {
		"default_wood",
		"wool_white.png"
	},
	inventory_image = "barchairs_barchair_round_padded_inv.png",
    parmtype = "light",
	paramtype2 = "colorwallmounted",
	palette = "unifieddyes_palette_colorwallmounted.png",
    sunlight_propagates = true,
    --walkable = false,
    node_box = nbox,
	selection_box = cbox,
	collision_box = cbox,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2, ud_param2_colorable = 1},
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		unifieddyes.fix_rotation_nsew(pos, placer, itemstack, pointed_thing)
		unifieddyes.recolor_on_place(pos, placer, itemstack, pointed_thing)
	end,
	after_dig_node = unifieddyes.after_dig_node,
	on_rotate = unifieddyes.fix_after_screwdriver_nsew,
    --on_rightclick = function(pos, node, player, itemstack, pointed_thing)
    --end,
})

dofile(modpath .. "/recipes.lua")
