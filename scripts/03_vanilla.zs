import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;


########################################################################################################################

# Bucket -- add alternate recipes metal buckets
recipes.remove(<minecraft:bucket>);
recipes.addShaped(<minecraft:bucket>, [
    [<ore:itemMetalIngot>, null, <ore:itemMetalIngot>],
    [null, <ore:itemMetalIngot>, null],
]);

# Compass -- make a much easier recipe for early-game use
<minecraft:compass>.displayName = "Compass";
recipes.remove(<minecraft:compass>);
recipes.addShaped(<minecraft:compass>, [
    [null, <ore:itemMetalIngot>, null],
    [<ore:itemMetalIngot>, <ore:nuggetIron>, <ore:itemMetalIngot>],
    [null, <ore:itemMetalIngot>, null],
]);

# Gunpowder -- simplify recipes down to a single ore-dicted option
var carbon = <ore:dustCharcoal> | <ore:dustCoal>;
recipes.remove(<minecraft:gunpowder>);
recipes.addShapeless(<minecraft:gunpowder>, [
    carbon, <ore:dustSulfur>, <ore:dustSaltpeter>, <ore:dustSaltpeter>
]);

# Iron Bars -- use Iron Rods instead of ingots
recipes.remove(<minecraft:iron_bars>);
recipes.addShaped(<minecraft:iron_bars> * 8, [
    [<ore:stickIron>, <ore:stickIron>, <ore:stickIron>],
    [<ore:stickIron>, <ore:stickIron>, <ore:stickIron>],
]);


# Prismarine Shard -- add Pulverizer recipe to get shards from blocks
# TODO: convert these into recipes for the IE crusher
# Pulverizer.addRecipe(
#     <minecraft:prismarine_shard> * 3,
#     <minecraft:prismarine:0>,
#     4000,
#     <minecraft:prismarine_shard>,
#     50
# );
# Pulverizer.addRecipe(
#     <minecraft:prismarine_shard> * 8,
#     <minecraft:prismarine:1>,
#     4000,
#     <minecraft:prismarine_shard>,
#     50
# );


# Saddle -- add alternate recipes using various metals
recipes.remove(<minecraft:saddle>);
recipes.addShaped(<minecraft:saddle>, [
    [<ore:leather>, <ore:leather>, <ore:leather>],
    [<ore:leather>, <ore:decorativeMetalIngot>, <ore:leather>],
    [<ore:itemMetalIngot>, null, <ore:itemMetalIngot>],
]);

# Seed -- create seed from wheat and rename
<minecraft:wheat_seeds>.displayName = "Wheat Seeds";
recipes.addShapeless(<minecraft:wheat_seeds> * 2, [<minecraft:wheat>, <minecraft:wheat>]);

# Rabbit Skin -- change name to match its use
<minecraft:rabbit_hide>.displayName = "Small Hide";
