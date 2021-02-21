import crafttweaker.item.IItemStack;
import mods.immersiveengineering.Crusher;


########################################################################################################################

var circuitBoard = <immersiveengineering:material:27>;
var copperWire = <immersiveengineering:material:20>;


########################################################################################################################

# Fix missing names
<railcraft:charge:9>.displayName = "Carbon Electrode";
<railcraft:charge:10>.displayName = "Silver Electrode";

# Add recipes for railcraft dusts
Crusher.addRecipe(<railcraft:dust:6>, <minecraft:ender_pearl>, 8000);  # ender powder
Crusher.addRecipe(<railcraft:dust:3>, <ore:charcoal>, 512);  # charcoal dust
Crusher.addRecipe(<railcraft:dust:3> * 9, <ore:blockCharcoal>, 4096);  # charcoal dust
Crusher.addRecipe(<railcraft:dust:4> * 2, <ore:itemSlag>, 1024);  # slag dust
Crusher.addRecipe(<railcraft:dust:5> * 2, <ore:oreCoal>, 2048);  # coal dust
Crusher.addRecipe(<railcraft:dust:5> * 9, <ore:blockCoal>, 4096);  # coal dust

# Allow Railcraft sulfur to be converted to Immersive Engineering sulfur
recipes.addShapeless(<immersiveengineering:material:25>, [<ore:dustSulfur>]);

# Add more-compatible recipe for controller circuit
recipes.remove(<railcraft:circuit:0>);
recipes.addShapeless(<railcraft:circuit:0>, [
    circuitBoard, copperWire, <ore:woolRed>, <ore:dustRedstone>
]);

# Add more-compatible recipe for receiver circuit
recipes.remove(<railcraft:circuit:1>);
recipes.addShapeless(<railcraft:circuit:1>, [
    circuitBoard, copperWire, <ore:woolGreen>, <ore:dustRedstone>
]);  # receiver circuit

# Add more-compatible recipe for signal circuit
recipes.remove(<railcraft:circuit:2>);
recipes.addShapeless(<railcraft:circuit:2>, [
    circuitBoard, copperWire, <ore:woolYellow>, <ore:dustRedstone>
]);

# Add more-compatible recipe for radio circuit
recipes.remove(<railcraft:circuit:3>);
recipes.addShapeless(<railcraft:circuit:3>, [
    circuitBoard, copperWire, <ore:woolBlue>, <ore:dustRedstone>
]);

# Make recipe for concrete which doesn't require a trip to the nether
recipes.remove(<railcraft:concrete>);
recipes.addShaped(<railcraft:concrete> * 2, [
    [<ore:gravel>, <ore:dustSlag>],
    [<ore:dustSlag>, <ore:gravel>],
]);

# Only permit creating ties using a Carpenter
recipes.remove(<railcraft:tie>);
recipes.remove(<railcraft:tie:1>);

# Only permit creating Creosote Wood Blocks in the Carpenter
recipes.remove(<railcraft:generic:5>);

# Only allow brass bushings
var bushing = <railcraft:gear:3>;
recipes.remove(bushing);
recipes.addShaped(bushing * 4, [
    [<ore:ingotBrass>, <ore:ingotBrass>],
    [<ore:ingotBrass>, <ore:ingotBrass>],
]);

# Add recipe for crushed obsidian
Crusher.addRecipe(<railcraft:generic:7>, <ore:obsidian>, 4096);


# import moretweaker.railcraft.BlastFurnace;
# BlastFurnace.add(IItemStack output, IIngredient input, optional int ticks, optional int slag);
# BlastFurnace.remove(IIngredient output);
# BlastFurnace.removeAll();
#
# Coke Oven
# import moretweaker.railcraft.CokeOven;
# CokeOven.add(IItemStack output, IIngredient input, ILiquidStack liquidOutput, optional int ticks);
# CokeOven.remove(IIngredient output);
# CokeOven.removeAll();
#
# Rock Crusher
# import moretweaker.railcraft.RockCrusher;
# RockCrusher.add(IIngredient input, IItemStack[] outputs, float[] chances, optional int ticks);
# RockCrusher.remove(IIngredient output);
# RockCrusher.removeAll();
# Rolling Machine
#
# import moretweaker.railcraft.RollingMachine;
#
# RollingMachine.addShaped(IItemStack output, IIngredient[][] inputs, optional int ticks);
#
# RollingMachine.addShapeless(IItemStack output, IIngredient[] inputs, optional int ticks);
#
# RollingMachine.remove(IIngredient output);
#
# RollingMachine.removeAll();
#
# Fluid Fuels
#
# import moretweaker.railcraft.FluidFuels;
#
# FluidFuels.add(ILiquidStack fuel, optional int heatPerBucket);
#
# FluidFuels.remove(ILiquidStack fuel);
#
# FluidFuels.removeAll();
