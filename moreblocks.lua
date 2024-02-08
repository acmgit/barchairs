-- Register Barchairs for moreblocks

local material = {
        -- Mod , Material, burnvalue
        {"moreblocks:", "wood_tile_center", 15 },
        {"moreblocks:", "wood_tile_full", 15 },
        {"moreblocks:", "wood_tile_offset", 15 },
        {"moreblocks:", "wood_tile_down", 15 },
        {"moreblocks:", "wood_tile_left", 15 },
        {"moreblocks:", "wood_tile_right", 15 },
        {"moreblocks:", "circle_stone_bricks", 0 },
        {"moreblocks:", "grey_bricks", 0 },
        {"moreblocks:", "coal_stone_bricks", 0 },
        {"moreblocks:", "iron_stone_bricks", 0 },
        {"moreblocks:", "stone_tile", 0 },
        {"moreblocks:", "split_stone_tile", 0 },
        {"moreblocks:", "checker_stone_tile", 0 },
        {"moreblocks:", "plankstone", 0 },
        {"moreblocks:", "cactus_brick", 0 },
        {"moreblocks:", "iron_stone", 0 },
        {"moreblocks:", "copperpatina", 0 },

}

local register = barchair.register_barchair

for _,kind in pairs(material) do

    mod = kind[1]               -- Modname
    mat = kind[2]               -- Materialname (for the Textur)
    burn = kind[3]              -- Burnvalue > 0 = burnable
    -- print( mod, mat, burn)

    register(mod, mat, burn)

end -- for
