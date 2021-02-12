import mods.jei.JEI;


########################################################################################################################

var ids = [] as int[];


########################################################################################################################

# Chisel -- Block of Charcoal -- remove recipe which conflicts with TE
recipes.remove(<chisel:block_charcoal>);

# Fist Full of Hay
JEI.removeAndHide(<fistful_of_hay:logo>);

# Mowzie's Mobs
JEI.removeAndHide(<mowziesmobs:mob_remover>);
JEI.removeAndHide(<mowziesmobs:test_structure>);
