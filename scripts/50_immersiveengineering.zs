import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.immersiveengineering.Crusher;
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

# Iron Grit -- allow getting iron grit from red sandstone
Crusher.addRecipe(<minecraft:sand:1> * 2, <ore:sandstoneRed>, 2048, <immersiveengineering:metal:18>, 0.1);

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

# Sand -- remove recipes for making sand from colored glass
Crusher.removeRecipe(<minecraft:sand>);
Crusher.addRecipe(<minecraft:sand>, <ore:gravel>, 4096);
Crusher.addRecipe(<minecraft:sand>, <ore:blockGlassColorless>, 4096);
Crusher.addRecipe(<minecraft:sand> * 2, <ore:sandstone>, 4096, <immersiveengineering:material:24>, 0.5);

# Seed Oil -- Add recipes for Forestry Seed Oil
for itemStack in <ore:listAllseed>.items {
    Squeezer.addRecipe(<harvestcraft:grainbaititem>, <liquid:seed.oil> * 80, itemStack * 8, 51200);
}

# Sulfur Dust -- Allow any sulfur dust to be converted to Immersive Engineering sulfur dust
recipes.addShapeless(<immersiveengineering:material:25>, [<ore:dustSulfur>]);

# Terracotta -- allow crushing back to clay
Crusher.addRecipe(<minecraft:clay_ball> * 4, <minecraft:hardened_clay>, 2048);
