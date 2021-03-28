import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.immersiveengineering.Crusher;
import moretweaker.railcraft.FluidFuels;


########################################################################################################################

var circuitBoard = <immersiveengineering:material:27>;
var copperWire = <immersiveengineering:material:20>;
val crushingHammer = <engineerstools:crushing_hammer>;

val RAILCRAFT_BRICKS = [
    <railcraft:brick_abyssal>,
    <railcraft:brick_andesite>,
    <railcraft:brick_bleachedbone>,
    <railcraft:brick_bloodstained>,
    <railcraft:brick_diorite>,
    <railcraft:brick_frostbound>,
    <railcraft:brick_granite>,
    <railcraft:brick_infernal>,
    <railcraft:brick_nether>,
    <railcraft:brick_pearlized>,
    <railcraft:brick_quarried>,
    <railcraft:brick_red_nether>,
    <railcraft:brick_red_sandy>,
    <railcraft:brick_sandy>,
] as IItemStack[];

val WATER_ITEM as IIngredient =
    <minecraft:water_bucket> | <claybucket:claybucket:1> |
    <forge:bucketfilled>.withTag({FluidName: "water", Amount: 1000}) |
    <forestry:can:1>.withTag({Fluid: {FluidName: "water", Amount: 1000}}) |
    <forestry:refractory:1>.withTag({Fluid: {FluidName: "water", Amount: 1000}}) |
    <forestry:capsule:1>.withTag({Fluid: {FluidName: "water", Amount: 1000}});


########################################################################################################################

# Adv. Item Loader -- use the immersive engineering shovel instead
recipes.remove(<railcraft:manipulator:2>);
recipes.addShaped(<railcraft:manipulator:2>, [
    [<ore:ingotSteel>, <ore:dustRedstone>, <ore:ingotSteel>],
    [<ore:dustRedstone>, <railcraft:manipulator:0>, <ore:dustRedstone>],
    [<ore:ingotSteel>, <immersiveengineering:shovel_steel>, <ore:ingotSteel>],
]);

# Adv. Item UnLoader -- use the immersive engineering shovel instead
recipes.remove(<railcraft:manipulator:3>);
recipes.addShaped(<railcraft:manipulator:3>, [
    [<ore:ingotSteel>, <ore:dustRedstone>, <ore:ingotSteel>],
    [<ore:dustRedstone>, <railcraft:manipulator:1>, <ore:dustRedstone>],
    [<ore:ingotSteel>, <immersiveengineering:shovel_steel>, <ore:ingotSteel>],
]);

# Boiler Fuels -- adjust to match capabilities across all mods
FluidFuels.removeAll();
FluidFuels.add(<liquid:creosote>, 4000);
FluidFuels.add(<liquid:plantoil>, 8000);
FluidFuels.add(<liquid:oil>, 16000);
FluidFuels.add(<liquid:ethanol>, 24000);
FluidFuels.add(<liquid:bio.ethanol>, 32000);
FluidFuels.add(<liquid:gasoline>, 48000);
FluidFuels.add(<liquid:biodiesel>, 64000);
FluidFuels.add(<liquid:diesel>, 96000);


# FluidFuels.add(ILiquidStack fuel, optional int heatPerBucket);
#
# FluidFuels.remove(ILiquidStack fuel);
#

# Bushing -- Only allow brass bushings
var bushing = <railcraft:gear:3>;
recipes.remove(bushing);
recipes.addShaped(bushing * 4, [
    [<ore:ingotBrass>, <ore:ingotBrass>],
    [<ore:ingotBrass>, <ore:ingotBrass>],
]);

# Carts -- allow unpacking all kinds of carts
recipes.addShapeless(<minecraft:hopper>, [<minecraft:hopper_minecart>.transformReplace(<minecraft:minecart>)]);
recipes.addShapeless(<forestry:bee_house>, [<forestry:cart.beehouse:0>.transformReplace(<minecraft:minecart>)]);
recipes.addShapeless(<forestry:apiary>, [<forestry:cart.beehouse:1>.transformReplace(<minecraft:minecart>)]);
recipes.addShapeless(<railcraft:tank_iron_gauge>, [<railcraft:cart_tank>.transformReplace(<minecraft:minecart>)]);
recipes.addShapeless(<immersiveengineering:metal_device0:1>, [
    <railcraft:cart_redstone_flux>.transformReplace(<minecraft:minecart>)
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

# Cobblestone -- allow using IE Crusher to obtain the various specialty cobblestones
for brickItem in RAILCRAFT_BRICKS {
    var bricksEntry = oreDict.get(brickItem.definition.id ~ "_brick");
    bricksEntry.add(
        brickItem.definition.makeStack(0),
        brickItem.definition.makeStack(1),
        brickItem.definition.makeStack(2),
        brickItem.definition.makeStack(3),
        brickItem.definition.makeStack(4)
    );

    val cobblestoneItem = brickItem.definition.makeStack(5);

    Crusher.addRecipe(cobblestoneItem, bricksEntry, 4096);
    Crusher.addRecipe(<minecraft:gravel>, cobblestoneItem, 4096);
}
Crusher.addRecipe(<railcraft:brick_andesite:5>, <ore:stoneAndesite>, 4096);
Crusher.addRecipe(<railcraft:brick_diorite:5>, <ore:stoneDiorite>, 4096);
Crusher.addRecipe(<railcraft:brick_granite:5>, <ore:stoneGranite>, 4096);

# Crushed Obsidian -- Add recipe for crushed obsidian
Crusher.removeRecipe(<railcraft:dust:0>);
Crusher.addRecipe(<railcraft:generic:7>, <ore:obsidian>, 4096);
Crusher.addRecipe(<railcraft:dust:0> * 4, <railcraft:generic:7>, 4096);

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

# Gift Cart -- add missing recipe
recipes.addShaped(<railcraft:cart_gift>, [
    [<ore:dyeYellow>, <ore:paper>, <ore:dyeRed>],
    [<ore:slabWood>, <minecraft:chest>, <ore:slabWood>],
    [<ore:slabWood>, <ore:slabWood>, <ore:slabWood>],
]);

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

# Pumpkin Cart -- add missing recipe
recipes.addShaped(<railcraft:cart_pumpkin>, [
    [<ore:slabWood>, <minecraft:pumpkin>, <ore:slabWood>],
    [<ore:slabWood>, <ore:slabWood>, <ore:slabWood>],
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
]);

# Redstone Flux Cart -- change recipe to me more compatible
recipes.remove(<railcraft:cart_redstone_flux>);
recipes.addShaped(<railcraft:cart_redstone_flux>, [
    [<immersiveengineering:metal_device0:1>],
    [<minecraft:minecart>],
]);

# Reinforced Concrete -- remove all colored recipes
for meta in 0 .. 16 {
    recipes.remove(<railcraft:reinforced_concrete>.definition.makeStack(meta));
}
recipes.addShaped(<railcraft:reinforced_concrete:8> * 8, [
    [<railcraft:concrete>, <railcraft:rebar>, <railcraft:concrete>],
    [<railcraft:rebar>, WATER_ITEM, <railcraft:rebar>],
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
    [<minecraft:glass>, WATER_ITEM, <minecraft:glass>],
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

# Turbine -- make recipe more compatible with IE
val HEAVY_ENG_BLOCK = <immersiveengineering:metal_decoration0:5>;
val GENERATOR_BLOCK = <immersiveengineering:metal_decoration0:6>;
val RADIATOR_BLOCK = <immersiveengineering:metal_decoration0:7>;
val STEEL_ROD = <ore:stickSteel>;
val FLUID_PIPE = <immersiveengineering:metal_device1:6>;
val STEEL_PLATE = <ore:plateSteel>;
recipes.remove(<railcraft:steam_turbine>);
recipes.addShaped(<railcraft:steam_turbine> * 3, [
    [STEEL_PLATE, RADIATOR_BLOCK, STEEL_PLATE],
    [GENERATOR_BLOCK, STEEL_ROD, GENERATOR_BLOCK],
    [STEEL_PLATE, HEAVY_ENG_BLOCK, FLUID_PIPE],
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
