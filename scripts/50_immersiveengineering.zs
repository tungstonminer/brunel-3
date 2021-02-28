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

# Sand -- remove recipes for making sand from colored glass
Crusher.removeRecipe(<minecraft:sand>);
Crusher.addRecipe(<minecraft:sand>, <ore:gravel>, 4096);
Crusher.addRecipe(<minecraft:sand>, <ore:itemSlag>, 4096);
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
