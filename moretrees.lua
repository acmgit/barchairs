-- Register Barchairs for moretrees

local material = {
        -- Mod , Material, burnvalue
        {"moretrees:", "beech_trunk", 17 },
        {"moretrees:", "beech_planks", 15 },
        {"moretrees:", "apple_tree_trunk", 17 },
        {"moretrees:", "apple_tree_planks", 15 },
        {"moretrees:", "oak_trunk", 20 },
        {"moretrees:", "oak_planks", 18 },
        {"moretrees:", "sequoia_trunk", 20 },
        {"moretrees:", "sequoia_planks", 18 },
        {"moretrees:", "birch_trunk", 17 },
        {"moretrees:", "birch_planks", 15 },
        {"moretrees:", "palm_trunk", 17 },
        {"moretrees:", "palm_planks", 15 },
        {"moretrees:", "date_palm_trunk", 17 },
        {"moretrees:", "date_palm_planks", 15 },
        {"moretrees:", "spruce_trunk", 17 },
        {"moretrees:", "spruce_planks", 15 },
        {"moretrees:", "cedar_trunk", 17 },
        {"moretrees:", "cedar_planks", 15 },
        {"moretrees:", "poplar_trunk", 15 },
        {"moretrees:", "poplar_planks", 13 },
        {"moretrees:", "willow_trunk", 17 },
        {"moretrees:", "willow_planks", 15 },
        {"moretrees:", "rubber_tree_trunk", 17 },
        {"moretrees:", "rubber_tree_planks", 15 },
        {"moretrees:", "birch_trunk", 17 },
        {"moretrees:", "birch_planks", 15 },
        {"moretrees:", "fir_trunk", 17 },
        {"moretrees:", "fir_planks", 15 },
        {"moretrees:", "jungletree_trunk", 17 },
        {"moretrees:", "jungletree_planks", 15 },
}

local register = barchairs.register_barchair

for _,kind in pairs(material) do

    local mod = kind[1]               -- Modname
    local mat = kind[2]               -- Materialname (for the Textur)
    local burnvalue = kind[3]              -- Burnvalue > 0 = burnable
    -- print( mod, mat, burn)

    register(mod, mat, burnvalue)

end -- for
