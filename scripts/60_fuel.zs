import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.immersiveengineering.DieselHandler;
import mods.immersiveengineering.Fermenter;
import mods.immersiveengineering.Mixer;
import mods.immersiveengineering.Refinery;
import mods.immersiveengineering.Squeezer;
import mods.immersivepetroleum.Distillation;

# Fuel Production ######################################################################################################

# Biomass -- Create biomass by mixing organic materials
var biomassLowYieldInput = oreDict.biomassLowYieldInput;
biomassLowYieldInput.addAll(<ore:listAllveggie>);
biomassLowYieldInput.addAll(<ore:listAllfruit>);

var biomassHighYieldInput = oreDict.biomassHighYieldInput;
biomassHighYieldInput.addAll(<ore:treeSapling>);

var biomassHighYieldFertilizer = oreDict.biomassHighYieldFertilizer;
biomassHighYieldFertilizer.add(<forestry:fertilizer_bio>);
biomassHighYieldFertilizer.add(<forestry:mulch>);

var biomassLowYieldFertilizer = <forestry:fertilizer_compound>;

var outputBiomass = <liquid:biomass> * 1500;
var waterBucket = <liquid:water> * 1000;
var honeyBucket = <liquid:for.honey> * 1000;
var juiceBucket = <liquid:juice> * 1000;

Mixer.addRecipe(outputBiomass, honeyBucket, [biomassLowYieldInput * 16, biomassHighYieldFertilizer], 4096);
Mixer.addRecipe(outputBiomass, honeyBucket, [biomassLowYieldInput * 20, biomassLowYieldFertilizer], 4096);
Mixer.addRecipe(outputBiomass, juiceBucket, [biomassLowYieldInput * 16, biomassHighYieldFertilizer], 4096);
Mixer.addRecipe(outputBiomass, juiceBucket, [biomassLowYieldInput * 20, biomassLowYieldFertilizer], 4096);
Mixer.addRecipe(outputBiomass, waterBucket, [biomassLowYieldInput * 32, biomassHighYieldFertilizer], 4096);
Mixer.addRecipe(outputBiomass, waterBucket, [biomassLowYieldInput * 40, biomassLowYieldFertilizer], 4096);

Mixer.addRecipe(outputBiomass, honeyBucket, [biomassHighYieldInput * 4, biomassHighYieldFertilizer], 4096);
Mixer.addRecipe(outputBiomass, honeyBucket, [biomassHighYieldInput * 5, biomassLowYieldFertilizer], 4096);
Mixer.addRecipe(outputBiomass, juiceBucket, [biomassHighYieldInput * 4, biomassHighYieldFertilizer], 4096);
Mixer.addRecipe(outputBiomass, juiceBucket, [biomassHighYieldInput * 5, biomassLowYieldFertilizer], 4096);
Mixer.addRecipe(outputBiomass, waterBucket, [biomassHighYieldInput * 8, biomassHighYieldFertilizer], 4096);
Mixer.addRecipe(outputBiomass, waterBucket, [biomassHighYieldInput * 10, biomassLowYieldFertilizer], 4096);

# Crude Oil -- refine crude oil into its various byproducts
Distillation.addRecipe(
    [<liquid:lubricant> * 15, <liquid:diesel> * 40, <liquid:gasoline> * 45],
    [<immersivepetroleum:material:0>],
    <liquid:oil> * 100,
    256,
    4,
    [0.07]
);

# Fruit Juice -- Add recipes for Forestry Fruit Juice
var fruitJuiceInput = oreDict.fruitJuiceInput;
fruitJuiceInput.addItems([
    <forestry:fruits:0>, <forestry:fruits:3>, <forestry:fruits:4>, <forestry:fruits:5>, <forestry:fruits:6>
]);
fruitJuiceInput.addAll(<ore:listAllfruit>);
for itemStack in fruitJuiceInput.items {
    Squeezer.addRecipe(<harvestcraft:fruitbaititem>, <liquid:juice> * 4000, itemStack * 20, 64000);
}
for itemStack in <ore:listAlljuice>.items {
    Squeezer.addRecipe(null, <liquid:juice> * 350, itemStack, 256);
}

# Ethanol (Forestry) -- Allow Refinery to create ethanol from biomass
Distillation.addRecipe([<liquid:water> * 70, <liquid:bio.ethanol> * 30], [], <liquid:biomass> * 100, 256, 4, []);

# Ethanol (IE) -- Expand recipes available for making ethanol in the fermenter
var ethanolInput = oreDict.ethanolInput;
ethanolInput.addItems([
    <minecraft:carrot>, <minecraft:potato>, <minecraft:beetroot>, <harvestcraft:cornitem>, <harvestcraft:beetitem>,
    <harvestcraft:parsnipitem>, <harvestcraft:rutabagaitem>, <harvestcraft:sweetpotatoitem>, <harvestcraft:turnipitem>,
    <harvestcraft:beanitem>, <harvestcraft:arrowrootitem>, <harvestcraft:cassavaitem>, <harvestcraft:chickpeaitem>,
    <harvestcraft:jicamaitem>, <harvestcraft:lentilitem>, <harvestcraft:taroitem>,
]);
ethanolInput.addAll(<ore:listAllfruit>);
ethanolInput.addAll(<ore:listAllsugar>);
ethanolInput.add(<minecraft:reeds>);
Fermenter.removeFluidRecipe(<liquid:ethanol>);
for itemStack in ethanolInput.items {
    Fermenter.addRecipe(<forestry:mulch>, <liquid:ethanol> * 640, itemStack * 8, 51200);
}

# Honey -- Add recipes for Forestry Honey
Squeezer.removeFluidRecipe(<liquid:for.honey>);
Squeezer.addRecipe(<forestry:propolis>, <liquid:for.honey> * 2000, <forestry:honey_drop> * 20, 5120);
Squeezer.addRecipe(null, <liquid:for.honey> * 2000, <forestry:honeydew> * 20, 5120);

# Plant Oil -- Add recipes for IE Plant Oil
Squeezer.removeFluidRecipe(<liquid:plantoil>);
for itemStack in <ore:plantOilInput>.items {
    Squeezer.addRecipe(<harvestcraft:grainbaititem>, <liquid:plantoil> * 512, itemStack * 8, 51200);
}

# Biodiesel -- Replace recipe with a more standardized one
Refinery.removeRecipe(<liquid:biodiesel>);
Refinery.addRecipe(<liquid:biodiesel> * 100, <liquid:plantoil> * 50, <liquid:ethanol> * 50, 500);
Refinery.addRecipe(<liquid:biodiesel> * 100, <liquid:plantoil> * 50, <liquid:bio.ethanol> * 50, 500);

# Fuel Consumption #####################################################################################################

# The diesel generator yields a constant 4096 RF/t while it is running, so the DieselHandler expects to be told how many
# seconds a given quantity of fuel will last at that rate.  So, for example, to specify that a bucket of fuel will
# generate a total of 512,000 RF, you must specify that it will last: 512,000RF / 4096RF/t = 125t (6.25s)
DieselHandler.removeFuel(<liquid:biodiesel>);
DieselHandler.addFuel(<liquid:biodiesel>, 6.25 * 20);
