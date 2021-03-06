import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import mods.immersiveengineering.Crusher;
import mods.immersiveengineering.MetalPress;
import mods.immersiveengineering.Squeezer;


########################################################################################################################

val WATER_ITEM as IIngredient =
    <minecraft:water_bucket> | <claybucket:claybucket:1> |
    <forge:bucketfilled>.withTag({FluidName: "water", Amount: 1000}) |
    <forestry:can:1>.withTag({Fluid: {FluidName: "water", Amount: 1000}}) |
    <forestry:refractory:1>.withTag({Fluid: {FluidName: "water", Amount: 1000}}) |
    <forestry:capsule:1>.withTag({Fluid: {FluidName: "water", Amount: 1000}});


########################################################################################################################

# Bone Meal -- change recipes to require some machinery
recipes.remove(<minecraft:dye:15>);
recipes.addShapeless(<minecraft:dye:15> * 3, [<ore:toolMortarandpestle>, <minecraft:bone>]);
Crusher.addRecipe(<minecraft:dye:15> * 18, <minecraft:bone_block>, 2048);

# Bucket -- add alternate recipes metal buckets
recipes.remove(<minecraft:bucket>);
recipes.addShaped(<minecraft:bucket>, [
    [<ore:itemMetalIngot>, null, <ore:itemMetalIngot>],
    [null, <ore:itemMetalIngot>, null],
]);

# Cauldron -- allow any tool metal
recipes.remove(<minecraft:cauldron>);
recipes.addShaped(<minecraft:cauldron>, [
    [<ore:cookwareMetalIngot>, null, <ore:cookwareMetalIngot>],
    [<ore:cookwareMetalIngot>, null, <ore:cookwareMetalIngot>],
    [<ore:cookwareMetalIngot>, <ore:cookwareMetalIngot>, <ore:cookwareMetalIngot>],
]);

# Clay -- add recipe for making clay
recipes.addShaped(<minecraft:clay> * 6, [
    [<ore:sand>, WATER_ITEM, <ore:dirt>],
    [<ore:sand>, null, <ore:dirt>],
    [<ore:sand>, WATER_ITEM, <ore:dirt>],
]);

# Charcoal -- remove recipes in favor of Forestry charcoal pile
furnace.remove(<minecraft:coal:1>);

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
recipes.addShapeless(<minecraft:gunpowder> * 4, [
    carbon, <ore:dustSulfur>, <ore:dustSaltpeter>, <ore:dustSaltpeter>
]);

# Hopper -- allow any tool metal
recipes.remove(<minecraft:hopper>);
recipes.addShaped(<minecraft:hopper>, [
    [<ore:toolMetalIngot>, null, <ore:toolMetalIngot>],
    [<ore:toolMetalIngot>, <ore:chestWood>, <ore:toolMetalIngot>],
    [null, <ore:toolMetalIngot>, null],
]);

# Ice -- allow packing snow blocks in a press
MetalPress.addRecipe(<minecraft:ice>, <minecraft:snow>, <immersiveengineering:mold:5>, 1024, 4);

# Iron Bars -- use Iron Rods instead of ingots
recipes.remove(<minecraft:iron_bars>);
recipes.addShaped(<minecraft:iron_bars> * 8, [
    [<ore:stickIron>, <ore:stickIron>, <ore:stickIron>],
    [<ore:stickIron>, <ore:stickIron>, <ore:stickIron>],
]);

# Iron Nugget -- use the ore dictionary instead
recipes.replaceAllOccurences(<minecraft:iron_nugget>, <ore:itemMetalNugget>, <*>.only(function(itemStack) {
    return true;
}));

# Lava -- squeeze magma blocks to get lava
Squeezer.addRecipe(<minecraft:stone>, <liquid:lava> * 250, <minecraft:magma>, 8192);

# Magma Block -- only allow creating magma blocks by packing magma creams
recipes.remove(<minecraft:magma>);
MetalPress.addRecipe(<minecraft:magma>, <minecraft:magma_cream>, <immersiveengineering:mold:5>, 2048, 4);

# Magma Cream -- allow crushing magma back to magma creams
Crusher.addRecipe(<minecraft:magma_cream> * 3, <minecraft:magma>, 4096, <minecraft:magma_cream>, 0.5);

# Packed Ice -- allow packing ice blocks in a press
MetalPress.addRecipe(<minecraft:packed_ice>, <minecraft:ice>, <immersiveengineering:mold:5>, 4096, 4);

# Piston -- allow any tool metal
recipes.remove(<minecraft:piston>);
recipes.addShaped(<minecraft:piston>, [
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
    [<ore:cobblestone>, <ore:toolMetalIngot>, <ore:cobblestone>],
    [<ore:cobblestone>, <ore:dustRedstone>, <ore:cobblestone>],
]);

# Prismarine Shard -- add Pulverizer recipe to get shards from blocks
Crusher.addRecipe(<minecraft:prismarine_shard> * 3, <minecraft:prismarine:0>, 2048, <minecraft:prismarine_shard>, 0.25);
Crusher.addRecipe(<minecraft:prismarine_shard> * 8, <minecraft:prismarine:1>, 2048, <minecraft:prismarine_shard>, 0.25);

# Rabbit Skin -- change name to match its use
<minecraft:rabbit_hide>.displayName = "Small Hide";

# Saddle -- add alternate recipes using various metals
recipes.remove(<minecraft:saddle>);
recipes.addShaped(<minecraft:saddle>, [
    [<ore:leather>, <ore:leather>, <ore:leather>],
    [<ore:leather>, <ore:decorativeMetalIngot>, <ore:leather>],
    [<ore:itemMetalIngot>, null, <ore:itemMetalIngot>],
]);

# Sandstone -- remove crafting table recipe
recipes.remove(<minecraft:red_sandstone>);
MetalPress.addRecipe(<minecraft:red_sandstone>, <minecraft:sand:1>, <immersiveengineering:mold:5>, 1024, 4);
recipes.remove(<minecraft:sandstone:0>);
MetalPress.addRecipe(<minecraft:sandstone:0>, <minecraft:sand:0>, <immersiveengineering:mold:5>, 1024, 4);

# Seed -- create seed from wheat and rename
<minecraft:wheat_seeds>.displayName = "Wheat Seeds";
recipes.addShapeless(<minecraft:wheat_seeds> * 2, [<minecraft:wheat>, <minecraft:wheat>]);

# Shears -- allow shears from any bronze or iron
val SHEARS_METAL = <ore:ingotIron> | <ore:ingotBronze>;
recipes.remove(<minecraft:shears>);
recipes.addShaped(<minecraft:shears>, [
    [null, SHEARS_METAL],
    [SHEARS_METAL, null],
]);

# Shield -- allow any tool metal
recipes.remove(<minecraft:shield>);
recipes.addShaped(<minecraft:shield>, [
    [<ore:plankWood>, <ore:itemMetalIngot>, <ore:plankWood>],
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
    [null, <ore:plankWood>, null],
]);

# String -- allow early-game recipe for making string from wool
recipes.addShapeless(<minecraft:string> * 2, [<agricraft:rake:0>.reuse(), <ore:blockWool>]);
recipes.addShapeless(<minecraft:string> * 3, [<agricraft:rake:1>.reuse(), <ore:blockWool>]);

# Torch -- add easier early-game recipe which doesn't require charcoal
recipes.remove(<minecraft:torch>);
recipes.addShaped(<minecraft:torch> * 2, [
    [<ore:blockWool>],
    [<ore:stickWood>]
]);
recipes.addShaped(<minecraft:torch> * 3, [
    [<ore:itemBeeswax>],
    [<ore:itemBeeswax>],
    [<ore:stickWood>]
]);
recipes.addShaped(<minecraft:torch> * 4, [
    [<betteranimalsplus:blubber> | <ore:coal> | <ore:charcoal>],
    [<ore:stickWood>],
]);
recipes.addShaped(<minecraft:torch> * 6, [
    [
        <forestry:can:1>.withTag({Fluid: {FluidName: "creosote", Amount: 1000}}) |
        <forestry:refractory:1>.withTag({Fluid: {FluidName: "creosote", Amount: 1000}}) |
        <forestry:capsule:1>.withTag({Fluid: {FluidName: "creosote", Amount: 1000}}) |
        <railcraft:fluid_bottle_creosote> |
        <forge:bucketfilled>.withTag({FluidName: "creosote", Amount: 1000})

    ],
    [<ore:blockWool>],
    [<ore:stickWood>],
]);
recipes.addShaped(<minecraft:torch> * 8, [
    [<ore:fuelCoke>],
    [<ore:stickWood>],
]);

# Tripwire Hook -- allow any item metal
recipes.remove(<minecraft:tripwire_hook>);
recipes.addShaped(<minecraft:tripwire_hook>, [
    [<ore:itemMetalIngot>],
    [<ore:stickWood>],
    [<ore:plankWood>],
]);
