local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

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
