-- Register Barchairs for cool_trees

local material = {
        -- Mod , Material, burnvalue
        {"baldcypress:", "trunk", 17 },
        {"baldcypress:", "wood", 15 },
        {"bamboo:", "trunk", 17 },
        {"bamboo:", "wood", 15 },
        {"birch:", "trunk", 17 },
        {"birch:", "wood", 15 },
        {"cacaotree:", "trunk", 17 },
        {"cacaotree:", "wood", 15 },
        {"cherrytree:", "trunk", 17 },
        {"cherrytree:", "wood", 15 },
        {"chestnuttree:", "trunk", 17 },
        {"chestnuttree:", "wood", 15 },
        {"clementinetree:", "trunk", 17 },
        {"clementinetree:", "wood", 15 },
        {"ebony:", "trunk", 17 },
        {"ebony:", "wood", 15 },
        {"hollytree:", "trunk", 17 },
        {"hollytree:", "wood", 15 },
        {"jacaranda:", "trunk", 17 },
        {"jacranada:", "wood", 15 },
        {"larch:", "trunk", 17 },
        {"larch:", "wood", 15 },
        {"lemontree:", "trunk", 17 },
        {"lemontree:", "wood", 15 },
        {"mahogany:", "trunk", 17 },
        {"mahogany:", "wood", 15 },
        {"maple:", "trunk", 17 },
        {"maple:", "wood", 15 },
        {"oak:", "trunk", 17 },
        {"oak:", "wood", 15 },
        {"palm:", "trunk", 17 },
        {"palm:", "wood", 15 },
        {"plumtree:", "trunk", 17 },
        {"plumtree:", "wood", 15 },
        {"pomegranate:", "trunk", 17 },
        {"pomegranate:", "wood", 15 },
        {"sequoia:", "trunk", 17 },
        {"sequoia:", "wood", 15 },

}

local register = barchairs.register_barchair

for _,kind in pairs(material) do

    local mod = kind[1]               -- Modname
    local mat = kind[2]               -- Materialname (for the Textur)
    local burnvalue = kind[3]              -- Burnvalue > 0 = burnable
    -- print( mod, mat, burn)

    register(mod, mat, burnvalue)

end -- for
