import mods.jei.JEI;


########################################################################################################################

var ids = [] as int[];


########################################################################################################################

# Charcoal -- remove recipes in favor of Forestry charcoal pile
recipes.remove(<minecraft:coal:1>);
furnace.remove(<minecraft:coal:1>);

# Chisel -- Block of Charcoal -- remove recipe which conflicts with TE
recipes.remove(<chisel:block_charcoal>);

# Fist Full of Hay
JEI.removeAndHide(<fistful_of_hay:logo>);

# Mowzie's Mobs
JEI.removeAndHide(<mowziesmobs:mob_remover>);
JEI.removeAndHide(<mowziesmobs:test_structure>);
