import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.immersiveengineering.Crusher;
import mods.immersiveengineering.Excavator;
import mods.immersiveengineering.Squeezer;


########################################################################################################################

val crushingHammer = <engineerstools:crushing_hammer>;


########################################################################################################################

# Cactus -- Add recipe for water from Cactus
Squeezer.addRecipe(<minecraft:dye:2>, <liquid:water> * 512, <minecraft:cactus>, 1024);

# Coke Dust -- add recipe using crushing hammer
recipes.addShapeless(<immersiveengineering:material:17>, [
    <ore:fuelCoke>,
    crushingHammer.anyDamage().transformDamage(2).reuse()
]);

# Conveyor Belts -- allow breaking up combined conveyor belts
# recipes.addShapeless(<minecraft:hopper>, [<minecraft:hopper_minecart>.transformReplace(<minecraft:minecart>)]);
val steelScaffold = <immersiveengineering:metal_decoration1:1>;

val basicConveyor = <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"});
val basicCoveredConveyor = <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:covered"});
recipes.addShapeless(steelScaffold, [basicCoveredConveyor.transformReplace(basicConveyor)]);

val dropperConveyor = <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:dropper"});
val dropperCoveredConveyor = <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:droppercovered"});
recipes.addShapeless(steelScaffold, [dropperCoveredConveyor.transformReplace(dropperConveyor)]);

val extractConveyor = <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:extract"});
val extractCoveredConveyor = <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:extractcovered"});
recipes.addShapeless(steelScaffold, [extractCoveredConveyor.transformReplace(extractConveyor)]);

val verticalConveyor = <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:vertical"});
val verticalCoveredConveyor = <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:verticalcovered"});
recipes.addShapeless(steelScaffold, [verticalCoveredConveyor.transformReplace(verticalConveyor)]);

# Engineering Hammer -- Add more forgiving recipes
recipes.remove(<immersiveengineering:tool:0>);
recipes.addShaped(<immersiveengineering:tool:0>, [
    [null, <ore:toolMetalIngot>, <ore:string>],
    [null, <ore:stickWood>, <ore:toolMetalIngot>],
    [<ore:stickWood>, null, null],
]);

# Engineer's Wire Cutters -- allow any tool metal
recipes.remove(<immersiveengineering:tool:1>);
recipes.addShaped(<immersiveengineering:tool:1>, [
    [<ore:stickWood>, <ore:toolMetalIngot>, null],
    [null, <ore:stickWood>, null],
]);

# Fluid Pipe -- allow creating pipes from various metals
recipes.remove(<immersiveengineering:metal_device1:6>);
var plate = <ore:plateAluminum> | <ore:plateCopper> | <ore:plateTin>;
recipes.addShaped(<immersiveengineering:metal_device1:6> * 6, [
    [plate, plate, plate],
    [null, null, null],
    [plate, plate, plate],
]);
plate = <ore:plateBronze> | <ore:plateIron> | <ore:plateNickel>;
recipes.addShaped(<immersiveengineering:metal_device1:6> * 8, [
    [plate, plate, plate],
    [null, null, null],
    [plate, plate, plate],
]);
plate = <ore:plateSteel>;
recipes.addShaped(<immersiveengineering:metal_device1:6> * 12, [
    [plate, plate, plate],
    [null, null, null],
    [plate, plate, plate],
]);

# HOP Graphite Dust -- Fix recipe for HOP Graphite Dust
Squeezer.removeItemRecipe(<immersiveengineering:material:18>);
Squeezer.addRecipe(
    <immersiveengineering:material:18>,
    <liquid:creosote> * 10,
    <immersiveengineering:material:17> * 8,
    19280
);

# Lantern -- replace with non-oredicted items
recipes.remove(<immersiveengineering:metal_decoration2:4>);
recipes.addShaped(<immersiveengineering:metal_decoration2:4> * 3, [
    [null, <ore:plateIron>, null],
    [<minecraft:glass_pane>, <minecraft:glowstone>, <minecraft:glass_pane>],
    [null, <ore:plateIron>, null],
]);

# Powered Lantern -- replace with non-oredicted recipe
recipes.remove(<immersiveengineering:metal_device1:4>);
recipes.addShaped(<immersiveengineering:metal_device1:4>, [
    [null, <ore:plateIron>, null],
    [<minecraft:glass_pane>, <ore:electronTube>, <minecraft:glass_pane>],
    [<ore:plateIron>, <ore:dustRedstone>, <ore:plateIron>],
]);

# Sand, Red -- allow getting iron grit from red sandstone
Crusher.removeRecipe(<minecraft:sand:1>);
Crusher.addRecipe(<minecraft:sand:1> * 2, <ore:sandstoneRed>, 2048, <immersiveengineering:metal:18>, 0.1);

# Sand, Yellow -- remove recipes for making sand from various things
Crusher.removeRecipe(<minecraft:sand:0>);
Crusher.addRecipe(<minecraft:sand:0>, <ore:gravel>, 4096);
Crusher.addRecipe(<minecraft:sand:0>, <ore:blockGlassColorless>, 4096);
Crusher.addRecipe(<minecraft:sand:0> * 2, <ore:sandstoneYellow>, 4096, <immersiveengineering:material:24>, 0.5);

# Seed Oil -- Add recipes for Forestry Seed Oil
for itemStack in <ore:listAllseed>.items {
    Squeezer.addRecipe(<harvestcraft:grainbaititem>, <liquid:seed.oil> * 80, itemStack * 8, 51200);
}

# Sulfur Dust -- Allow any sulfur dust to be converted to Immersive Engineering sulfur dust
recipes.addShapeless(<immersiveengineering:material:25>, [<ore:dustSulfur>]);

# Terracotta -- allow crushing back to clay
Crusher.addRecipe(<minecraft:clay_ball> * 4, <minecraft:hardened_clay>, 2048);


########################################################################################################################

Excavator.removeMineral("Bauxite");
Excavator.removeMineral("Cassiterite");
Excavator.removeMineral("Coal");
Excavator.removeMineral("Copper");
Excavator.removeMineral("Cinnabar");
Excavator.removeMineral("Silt");
Excavator.removeMineral("Galena");
Excavator.removeMineral("Gold");
Excavator.removeMineral("Iron");
Excavator.removeMineral("Lapis");
Excavator.removeMineral("Lead");
Excavator.removeMineral("Magnetite");
Excavator.removeMineral("Nickel");
Excavator.removeMineral("Pyrite");
Excavator.removeMineral("Quartzite");
Excavator.removeMineral("Silver");
Excavator.removeMineral("Uranium");

Excavator.addMineral("Tin", 87, 0, ["cobblestone", "oreTin", "oreApatite"], [96.5, 2, 1.5], [0]);
Excavator.addMineral("Copper", 54, 0, ["cobblestone", "stoneAndesite", "oreCopper"], [78, 20, 2], [0]);
Excavator.addMineral("Coal", 33, 0, ["cobblestone", "blockBasalt", "oreCoal", "blockDiamondOre"], [76, 20, 3.8, 0.2], [0]);
Excavator.addMineral("Zinc", 21, 0, ["cobblestone", "oreZinc", "blockEmeraldOre"], [97.7, 2, 0.3], [0]);
Excavator.addMineral("Lead", 13, 0, ["cobblestone", "stoneQuarried", "oreLead", "blockLapisOre"], [77.7, 20, 2, 0.3], [0]);
Excavator.addMineral("Iron", 8, 0, ["cobblestone", "blockMarble", "oreIron", "oreSilver"], [77.7, 20, 2, 0.3], [0]);
Excavator.addMineral("Nickel", 5, 0, ["cobblestone", "stoneDiorite", "oreNickel"], [78, 20, 2], [0]);
Excavator.addMineral("Aluminum", 3, 0, ["cobblestone", "stoneGranite", "oreAluminum", "oreRedstone"], [77.7, 20, 2, 0.3], [0]);
Excavator.addMineral("Gold", 2, 0, ["cobblestone", "oreGold", ], [98.5, 1.5], [0]);
Excavator.addMineral("Uranium", 1, 0, ["cobblestone", "stoneAbyssal", "oreUranium"], [78, 20, 2], [0]);
Excavator.addMineral("Nether", 1, 0, ["cobblestone", "netherrack", "oreQuartz", "blockGlowstone", "blockSoulSand"], [50, 46.7, 2, 1, 0.3], [0]);

# Excavator.addMineral(
#     String name,
#     int mineralWeight,
#     double failChance,
#     String[] ores,
#     double[] chances,
#     @Optional int[] dimensionWhitelist,
#     @Optional boolean blacklist
# );
