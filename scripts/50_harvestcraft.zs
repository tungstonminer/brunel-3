import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.harvestcrafttweaker.HarvestCraftTweaker as HCT;
import mods.immersiveengineering.Crusher;
import mods.immersiveengineering.Squeezer;
import mods.jei.JEI;


########################################################################################################################

HCT.clearAllPressing();
HCT.clearAllGrinding();

val MILK_CONTAINER as IIngredient =
    <minecraft:milk_bucket> |
    <forge:bucketfilled>.withTag({FluidName: "milk_holstein", Amount: 1000}) |
    <forge:bucketfilled>.withTag({FluidName: "milk_friesian", Amount: 1000}) |
    <forge:bucketfilled>.withTag({FluidName: "milk_jersey", Amount: 1000}) |
    <forge:bucketfilled>.withTag({FluidName: "milk_goat", Amount: 1000}) |
    <forge:bucketfilled>.withTag({FluidName: "milk_sheep", Amount: 1000}) |
    <forestry:can:1>.withTag({Fluid: {FluidName: "milk_holstein", Amount: 1000}}) |
    <forestry:can:1>.withTag({Fluid: {FluidName: "milk_friesian", Amount: 1000}}) |
    <forestry:can:1>.withTag({Fluid: {FluidName: "milk_jersey", Amount: 1000}}) |
    <forestry:can:1>.withTag({Fluid: {FluidName: "milk_goat", Amount: 1000}}) |
    <forestry:can:1>.withTag({Fluid: {FluidName: "milk_sheep", Amount: 1000}}) |
    <forestry:refractory:1>.withTag({Fluid: {FluidName: "milk_holstein", Amount: 1000}}) |
    <forestry:refractory:1>.withTag({Fluid: {FluidName: "milk_friesian", Amount: 1000}}) |
    <forestry:refractory:1>.withTag({Fluid: {FluidName: "milk_jersey", Amount: 1000}}) |
    <forestry:refractory:1>.withTag({Fluid: {FluidName: "milk_goat", Amount: 1000}}) |
    <forestry:refractory:1>.withTag({Fluid: {FluidName: "milk_sheep", Amount: 1000}}) |
    <forestry:capsule:1>.withTag({Fluid: {FluidName: "milk_holstein", Amount: 1000}}) |
    <forestry:capsule:1>.withTag({Fluid: {FluidName: "milk_friesian", Amount: 1000}}) |
    <forestry:capsule:1>.withTag({Fluid: {FluidName: "milk_jersey", Amount: 1000}}) |
    <forestry:capsule:1>.withTag({Fluid: {FluidName: "milk_goat", Amount: 1000}}) |
    <forestry:capsule:1>.withTag({Fluid: {FluidName: "milk_sheep", Amount: 1000}});


########################################################################################################################

# Bakeware -- replace with more generic recipe
recipes.remove(<harvestcraft:bakewareitem>);
recipes.addShaped(<harvestcraft:bakewareitem>, [
    [<ore:ingotBrick>, <ore:ingotBrick>, <ore:ingotBrick>],
    [<ore:ingotBrick>, null,  <ore:ingotBrick>],
    [<ore:ingotBrick>, <ore:ingotBrick>, <ore:ingotBrick>],
]);

# Bait -- don't allow simple crafting of bait
recipes.remove(<harvestcraft:fruitbaititem>);
recipes.remove(<harvestcraft:grainbaititem>);
recipes.remove(<harvestcraft:veggiebaititem>);

# Bees -- Remove bee-related products
JEI.removeAndHide(<harvestcraft:honey>);
JEI.removeAndHide(<harvestcraft:honeycomb>);
JEI.removeAndHide(<harvestcraft:honeycombitem>);
JEI.removeAndHide(<harvestcraft:honeyitem>);

# Black Pepper -- grind peppercorns to black pepper
HCT.addGrinding(<ore:cropPeppercorn>, <harvestcraft:blackpepperitem>, <harvestcraft:blackpepperitem>);

# Bubbly Water -- add presser recipe
HCT.addPressing(<harvestcraft:freshwateritem>, <harvestcraft:bubblywateritem>, <harvestcraft:bubblywateritem>);

# Cake -- only allow HC milk
recipes.remove(<minecraft:cake>);
recipes.addShaped(<minecraft:cake>, [
    [<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>],
    [<ore:listAllsugar>, <ore:egg>, <ore:listAllsugar>],
    [<ore:foodFlour>, <ore:foodFlour>, <ore:foodFlour>]
]);

# Candle -- replace white candle recipe
recipes.remove(<harvestcraft:candledeco1>);
recipes.addShapeless(<harvestcraft:candledeco1> * 4, [<ore:itemBeeswax>, <ore:string>]);

# Cheese -- remove in preference for the Animania process
JEI.removeAndHide(<harvestcraft:cheeseitem>);

# Cinnamon -- grind peppercorns to black pepper
HCT.addGrinding(<ore:cropCinnamon>, <harvestcraft:groundcinnamonitem>, <harvestcraft:groundcinnamonitem>);
recipes.addShapeless(<dynamictreesphc:cinnamonseed> * 2, [
    <dynamictrees:dirtbucket>.reuse(), <dynamictreesphc:nutmegseed>, <dynamictrees:oakseed>
]);

# Cooking Oil -- make recipes consistent with Plant Oil recipes
recipes.remove(<harvestcraft:oliveoilitem>);
HCT.addPressing(<ore:plantOilInput>, <harvestcraft:oliveoilitem>, <harvestcraft:grainbaititem>);

# Cotton Candy -- use pink dye instead of bone meal
recipes.remove(<harvestcraft:cottoncandyitem>);
recipes.addShapeless(<harvestcraft:cottoncandyitem>, [
    <ore:toolMixingbowl>, <ore:listAllsugar>, <ore:listAllwater>,
    <ore:cropCotton>, <ore:dyePink>, <ore:paper>
]);

# Cutting Board -- replace bricks(?!) and use metals
recipes.remove(<harvestcraft:cuttingboarditem>);
recipes.addShaped(<harvestcraft:cuttingboarditem>, [
    [<ore:bladeMetalIngot>, null, null],
    [null, <ore:stickWood>, null],
    [null, null, <ore:plankWood>],
]);

# Fish Bait -- replace recipe to use less string and require ground fish
recipes.remove(<harvestcraft:fishtrapbaititem>);
recipes.addShapeless(
    "fishtrapbait_replacement", <harvestcraft:fishtrapbaititem>,
    [<ore:string>, <harvestcraft:groundfishitem>]
);

# Flour -- allow griding grains to flour
HCT.addGrinding(<ore:listAllgrain>, <harvestcraft:flouritem>, <harvestcraft:flouritem>);

# Fresh Milk -- don't let people use a whole bucket when a quarter will do
<ore:listAllmilk>.remove(<minecraft:milk_bucket>);
recipes.remove(<harvestcraft:freshmilkitem>);
recipes.addShapeless(<harvestcraft:freshmilkitem> * 4, [MILK_CONTAINER]);

# Fresh Water -- only allow distilled water for food
val DIST_WATER = <liquid:dist_water>.name;
recipes.remove(<harvestcraft:freshwateritem>);
recipes.addShapeless(<harvestcraft:freshwateritem> * 4, [
    <forge:bucketfilled>.withTag({FluidName: DIST_WATER, Amount: 1000}) |
    <forestry:can:1>.withTag({Fluid: {FluidName: DIST_WATER, Amount: 1000}}) |
    <forestry:refractory:1>.withTag({Fluid: {FluidName: DIST_WATER, Amount: 1000}}) |
    <forestry:capsule:1>.withTag({Fluid: {FluidName: DIST_WATER, Amount: 1000}})
]);

# Ground Meats -- add back the recipes for ground meat
HCT.addGrinding(<ore:listAllbeefraw>, <harvestcraft:groundbeefitem>, <harvestcraft:groundbeefitem>);
HCT.addGrinding(<ore:listAllchickenraw>, <harvestcraft:groundchickenitem>, <harvestcraft:groundchickenitem>);
HCT.addGrinding(<ore:listAllduckraw>, <harvestcraft:groundduckitem>, <harvestcraft:groundduckitem>);
HCT.addGrinding(<ore:listAllfishraw>, <harvestcraft:groundfishitem>, <harvestcraft:groundfishitem>);
HCT.addGrinding(<ore:listAllmuttonraw>, <harvestcraft:groundmuttonitem>, <harvestcraft:groundmuttonitem>);
HCT.addGrinding(<ore:listAllporkraw>, <harvestcraft:groundporkitem>, <harvestcraft:groundporkitem>);
HCT.addGrinding(<ore:listAllrabbitraw>, <harvestcraft:groundrabbititem>, <harvestcraft:groundrabbititem>);
HCT.addGrinding(<ore:listAllturkeyraw>, <harvestcraft:groundturkeyitem>, <harvestcraft:groundturkeyitem>);
HCT.addGrinding(<ore:listAllvenisonraw>, <harvestcraft:groundvenisonitem>, <harvestcraft:groundvenisonitem>);

# Fruit Bait -- only allow catching a limited number of things
HCT.removeGroundTrapByInput(<harvestcraft:fruitbaititem>);
HCT.addGroundTrap(<harvestcraft:fruitbaititem>, [
    <animania:raw_peacock>, <animania:blue_peacock_feather>, <animania:white_peacock_feather>,
    <animania:charcoal_peacock_feather>, <animania:opal_peacock_feather>, <animania:peach_peacock_feather>,
    <animania:purple_peacock_feather>, <animania:taupe_peacock_feather>
] as IItemStack[]);

# Grain Bait -- only allow catching a limited number of things
HCT.removeGroundTrapByInput(<harvestcraft:grainbaititem>);
HCT.addGroundTrap(<harvestcraft:grainbaititem>, [
    <minecraft:chicken>, <minecraft:feather>, <harvestcraft:duckrawitem>, <betteranimalsplus:pheasantraw>
] as IItemStack[]);

# Veggie Bait -- only allow catching a limited number of things
HCT.removeGroundTrapByInput(<harvestcraft:veggiebaititem>);
HCT.addGroundTrap(<harvestcraft:veggiebaititem>, [
    <minecraft:rabbit_hide>, <minecraft:rabbit>, <minecraft:rabbit_foot>
] as IItemStack[]);

# Hazelnut -- add to ore dictionary
oreDict.get("listAllnut").add(<harvestcraft:hazelnutitem>);
oreDict.get("cropHazelnut").add(<harvestcraft:hazelnutitem>);

# Jellied Eel -- use ore dict for recipe
recipes.remove(<harvestcraft:jelliedeelitem>);
recipes.addShapeless(<harvestcraft:jelliedeelitem>, [
    <ore:toolSaucepan>, <ore:foodEelraw>, <ore:foodShrimpraw>,
    <ore:listAllwater>, <ore:foodVinegar>, <ore:foodGroundnutmeg>
]);

# Kale Seed -- allow crafting from kale
recipes.addShapeless(<harvestcraft:kaleseeditem>, [<harvestcraft:kaleitem>]);

# Market -- remove as there's no one out there to trade with
JEI.removeAndHide(<harvestcraft:market>);

# Maple Seeds
recipes.addShapeless(<dynamictreesphc:mapleseed> * 2, [
    <dynamictrees:dirtbucket>.reuse(), <dynamictreesphc:persimmonseed>, <dynamictrees:spruceseed>
]);

# Maple Syrup -- add to the all sugar list
oreDict.get("listAllsugar").add(<harvestcraft:maplesyrupitem>);

# Milk -- use the ore dictionary instead
recipes.replaceAllOccurences(<minecraft:milk_bucket>, MILK_CONTAINER, <*>.only(function(itemStack) {
    return true;
}));

# Nutella -- should be made with hazelnuts
recipes.remove(<harvestcraft:nutellaitem>);
recipes.addShapeless(<harvestcraft:nutellaitem>, [
    <ore:toolSaucepan>, <ore:foodChocolatebar>, <ore:cropHazelnut>
]);

# Nutmeg -- add back the recipes for grinding
HCT.addGrinding(<ore:cropNutmeg>, <harvestcraft:groundnutmegitem>, <harvestcraft:groundnutmegitem>);

# Omelette -- use Animania omelette as base
var denverOmelette = <harvestcraft:omeletitem>;
denverOmelette.displayName = "Denver Omelette";
recipes.remove(denverOmelette);
recipes.addShapeless(denverOmelette, [
    <ore:toolCuttingboard>, <animania:plain_omelette>, <ore:cropOnion>, <ore:cropBellpepper>
]);
recipes.remove(<harvestcraft:mushroomketchupomeletitem>);
recipes.addShapeless(<harvestcraft:mushroomketchupomeletitem>, [
    <animania:plain_omelette>, <ore:foodMushroomketchup>
]);

# Pemmican -- allow more food items as ingredients
recipes.remove(<harvestcraft:pemmicanitem>);
recipes.addShapeless(<harvestcraft:pemmicanitem>, [
    <ore:toolPot>, <ore:listAllnut>, <ore:listAllfruit>, <ore:listAllmeatcooked>, <ore:listAllsugar>
]);

# Pizza Slice -- remove strange recipe for pizza slices
recipes.removeByRecipeName("harvestcraft:berryvinaigrettesaladitem");

# Pumpkin Seeds -- make sure all pumpkin versions produce the same number of seeds
recipes.remove(<minecraft:pumpkin_seeds>);
recipes.addShapeless(<minecraft:pumpkin_seeds> * 8, [<ore:cropPumpkin>, <ore:cropPumpkin>]);

# Pot -- replace bricks(?!) and use metals
recipes.remove(<harvestcraft:potitem>);
recipes.addShaped(<harvestcraft:potitem>, [
    [<ore:stickWood>, <ore:cookwareMetalIngot>, <ore:cookwareMetalIngot>],
    [null, <ore:cookwareMetalIngot>, <ore:cookwareMetalIngot>],
]);

# Saucepan -- replace bricks(?!) and use metals
recipes.remove(<harvestcraft:saucepanitem>);
recipes.addShaped(<harvestcraft:saucepanitem>, [
    [<ore:cookwareMetalIngot>, null, null],
    [null, <ore:cookwareMetalIngot>, null],
    [null, null, <ore:stickWood>],
]);

# Salt -- remove the ability to craft salt from water
recipes.removeByRecipeName("harvestcraft:saltitem");

# Shipping Bin -- remove as there's no one out there to trade with
JEI.removeAndHide(<harvestcraft:shippingbin>);

# Skillet -- replace bricks(?!) and use metals
recipes.remove(<harvestcraft:skilletitem>);
recipes.addShaped(<harvestcraft:skilletitem>, [
    [null, <ore:cookwareMetalIngot>, null],
    [null, null,  <ore:stickWood>],
]);

# Seaweed -- add back the recipes for grinding
HCT.addGrinding(<ore:cropSeaweed>, <harvestcraft:saltitem>, <harvestcraft:veggiebaititem>);

# Sesame Seed Oil -- add presser recipe
HCT.addPressing(<ore:cropSesame>, <harvestcraft:sesameoilitem>, <harvestcraft:grainbaititem>);

# Sugar -- allow making sugar from maple syrup and beets
recipes.addShapeless(<minecraft:sugar>, [
    <ore:toolPot>.reuse(), <ore:cropMaplesyrup>
]);
recipes.addShapeless(<minecraft:sugar> * 2, [
    <ore:toolPot>.reuse(), <ore:cropBeet>, <ore:cropBeet>, <ore:cropBeet>, <ore:cropBeet>, <harvestcraft:freshwateritem>
]);

# Tofu -- add presser recipes
HCT.addPressing(<ore:cropSoybean>, <harvestcraft:silkentofuitem>, <harvestcraft:grainbaititem>);
HCT.addPressing(<ore:foodSilkentofu>, <harvestcraft:firmtofuitem>, <harvestcraft:soymilkitem>);

# Venison -- change name to horse meat
<harvestcraft:venisonrawitem>.displayName = "Raw Horse Meat";
<harvestcraft:venisoncookeditem>.displayName = "Cooked Horse Meat";
<harvestcraft:gourmetvenisonpattyitem>.displayName = "Gourmet Horse Patty";
<harvestcraft:groundvenisonitem>.displayName = "Ground Horse";
<harvestcraft:gourmetvenisonburgeritem>.displayName = "Gourmet Horse Burger";

# Water Filter -- replace with early-game-friendly recipe
recipes.remove(<harvestcraft:waterfilter>);
recipes.addShaped(<harvestcraft:waterfilter>, [
    [<ore:itemMetalIngot>, <ore:stickWood>, <ore:itemMetalIngot>],
    [<ore:stickWood>, <immersiveengineering:material:5>, <ore:stickWood>],
    [<ore:itemMetalIngot>, <ore:stickWood>, <ore:itemMetalIngot>],
]);

# Well -- remove as too OP
JEI.removeAndHide(<harvestcraft:well>);

# Veggie Bait -- add a crusher recipe
Crusher.addRecipe(<harvestcraft:veggiebaititem>, <ore:listAllveggie>, 256);

# import mods.harvestcrafttweaker.HarvestCraftTweaker;
#
# Available methods:
# clearAllPressing();
# addPressing(IIngredient input, IItemStack leftOutput, IItemStack rightOutput);
# removePressingByInput(IItemStack input);

# clearAllGrinding();
# addGrinding(IIngredient input, IItemStack leftOutput, IItemStack rightOutput);
# removeGrindingByInput(IItemStack input);
#
# addWaterFilter(IIngredient input, IItemStack leftOutput, IItemStack rightOutput);
# removeWaterFilterByInput(IItemStack input);
#
# //ground traps,normally hardcoded so needed coremods
# addGroundTrap(IIngredient input, IItemStack[] outputs) ;
# removeGroundTrapByInput(IIngredient input);
#
# //water traps, also hardcoded so needed coremods as well
# addWaterTrap(IIngredient input, IItemStack[] outputs);
# removeWaterTrapByInput(IIngredient input);
#
# //market
# clearAllMarket();
# addMarket(IItemStack toBuy,IItemStack input,int cost);
# removeMarketByOutput(IItemStack output);
#
# //shipping bin
# addShipping(IItemStack toBuy,IItemStack currency,int cost);
# removeShippingByOutput(IItemStack output);
