import crafttweaker.item.IItemStack;
import mods.jei.JEI;


# Helper Functions #####################################################################################################

function makeSeed(plant as string) as IItemStack {
    var result = <agricraft:agri_seed>.withTag({
        agri_seed: plant,
        agri_analyzed: 0 as byte,
        agri_strength: 1 as byte,
        agri_gain: 1 as byte,
        agri_growth: 1 as byte,
    });

    return result;
}


# Seeds ################################################################################################################

var alliumSeed = makeSeed("vanilla:allium_plant");
var blueOrchidSeed = makeSeed("vanilla:orchid_plant");
var cactusSeed = makeSeed("vanilla:cactus_plant");
var carrotSeed = makeSeed("vanilla:carrot_plant");
var daisySeed = makeSeed("vanilla:daisy_plant");
var dandelionSeed = makeSeed("vanilla:dandelion_plant");
var orangeTulipSeed = makeSeed("vanilla:orange_tulip_plant");
var pinkTulipSeed = makeSeed("vanilla:pink_tulip_plant");
var poppySeed = makeSeed("vanilla:poppy_plant");
var potatoSeed = makeSeed("vanilla:potato_plant");
var sugarCaneSeed = makeSeed("vanilla:sugarcane_plant");
var redTulipSeed = makeSeed("vanilla:red_tulip_plant");
var whiteTulipSeed = makeSeed("vanilla:white_tulip_plant");

var netherSpores = makeSeed("vanilla:nether_wart_plant");
var brownMushroomSpores = makeSeed("vanilla:brown_mushroom_plant");
var redMushroomSpores = makeSeed("vanilla:red_mushroom_plant");


# Recipe Adjustments ###################################################################################################

# Clipper -- allow any tool metal
recipes.remove(<agricraft:clipper>);
recipes.addShaped(<agricraft:clipper>, [
    [null, <ore:toolMetalIngot>, null],
    [<ore:stickWood>, <minecraft:shears> | <railcraft:tool_shears_steel>, null],
    [null, <ore:stickWood>],
]);

# Gardening Trowel -- allow any tool metal
recipes.remove(<agricraft:trowel>);
recipes.addShaped(<agricraft:trowel>, [
    [null, null, <ore:stickWood>],
    [<ore:toolMetalIngot>, <ore:toolMetalIngot>, null],
]);

# Peripheral -- remove advanced technology
JEI.removeAndHide(<agricraft:peripheral>);

# Iron Hand Rake -- use sticks for the handle
recipes.remove(<agricraft:rake:1>);
recipes.addShaped(<agricraft:rake:1>, [
    [<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>],
    [null, <ore:stickWood>, null],
    [null, <ore:stickWood>, null],
]);

# Seeds -- add receipes for vanilla crop seeds
recipes.addShapeless(<minecraft:beetroot_seeds> * 2, [<minecraft:beetroot>, <minecraft:beetroot>]);
recipes.addShapeless(alliumSeed * 2, [<minecraft:red_flower:2>, <minecraft:red_flower:2>]);
recipes.addShapeless(blueOrchidSeed * 2, [<minecraft:red_flower:1>, <minecraft:red_flower:1>]);
recipes.addShapeless(brownMushroomSpores * 2, [<minecraft:brown_mushroom>, <minecraft:brown_mushroom>]);
recipes.addShapeless(cactusSeed * 2, [<minecraft:cactus>, <minecraft:cactus>]);
recipes.addShapeless(carrotSeed * 2, [<minecraft:carrot>, <minecraft:carrot>]);
recipes.addShapeless(daisySeed * 2, [<minecraft:red_flower:8>, <minecraft:red_flower:8>]);
recipes.addShapeless(dandelionSeed * 2, [<minecraft:yellow_flower>, <minecraft:yellow_flower>]);
recipes.addShapeless(netherSpores * 2, [<minecraft:nether_wart>, <minecraft:nether_wart>]);
recipes.addShapeless(orangeTulipSeed * 2, [<minecraft:red_flower:5>, <minecraft:red_flower:5>]);
recipes.addShapeless(pinkTulipSeed * 2, [<minecraft:red_flower:7>, <minecraft:red_flower:7>]);
recipes.addShapeless(poppySeed * 2, [<minecraft:red_flower:0>, <minecraft:red_flower:0>]);
recipes.addShapeless(potatoSeed * 2, [<minecraft:potato>, <minecraft:potato>]);
recipes.addShapeless(redMushroomSpores * 2, [<minecraft:red_mushroom>, <minecraft:red_mushroom>]);
recipes.addShapeless(redTulipSeed * 2, [<minecraft:red_flower:4>, <minecraft:red_flower:4>]);
recipes.addShapeless(sugarCaneSeed * 2, [<minecraft:reeds>, <minecraft:reeds>]);
recipes.addShapeless(whiteTulipSeed * 2, [<minecraft:red_flower:6>, <minecraft:red_flower:6>]);
