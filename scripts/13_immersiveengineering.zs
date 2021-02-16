import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.immersiveengineering.Squeezer;


########################################################################################################################

var inputDictEntries = [] as IOreDictEntry[];
var inputItems = [] as IItemStack[];


########################################################################################################################

# Cactus -- Add recipe for water from Cactus
Squeezer.addRecipe(<minecraft:dye:2>, <liquid:water> * 512, <minecraft:cactus>, 1024);

# HOP Graphite Dust -- Fix recipe for HOP Graphite Dust
Squeezer.removeItemRecipe(<immersiveengineering:material:18>);
Squeezer.addRecipe(
    <immersiveengineering:material:18>,
    <liquid:creosote> * 10,
    <immersiveengineering:material:17> * 8,
    19280
);

# Seed Oil -- Add recipes for Forestry Seed Oil
for itemStack in <ore:listAllseed>.items {
    Squeezer.addRecipe(<harvestcraft:grainbaititem>, <liquid:seed.oil> * 80, itemStack * 8, 51200);
}

# Sulfur Dust -- Allow any sulfur dust to be converted to Immersive Engineering sulfur dust
recipes.addShapeless(<immersiveengineering:material:25>, [<ore:dustSulfur>]);
