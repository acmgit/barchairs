# Barchairs

This Mod adds Barchairs to Minetest.

![Screenshot 1](screenshot.jpg)
## Install

Move your Download to the Mods-Folder.

## Depends

default<br>

### optional

## For Modwriter

### Function barchair.register_barchair(mod, mat, burnvalue)

With this interface, Barchairs can simply support your mod.<br>

mod = String of the current modname like "default:"<br>
mat = Material, is the name of the node like "dirt"<br>
burnvalue = Is the Chair burnable? 0 = not burnable, >= how long takes it to burn. If you don't give a valid Number, burnvalue = 0 and the chair is unburnable.<br>

## License

License: GPL 3.0
