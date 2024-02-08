--[[
	**********************************************
	***             Barchair                   ***
    ***                                        ***
    ***  Barchair is a Mod for Minetest        ***
    ***  and adds some simple Barchairs to     ***
    ***  the Game.                             ***
    ***                                        ***
    ***  License: GPL 3.0 by A.C.M.            ***
    ***                                        ***
	**********************************************
			
]]--

local mod
local mat
local burn
local material = {}

barchairs = {}

barchairs.modname = minetest.get_current_modname()
barchairs.modpath = minetest.get_modpath(barchairs.modname)
barchairs.version = 1
barchairs.revision = 3
barchairs.convert_old = false

local settings = "barchairs."
barchairs.convert_old  = minetest.settings:get(settings .. "convert_old") or false
if(barchairs.convert_old) then
    minetest.log("ACTION", "[MOD] " .. barchairs.modname .. ": Fix old barchairs is on.")

end

local S

if(minetest.get_modpath("intllib")) then
    S = dofile(barchairs.modpath .."/intllib.lua")
    print("[MOD] " .. barchairs.modname .. ": translating in intllib-mode.")
    
else
    S = minetest.get_translator(barchairs.modname)
    print("[MOD] " .. barchairs.modname .. ": translating in minetest-mode.")
    
end -- if(minetest.get_modpath(
    
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

--[[
***************************************************************
                Function register_barchairs()

mod = String of the current modname like "default:"
mat = Material, is the name of the node lide "dirt"
burnvalue = Is the Chair burnable? 0 = not burnable, >= how long takes it to burn
            If you don't give a valid Number, burnvalue = 0 and the chair is unburnable.

***************************************************************
]]--

function barchairs.register_barchair(mod, mat, burnvalue)
    
    if(mod == "" or mod == nil) then
        return
        
    end -- if(mod ==
        
    if(mat == "" or mat == nil) then
        return
    
    end -- if(mat ==
        
    if(burnvalue == nil or burnvalue < 0) then 
        burnvalue = 0
        
    end -- if(burnvalue
    
    mod = string.match(mod, "%w+%:-")
    
    if(minetest.registered_nodes[mod ..":" .. mat] ~= nil) then 
                
        -- Barchair
        minetest.register_node(":" .. barchairs.modname .. ":barchairs_plain_" .. mod .. "_" .. mat, {
            description = S("Barchair plain ") .. mod .. mat,
            tiles = minetest.registered_nodes[mod .. ":" .. mat].tiles,
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
            output = barchairs.modname .. ":barchairs_plain_" .. mod .. "_" .. mat .. " 2",
            recipe = {
                    {"",mod .. ":" .. mat,""},
                    {"default:stick","","default:stick"},
                    {"default:stick",mod .. ":" .. mat,"default:stick"}
            },
        }) -- minetest.register_craft
        
        if(burn > 0) then
                minetest.register_craft({
                    type = "fuel",
                    recipe = barchairs.modname .. ":barchairs_plain_" .. mat,
                    burntime = burnvalue,
                }) -- minetest.register_craft
                
        end -- if(burn

        -- Bar
            
        -- Bar Front
        minetest.register_node(":" .. barchairs.modname .. ":bar_front_" .. mod .. "_" .. mat, {
            description = S("Bar front ") .. mod .. "_" .. mat,
            tiles = minetest.registered_nodes[mod .. ":" .. mat].tiles,
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
            output = barchairs.modname .. ":bar_front_" .. mod .. "_" .. mat .. " 2",
            recipe = {
                    {"",mod .. ":" .. mat,""},
                    {"default:stick","default:stick","default:stick"},
                    {"",mod .. ":" .. mat,""}
            },
        }) -- minetest.register_craft
        
        -- Recipe full
        if(burn > 0) then
                minetest.register_craft({
                    type = "fuel",
                    recipe = barchairs.modname .. ":bar_front_" .. mod .. "_" .. mat,
                    burntime = burnvalue + 2,
                }) -- minetest.register_craft
                
        end -- if(burn

        -- Bar Corner left
        minetest.register_node(":" .. barchairs.modname .. ":bar_corner_left_" .. mod .. "_" .. mat, {
            description = S("Bar corner left ") .. mod .. "_" .. mat,
            tiles = minetest.registered_nodes[mod .. ":" .. mat].tiles,
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
            output = barchairs.modname .. ":bar_corner_left_" .. mod .. "_" .. mat .. " 2",
            recipe = {
                    {mod .. ":" .. mat,"",""},
                    {"default:stick","default:stick","default:stick"},
                    {mod .. ":" .. mat, "",""}
            },
        }) -- minetest.register_craft
        
        -- Recipe full
        if(burn > 0) then
                minetest.register_craft({
                    type = "fuel",
                    recipe = barchairs.modname .. ":bar_corner_left_" .. mod .. "_" .. mat,
                    burntime = burnvalue + 2,
                }) -- minetest.register_craft
                
        end -- if(burn

        -- Bar Corner right
        minetest.register_node(":" .. barchairs.modname .. ":bar_corner_right_" .. mod .. "_" .. mat, {
            description = S("Bar corner right ") .. mod .. "_" .. mat,
            tiles = minetest.registered_nodes[mod .. ":" .. mat].tiles,
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
            output = barchairs.modname .. ":bar_corner_right_" .. mod .. "_" .. mat .. " 2",
            recipe = {
                    {"", "", mod .. ":" .. mat},
                    {"default:stick","default:stick","default:stick"},
                    {"", "", mod .. ":" .. mat}
            },
        }) -- minetest.register_craft
        
        -- Recipe full
        if(burn > 0) then
                minetest.register_craft({
                    type = "fuel",
                    recipe = barchairs.modname .. ":bar_corner_right_" .. mod .. "_" .. mat,
                    burntime = burnvalue + 2,
                }) -- minetest.register_craft
                
        end -- if(burn

        -- Bar Side
        minetest.register_node(":" .. barchairs.modname .. ":bar_side_" .. mod .. "_" .. mat, {
            description = S("Bar side ") .. mod .. "_" .. mat,
            tiles = minetest.registered_nodes[mod .. ":" .. mat].tiles,
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
            output = barchairs.modname .. ":bar_side_" .. mod .. "_" .. mat .. " 2",
            recipe = {
                    {"","default:stick",""},
                    {mod .. ":" .. mat,"default:stick",mod .. ":" .. mat},
                    {"","default:stick",""}
            },
        }) -- minetest.register_craft
        
        -- Recipe full
        if(burn > 0) then
                minetest.register_craft({
                    type = "fuel",
                    recipe = barchairs.modname .. ":bar_side_" .. mod .. "_" .. mat,
                    burntime = burnvalue + 2,
                }) -- minetest.register_craft
                
        end -- if(burn
            
        minetest.log("info", "[MOD] Barchairs: " .. mod .. ":" .. mat .. " registered.")
        
    else
        minetest.log("warning", "[MOD] Barchairs: " .. mod .. ":" .. mat .. " not found to register.")
        
    end -- if(minetest.registered_nodes

    if(barchairs.convert_old) then
            minetest.register_alias(barchairs.modname .. ":barchairs_plain_" .. mod .. "_" .. mat,"barchair:barchairs_plain_" .. mod .. "_" .. mat)
            minetest.register_alias(barchairs.modname .. ":bar_front_" .. mod .. "_" .. mat,"barchair:bar_front_" .. mod .. "_" .. mat)
            minetest.register_alias(barchairs.modname .. ":bar_corner_left_" .. mod .. "_" .. mat,"barchair:bar_corner_left_" .. mod .. "_" .. mat)
            minetest.register_alias(barchairs.modname .. ":bar_corner_right_" .. mod .. "_" .. mat,"barchair:bar_corner_right_" .. mod .. "_" .. mat)
            minetest.register_alias(barchairs.modname .. ":bar_side_" .. mod .. "_" .. mat,"barchair:bar_side_" .. mod .. "_" .. mat)

    end

end -- function barchairs.register_barchair(

local register = barchairs.register_barchair

for _,kind in pairs(material) do
    
    mod = kind[1]               -- Modname
    mat = kind[2]               -- Materialname (for the Textur)
    burn = kind[3]              -- Burnvalue > 0 = burnable
    -- print( mod, mat, burn)
    
    register(mod, mat, burn)
    
end -- for

local settings = "barchairs."
barchairs.register_moretrees  = minetest.settings:get(settings .. "register_moretrees") or false
barchairs.register_moreblocks  = minetest.settings:get(settings .. "register_moreblocks") or false
barchairs.register_cool_trees  = minetest.settings:get(settings .. "register_cool_trees") or false

if (barchairs.register_moretrees) then
    dofile(barchairs.modpath .. "/moretrees.lua")
    minetest.log("ACTION", "[MOD] Barchairs: moretrees registered.")

end

if (barchairs.register_moreblocks) then
    dofile(barchairs.modpath .. "/moreblocks.lua")
    minetest.log("ACTION", "[MOD] Barchairs: moreblocks registered.")

end

if (barchairs.register_cool_trees) then
    dofile(barchairs.modpath .. "/cool_trees.lua")
    minetest.log("ACTION", "[MOD] Barchairs: cool_trees registered.")

end

print("[MOD]" .. barchairs.modname .. " Version " .. barchairs.version .. "." .. barchairs.revision .. " successfully loaded.")
minetest.log("ACTION", "[MOD]" .. barchairs.modname .. " Version " .. barchairs.version .. "." .. barchairs.revision .. " successfully loaded.")
