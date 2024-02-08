# Barchairs

This Mod adds Barchairs to Minetest.

![Screenshot 1](screenshot.jpg)
## Install

Move your Download to the Mods-Folder.<br>
For additional support set barchairs.register_moretrees, barchairs.register_moreblocks or barchairs.register_cool_trees to true.

## Depends

default<br>

### optional
intllib, baldcypress, bamboo, birch, cacaotree, cherrytree, chestnuttree, clementinetree, ebony, holytree, jacaranda, larch, lemontree, mahogany, maple, oak, palm, plumtree, pomegranate, sequoia, willow, moretrees, moreblocks<br>

## For Admins

Barchairs supports moretrees, moreblocks or cooltrees, but this is deactivated by default.
To activate this mods, add the following lines:<br>
<br>
barchairs.register_moretrees = true<br>
barchairs.register_moreblocks = true<br>
barchairs.register_cool_trees = true<br>

Barchairs 1.3 or higher have changed (fixed) the variable barchair to barchairs.<br>
If you have unknown Barchairs in your world then enable the following option:<br>

barchairs.convert_old = true

This activates an alias to the old names of the barchairs and you don't loose any old barchair.
If all in your world is converted, you can disable this option.

## For Modwriter

### Function barchair.register_barchair(mod, mat, burnvalue)

With this interface, Barchairs can simply support your mod.<br>

mod = String of the current modname like "default:"<br>
mat = Material, is the name of the node like "dirt"<br>
burnvalue = Is the Chair burnable? 0 = not burnable, >= how long takes it to burn. If you don't give a valid Number, burnvalue = 0 and the chair is unburnable.<br>

## License

License: GPL 3.0
