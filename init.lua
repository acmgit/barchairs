local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

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

local wood = {}

-- Various default Wood
wood = {
        --wood
        "wood",
        "junglewood",
        "aspen_wood",
        "pine_wood",
        "acacia_wood",
    
        --glasslike
        "obsidian",
        "ice",
    
        -- trees
        "aspen_tree",
        "acacia_tree",
        "pine_tree",
        "jungletree",
        "tree",
    
        -- other
        "cactus",
        "coral_skeleton",
    
        -- metal
        "goldblock",
        "bronzeblock",
        "tinblock",
        "copperblock"
    
}


for _,kind in ipairs(wood) do
    

    if(minetest.registered_nodes["default:" .. kind] ~= nil) then
        
        minetest.register_node("barchairs:barchairs_plain_" .. kind, {
            description = "Barchair plain " .. kind,
            tiles = minetest.registered_nodes["default:" .. kind].tiles,                                                                  
            drawtype = "nodebox",
            paramtype = "light",
            node_box = {
                type = "fixed",
                fixed = {
                    {-0.3125, 0.375, -0.3125, 0.3125, 0.5, 0.3125}, -- Barchair
                    {-0.3125, -0.5, -0.3125, -0.25, 0.5, -0.1875}, -- Bein_vl
                    {0.25, -0.5, 0.1875, 0.3125, 0.5, 0.3125}, -- Bein_hr
                    {-0.3125, -0.5, 0.1875, -0.25, 0.5, 0.3125}, -- Bein_hl
                    {0.25, -0.5, -0.3125, 0.3125, 0.5, -0.1875}, -- Bein_vr
                    {-0.3125, -0.125, -0.3125, 0.3125, -0.0625, -0.25}, -- Quer_l
                    {-0.3125, -0.125, 0.25, 0.3125, -0.0625, 0.3125}, -- Quer_r
                    {-0.3125, -0.125, -0.25, -0.25, -0.0625, 0.3125}, -- Quer_h
                    {0.25, -0.125, -0.3125, 0.3125, -0.0625, 0.3125}, -- Quer_v
                }
            },
            on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
                if not clicker:is_player() then
                    return itemstack
                end
                pos.y = pos.y-0.5
                clicker:setpos(pos)
                return itemstack
            end
                                                               
        }) -- minetest.register_node

    
        minetest.register_craft({
            output = "barchairs:barchairs_plain_" .. kind,
            recipe = {
                    {"","default:" .. kind,""},
                    {"default:stick","","default:stick"},
                    {"default:stick","default:" .. kind,"default:stick"}
            },
        }) -- minetest.register_craft

        minetest.register_craft({
            type = "fuel",
            recipe = "barchairs:barchairs_plain_" .. kind,
            burntime = 17,
        }) -- minetest.register_craft

    end -- if(minetest.registered_nodes
    
end -- for

-- is Unifieddyes installed?
if(minetest.get_modpath("unifieddyes"))  then
   
    minetest.register_node("barchairs:barchairs_round_padded", 
    {
        description = "Round Barchair padded",
        drawtype = "mesh",
        mesh = "barchairs_barchair_round_padded.obj",
        tiles = {
            "default_wood",
            "wool_white.png"
        },
        inventory_image = "barchairs_barchair_round_padded_inv.png",
        parmtype = "light",
        paramtype2 = "colorwallmounted",
        palette = "unifieddyes_palette_colorwallmounted.png",
        sunlight_propagates = false,
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
        on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
            if not clicker:is_player() then
                return itemstack
            end
            pos.y = pos.y-0.5
            clicker:setpos(pos)
            return itemstack
        end
    })

    minetest.register_node("barchairs:barchairs_plain", 
    {
        description = "Barchair plain",
        drawtype = "mesh",
        mesh = "barchairs_barchair_plain.obj",
        tiles = {"default_wood"},
        inventory_image = "barchairs_barchair_plain_inv.png",
        parmtype = "light",
        paramtype2 = "wallmounted",
        sunlight_propagates = false,
        node_box = nbox,
        selection_box = cbox,
        collision_box = cbox,
        groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2, ud_param2_colorable = 1},
        sounds = default.node_sound_wood_defaults(),
        after_place_node = unifieddyes.fix_rotation_nsew,
        on_rotate = unifieddyes.fix_after_screwdriver_nsew,
        on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
            if not clicker:is_player() then
                return itemstack
            end
            pos.y = pos.y-0.5
            clicker:setpos(pos)
            return itemstack
        end
    })

end

dofile(modpath .. "/recipes.lua")
