import crafttweaker.item.IItemStack;
import mods.immersiveengineering.Crusher;


########################################################################################################################

var circuitBoard = <immersiveengineering:material:27>;
var copperWire = <immersiveengineering:material:20>;
val crushingHammer = <engineerstools:crushing_hammer>;

val WATER = <liquid:water>.name;
val waterItem =
    <minecraft:water_bucket> | <claybucket:claybucket:1> |
    <forge:bucketfilled>.withTag({FluidName: WATER, Amount: 1000}) |
    <forestry:can:1>.withTag({Fluid: {FluidName: WATER, Amount: 1000}}) |
    <forestry:refractory:1>.withTag({Fluid: {FluidName: WATER, Amount: 1000}}) |
    <forestry:capsule:1>.withTag({Fluid: {FluidName: WATER, Amount: 1000}});


########################################################################################################################

# Bushing -- Only allow brass bushings
var bushing = <railcraft:gear:3>;
recipes.remove(bushing);
recipes.addShaped(bushing * 4, [
    [<ore:ingotBrass>, <ore:ingotBrass>],
    [<ore:ingotBrass>, <ore:ingotBrass>],
]);

# Concrete -- Make recipe for concrete which doesn't require a trip to the nether
recipes.remove(<railcraft:concrete>);
recipes.addShaped(<railcraft:concrete> * 2, [
    [<ore:gravel>, <ore:dustSlag>],
    [<ore:dustSlag>, <ore:gravel>],
]);

# Controller Circuit -- Add more-compatible recipe for controller circuit
recipes.remove(<railcraft:circuit:0>);
recipes.addShapeless(<railcraft:circuit:0>, [
    circuitBoard, copperWire, <ore:woolRed>, <ore:dustRedstone>
]);

# Creosote Wood -- Only permit creating Creosote Wood Blocks in the Carpenter
recipes.remove(<railcraft:generic:5>);

# Creosote -- don't allow smelting charcoal to creosote bottles
furnace.remove(<railcraft:fluid_bottle_creosote>);

# Crushed Obsidian -- Add recipe for crushed obsidian
Crusher.addRecipe(<railcraft:generic:7>, <ore:obsidian>, 4096);

# Dust -- Add recipes for railcraft dusts
Crusher.addRecipe(<railcraft:dust:6>, <minecraft:ender_pearl>, 8000);  # ender powder
Crusher.addRecipe(<railcraft:dust:3>, <ore:charcoal>, 512);  # charcoal dust
Crusher.addRecipe(<railcraft:dust:3> * 9, <ore:blockCharcoal>, 4096);  # charcoal dust
Crusher.addRecipe(<railcraft:dust:4> * 2, <ore:itemSlag>, 1024);  # slag dust
Crusher.addRecipe(<railcraft:dust:5> * 2, <ore:oreCoal>, 2048);  # coal dust
Crusher.addRecipe(<railcraft:dust:5> * 9, <ore:blockCoal>, 4096);  # coal dust
recipes.addShapeless(<railcraft:dust:3>, [<ore:charcoal>, crushingHammer.anyDamage().transformDamage(2).reuse()]);
recipes.addShapeless(<railcraft:dust:5>, [<ore:coal>, crushingHammer.anyDamage().transformDamage(2).reuse()]);

# Electrode -- Fix missing names
<railcraft:charge:9>.displayName = "Carbon Electrode";
<railcraft:charge:10>.displayName = "Silver Electrode";

# Iron Tank Gauge -- remove colored recipes
for meta in 0 .. 16 {
    recipes.remove(<railcraft:tank_iron_gauge>.definition.makeStack(meta));
}
recipes.addShaped(<railcraft:tank_iron_gauge:0>, [
    [<minecraft:glass_pane>, <ore:plateIron>, <minecraft:glass_pane>],
    [<ore:plateIron>, <minecraft:glass_pane>, <ore:plateIron>],
    [<minecraft:glass_pane>, <ore:plateIron>, <minecraft:glass_pane>],
]);

# Iron Tank Valve -- remove colored recipes
for meta in 0 .. 16 {
    recipes.remove(<railcraft:tank_iron_valve>.definition.makeStack(meta));
}
recipes.addShaped(<railcraft:tank_iron_valve:0>, [
    [<minecraft:glass_pane>, <ore:plateIron>, <minecraft:glass_pane>],
    [<ore:plateIron>, <minecraft:lever>, <ore:plateIron>],
    [<minecraft:glass_pane>, <ore:plateIron>, <minecraft:glass_pane>],
]);

# Iron Tank Wall -- remove colored recipes
for meta in 0 .. 16 {
    recipes.remove(<railcraft:tank_iron_wall>.definition.makeStack(meta));
}
recipes.addShaped(<railcraft:tank_iron_wall:0>, [
    [<ore:plateIron>, <ore:plateIron>],
    [<ore:plateIron>, <ore:plateIron>],
]);

# Radio Circuit -- Add more-compatible recipe for radio circuit
recipes.remove(<railcraft:circuit:3>);
recipes.addShapeless(<railcraft:circuit:3>, [
    circuitBoard, copperWire, <ore:woolBlue>, <ore:dustRedstone>
]);

# Receiver Circuit -- Add more-compatible recipe for receiver circuit
recipes.remove(<railcraft:circuit:1>);
recipes.addShapeless(<railcraft:circuit:1>, [
    circuitBoard, copperWire, <ore:woolGreen>, <ore:dustRedstone>
]);  # receiver circuit

# Reinforced Concrete -- remove all colored recipes
for meta in 0 .. 16 {
    recipes.remove(<railcraft:reinforced_concrete>.definition.makeStack(meta));
}
recipes.addShaped(<railcraft:reinforced_concrete:8> * 8, [
    [<railcraft:concrete>, <railcraft:rebar>, <railcraft:concrete>],
    [<railcraft:rebar>, waterItem, <railcraft:rebar>],
    [<railcraft:concrete>, <railcraft:rebar>, <railcraft:concrete>],
]);

# Signal Circuit -- Add more-compatible recipe for signal circuit
recipes.remove(<railcraft:circuit:2>);
recipes.addShapeless(<railcraft:circuit:2>, [
    circuitBoard, copperWire, <ore:woolYellow>, <ore:dustRedstone>
]);

# Strengthened Glass -- only allow plain glass
recipes.remove(<railcraft:glass:0>);
recipes.addShaped(<railcraft:glass:0>, [
    [<minecraft:glass>, <ore:toolMetalIngot>, <minecraft:glass>],
    [<minecraft:glass>, <ore:dustSaltpeter>, <minecraft:glass>],
    [<minecraft:glass>, waterItem, <minecraft:glass>],
]);

# Steel Tank Gauge -- remove colored recipes
for meta in 0 .. 16 {
    recipes.remove(<railcraft:tank_steel_gauge>.definition.makeStack(meta));
}
recipes.addShaped(<railcraft:tank_steel_gauge:0>, [
    [<minecraft:glass_pane>, <ore:plateSteel>, <minecraft:glass_pane>],
    [<ore:plateSteel>, <minecraft:glass_pane>, <ore:plateSteel>],
    [<minecraft:glass_pane>, <ore:plateSteel>, <minecraft:glass_pane>],
]);

# Steel Tank Valve -- remove colored recipes
for meta in 0 .. 16 {
    recipes.remove(<railcraft:tank_steel_valve>.definition.makeStack(meta));
}
recipes.addShaped(<railcraft:tank_steel_valve:0>, [
    [<minecraft:glass_pane>, <ore:plateSteel>, <minecraft:glass_pane>],
    [<ore:plateSteel>, <minecraft:lever>, <ore:plateSteel>],
    [<minecraft:glass_pane>, <ore:plateSteel>, <minecraft:glass_pane>],
]);

# Steel Tank Wall -- remove colored recipes
for meta in 0 .. 16 {
    recipes.remove(<railcraft:tank_steel_wall>.definition.makeStack(meta));
}
recipes.addShaped(<railcraft:tank_steel_wall:0>, [
    [<ore:plateSteel>, <ore:plateSteel>],
    [<ore:plateSteel>, <ore:plateSteel>],
]);

# Sulfur -- Allow Railcraft sulfur to be converted to Immersive Engineering sulfur
recipes.addShapeless(<immersiveengineering:material:25>, [<ore:dustSulfur>]);

# Tie -- Only permit creating ties using a Carpenter
recipes.remove(<railcraft:tie>);
recipes.remove(<railcraft:tie:1>);

# Trackman's Nodepad -- fix recipe to use black dye
recipes.remove(<railcraft:tool_notepad>);
recipes.addShaped(<railcraft:tool_notepad>, [
    [<ore:dyeBlack>, <ore:feather>],
    [<railcraft:tool_magnifying_glass>, <ore:paper>],
]);


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
