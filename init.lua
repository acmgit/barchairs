local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

local mod
local mat
local burn

local material = {}

-- Various default Wood
material = {
        -- Mod , Material, burnvalue
        {"default:", "wood", 15 },
        {"default:", "junglewood", 15 },
        {"default:", "aspen_wood", 15 },
        {"default:", "pine_wood", 15 },
        {"default:", "acacia_wood", 15 },
    
        --glasslike
        {"default:", "obsidian", 0 },
        {"default:", "ice", 0 },
        {"default:", "diamondblock", 0 },
        {"default:", "mese", 0 },
        -- trees
        {"default:", "aspen_tree", 17 },
        {"default:", "acacia_tree", 17 },
        {"default:", "pine_tree", 17 },
        {"default:", "jungletree", 17 },
        {"default:", "tree", 17 },
    
        -- other
        {"default:", "cactus", 12 },
        {"default:", "coral_skeleton", 0 },
    
        -- metal
        {"default:", "goldblock", 0 },
        {"default:", "bronzeblock", 0 },
        {"default:", "tinblock", 0 },
        {"default:", "copperblock", 0 },
        {"default:", "steelblock", 0 },
}


for _,kind in pairs(material) do
    
    mod = kind[1]               -- Modname
    mat = kind[2]               -- Materialname (for the Textur)
    burn = kind[3]              -- Burnvalue > 0 = burnable
    -- print( mod, mat, burn)
    
    if(minetest.registered_nodes[mod .. mat] ~= nil) then 
        
        -- Barchair
        minetest.register_node(modname .. ":barchairs_plain_" .. mat, {
            description = "Barchair plain " .. mat,
            tiles = minetest.registered_nodes[mod .. mat].tiles,
            groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
            sounds = default.node_sound_wood_defaults(),
            drawtype = "nodebox",
            paramtype = "light",
            paramtype2 = "facedir",
            node_box = {
                type = "fixed",
                fixed = {
                    {-0.1875, 0.125, -0.25, 0.1875, 0.25, 0.1875}, -- Barchair
                    {-0.1875, -0.5, -0.25, -0.125, 0.25, -0.1875}, -- Bein_vl
                    {0.125, -0.5, 0.125, 0.1875, 0.25, 0.1875}, -- Bein_hr
                    {-0.1875, -0.5, 0.125, -0.125, 0.25, 0.1875}, -- Bein_hl
                    {0.125, -0.5, -0.25, 0.1875, 0.25, -0.1875}, -- Bein_vr
                    {-0.125, -0.3125, -0.25, 0.125, -0.25, -0.1875}, -- Quer_l
                    {-0.125, -0.3125, 0.125, 0.125, -0.25, 0.1875}, -- Quer_r
                    {-0.1875, -0.3125, -0.1875, -0.125, -0.25, 0.125}, -- Quer_h
                    {0.125, -0.3125, -0.1875, 0.1875, -0.25, 0.1875}, -- Quer_v
                }
            },
            on_place = minetest.rotate_node,
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
            output = modname .. ":barchairs_plain_" .. mat .. " 2",
            recipe = {
                    {"",mod .. mat,""},
                    {"default:stick","","default:stick"},
                    {"default:stick",mod .. mat,"default:stick"}
            },
        }) -- minetest.register_craft
        
        if(burn > 0) then
                minetest.register_craft({
                    type = "fuel",
                    recipe = modname .. ":barchairs_plain_" .. mat,
                    burntime = burn,
                }) -- minetest.register_craft
                
        end -- if(burn

        -- Bar
            
        -- Bar Front
        minetest.register_node(modname .. ":bar_front_" .. mat, {
            description = "Bar front " .. mat,
            tiles = minetest.registered_nodes[mod .. mat].tiles,
            groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
            sounds = default.node_sound_wood_defaults(),
            drawtype = "nodebox",
            paramtype = "light",
            paramtype2 = "facedir",
            node_box = {
                type = "fixed",
                fixed = {
                            {0.0625, -0.5, -0.5, 0.1875, 0.5, 0.5}, -- Front
                            {0.0625, 0.375, -0.5, 0.5, 0.5, 0.5}, -- Top
                            {0, -0.5, 0.375, 0.0625, 0.5, 0.4375}, -- Deco_1
                            {0, -0.5, 0.125, 0.0625, 0.5, 0.1875}, -- Deco_2
                            {0, -0.5, -0.125, 0.0625, 0.5, -0.0625}, -- Deco_3
                            {0, -0.5, -0.375, 0.0625, 0.5, -0.3125}, -- Deco_4
                     
                        }
                    
                }, -- node_box
                                                             
            on_place = minetest.rotate_node,
                                           
        }) -- minetest.register_node

        -- Recipe
        minetest.register_craft({
            output = modname .. ":bar_front_" .. mat .. " 2",
            recipe = {
                    {"",mod .. mat,""},
                    {"default:stick","default:stick","default:stick"},
                    {"",mod .. mat,""}
            },
        }) -- minetest.register_craft
        
        -- Recipe full
        if(burn > 0) then
                minetest.register_craft({
                    type = "fuel",
                    recipe = modname .. ":bar_front_" .. mat,
                    burntime = burn + 2,
                }) -- minetest.register_craft
                
        end -- if(burn

        -- Bar Corner left
        minetest.register_node(modname .. ":bar_corner_left_" .. mat, {
            description = "Bar corner left " .. mat,
            tiles = minetest.registered_nodes[mod .. mat].tiles,
            groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
            sounds = default.node_sound_wood_defaults(),
            drawtype = "nodebox",
            paramtype = "light",
            paramtype2 = "facedir",
            node_box = {
                type = "fixed",
                fixed = {
                            {-0.5, -0.5, -0.1875, 0.5, 0.5, -0.0625}, -- Front
                            {-0.5, 0.375, -0.5, 0.5, 0.5, -0.0625}, -- Top
                            {-0.4375, -0.5, -0.0625, -0.375, 0.5, -0}, -- Deco_1
                            {-0.1875, -0.5, -0.0625, -0.125, 0.5, -0}, -- Deco_2
                            {0.0625, -0.5, -0.0625, 0.125, 0.5, -0}, -- Deco_3
                            {0.3125, -0.5, -0.0625, 0.375, 0.5, -0}, -- Deco_4
                            {-0.5, -0.5, -0.5, -0.375, 0.5, -0.125}, -- Side_r
                     
                        }
                    
                }, -- node_box
                                                             
            on_place = minetest.rotate_node,
                                           
        }) -- minetest.register_node
        
        -- Recipe
        minetest.register_craft({
            output = modname .. ":bar_corner_left_" .. mat .. " 2",
            recipe = {
                    {mod .. mat,"",""},
                    {"default:stick","default:stick","default:stick"},
                    {mod .. mat, "",""}
            },
        }) -- minetest.register_craft
        
        -- Recipe full
        if(burn > 0) then
                minetest.register_craft({
                    type = "fuel",
                    recipe = modname .. ":bar_corner_left_" .. mat,
                    burntime = burn + 2,
                }) -- minetest.register_craft
                
        end -- if(burn

        -- Bar Corner right
        minetest.register_node(modname .. ":bar_corner_right_" .. mat, {
            description = "Bar corner right " .. mat,
            tiles = minetest.registered_nodes[mod .. mat].tiles,
            groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
            sounds = default.node_sound_wood_defaults(),
            drawtype = "nodebox",
            paramtype = "light",
            paramtype2 = "facedir",
            node_box = {
                type = "fixed",
                fixed = {
                            {-0.5, -0.5, 0.0625, 0.5, 0.5, 0.1875}, -- Front
                            {-0.5, 0.375, 0.0625, 0.5, 0.5, 0.5}, -- Top
                            {-0.4375, -0.5, 0, -0.375, 0.5, 0.0625}, -- Deco_1
                            {-0.1875, -0.5, 0, -0.125, 0.5, 0.0625}, -- Deco_2
                            {0.0625, -0.5, 0, 0.125, 0.5, 0.0625}, -- Deco_3
                            {0.3125, -0.5, 0, 0.375, 0.5, 0.0625}, -- Deco_4
                            {-0.5, -0.5, 0.125, -0.375, 0.5, 0.5}, -- Side_r

                        }
                    
                }, -- node_box
                                                             
            on_place = minetest.rotate_node,
                                           
        }) -- minetest.register_node

        -- Recipe
        minetest.register_craft({
            output = modname .. ":bar_corner_right_" .. mat .. " 2",
            recipe = {
                    {"", "", mod .. mat},
                    {"default:stick","default:stick","default:stick"},
                    {"", "", mod .. mat}
            },
        }) -- minetest.register_craft
        
        -- Recipe full
        if(burn > 0) then
                minetest.register_craft({
                    type = "fuel",
                    recipe = modname .. ":bar_corner_right_" .. mat,
                    burntime = burn + 2,
                }) -- minetest.register_craft
                
        end -- if(burn

        -- Bar Side
        minetest.register_node(modname .. ":bar_side_" .. mat, {
            description = "Bar side " .. mat,
            tiles = minetest.registered_nodes[mod .. mat].tiles,
            groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
            sounds = default.node_sound_wood_defaults(),
            drawtype = "nodebox",
            paramtype = "light",
            paramtype2 = "facedir",
            node_box = {
                type = "fixed",
                fixed = {
                            {-0.5, -0.5, -0.4375, 0.5, 0.5, -0.3125}, -- Front
                            {-0.5, 0.375, -0.5, 0.5, 0.5, -0.0625}, -- Top
                            {0.375, -0.5, -0.5, 0.4375, 0.5, -0.4375}, -- Deco_1
                            {0.0625, -0.5, -0.5, 0.125, 0.5, -0.4375}, -- Deco_2
                            {-0.125, -0.5, -0.5, -0.0625, 0.5, -0.4375}, -- Deco_3
                            {-0.375, -0.5, -0.5, -0.3125, 0.5, -0.4375}, -- Deco_4
                     
                        }
                    
                }, -- node_box
                                                             
            on_place = minetest.rotate_node,
                                           
        }) -- minetest.register_node

        -- Recipe
        minetest.register_craft({
            output = modname .. ":bar_side_" .. mat .. " 2",
            recipe = {
                    {"","default:stick",""},
                    {mod .. mat,"default:stick",mod .. mat},
                    {"","default:stick",""}
            },
        }) -- minetest.register_craft
        
        -- Recipe full
        if(burn > 0) then
                minetest.register_craft({
                    type = "fuel",
                    recipe = modname .. ":bar_side_" .. mat,
                    burntime = burn + 2,
                }) -- minetest.register_craft
                
        end -- if(burn

    end -- if(minetest.registered_nodes

end -- for
