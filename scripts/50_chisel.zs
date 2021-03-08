import mods.immersiveengineering.Crusher;


########################################################################################################################

# Chisel -- allow any blade metal
recipes.remove(<chisel:chisel_iron>);
recipes.addShaped(<chisel:chisel_iron>, [
    [null, <ore:bladeMetalIngot>],
    [<ore:stickWood>],
]);

# Marble Dust -- allow crushing marble into dust with the IE Crusher
Crusher.addRecipe(<contenttweaker:marble_dust> * 4, <ore:stoneMarble>, 4096);
