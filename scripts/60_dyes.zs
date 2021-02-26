import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.immersiveengineering.Crusher;


########################################################################################################################

val ALL_COLORS = [
    "black", "blue", "brown", "cyan", "gray", "green", "lightBlue", "lightGray", "lime", "magenta", "orange", "pink",
    "purple", "red", "white", "yellow"
] as string[];


########################################################################################################################

function getClayShingleItem(color as string) as IItemStack {
    val clayShingleItems = {
        "black": <cathedral:roofing_block_black>,
        "blue": <cathedral:roofing_block_blue>,
        "brown": <cathedral:roofing_block_brown>,
        "cyan": <cathedral:roofing_block_cyan>,
        "gray": <cathedral:roofing_block_gray>,
        "green": <cathedral:roofing_block_green>,
        "lightBlue": <cathedral:roofing_block_light_blue>,
        "lightGray": <cathedral:roofing_block_silver>,
        "lime": <cathedral:roofing_block_lime>,
        "magenta": <cathedral:roofing_block_magenta>,
        "orange": <cathedral:roofing_block_orange>,
        "pink": <cathedral:roofing_block_pink>,
        "purple": <cathedral:roofing_block_purple>,
        "red": <cathedral:roofing_block_red>,
        "white": <cathedral:roofing_block_white>,
        "yellow": <cathedral:roofing_block_yellow>,
    } as IItemStack[string];

    return clayShingleItems[color];
}

function getDyeItem(color as string) as IItemStack {
    val exceptions = {
        "black": <contenttweaker:black_dye>,
        "blue": <contenttweaker:blue_dye>,
        "brown": <contenttweaker:brown_dye>,
        "white": <contenttweaker:white_dye>,
    } as IItemStack[string];

    if exceptions has color {
        return exceptions[color];
    }

    # WARNING: these *aren't* the same values as are used for stained glass, hardened clay, etc.  So far as I can
    #          tell, then are *only* use for dyes
    var metaValues = {
        "black": 0, "red": 1, "green": 2, "brown": 3, "blue": 4, "purple": 5, "cyan": 6, "lightGray": 7, "gray": 8,
        "pink": 9, "lime": 10, "yellow": 11, "lightBlue": 12, "magenta": 13, "orange": 14, "white": 15
    } as int[string];
    return <minecraft:dye>.definition.makeStack(metaValues[color]);
}

function getHarvestCraftCandleItem(color as string) as IItemStack {
    var candleItems = {
        "white": <harvestcraft:candledeco1>,
        "orange": <harvestcraft:candledeco2>,
        "magenta": <harvestcraft:candledeco3>,
        "lightBlue": <harvestcraft:candledeco4>,
        "yellow": <harvestcraft:candledeco5>,
        "lime": <harvestcraft:candledeco6>,
        "pink": <harvestcraft:candledeco7>,
        "gray": <harvestcraft:candledeco8>,
        "lightGray": <harvestcraft:candledeco9>,
        "cyan": <harvestcraft:candledeco10>,
        "purple": <harvestcraft:candledeco11>,
        "blue": <harvestcraft:candledeco12>,
        "brown": <harvestcraft:candledeco13>,
        "green": <harvestcraft:candledeco14>,
        "red": <harvestcraft:candledeco15>,
        "black": <harvestcraft:candledeco16>,
    } as IItemStack[string];

    return candleItems[color];
}

function getStainedGlassEntry(color as string) as IOreDictEntry {
    val coloredGlassEntries = {
        "black": <ore:blockGlassBlack>,
        "blue": <ore:blockGlassBlue>,
        "brown": <ore:blockGlassBrown>,
        "cyan": <ore:blockGlassCyan>,
        "gray": <ore:blockGlassGray>,
        "green": <ore:blockGlassGreen>,
        "lightBlue": <ore:blockGlassLightBlue>,
        "lightGray": <ore:blockGlasslightGray>,
        "lime": <ore:blockGlassLime>,
        "magenta": <ore:blockGlassMagenta>,
        "orange": <ore:blockGlassOrange>,
        "pink": <ore:blockGlassPink>,
        "purple": <ore:blockGlassPurple>,
        "red": <ore:blockGlassRed>,
        "white": <ore:blockGlassWhite>,
        "yellow": <ore:blockGlassYellow>,
    } as IOreDictEntry[string];

    return coloredGlassEntries[color];
}

function makeColoredBibliocraftStack(itemStack as IItemStack, color as string) as IItemStack {
    var metaValues = {
        "white": 0, "lightGray": 1, "gray": 2, "black": 3, "red": 4, "orange": 5, "yellow": 6, "lime": 7, "green": 8,
        "cyan": 9, "lightBlue": 10, "blue": 11, "purple": 12, "magenta": 13, "pink": 14, "brown": 15
    } as int[string];

    return itemStack.definition.makeStack(metaValues[color]);
}

function makeColoredStack(itemStack as IItemStack, color as string) as IItemStack {
    var metaValues = {
        "white": 0, "orange": 1, "magenta": 2, "lightBlue": 3, "yellow": 4, "lime": 5, "pink": 6, "gray": 7,
        "lightGray": 8, "cyan": 9, "purple": 10, "blue": 11, "brown": 12, "green": 13, "red": 14, "black": 15
    } as int[string];

    return itemStack.definition.makeStack(metaValues[color]);
}


########################################################################################################################

for itemStack in <ore:blockGlass>.items {
    recipes.remove(itemStack);
}

for itemStack in <ore:blockWool>.items {
    recipes.remove(itemStack);
}

for itemStack in <ore:clayshingles>.items {
    recipes.remove(itemStack);
}
recipes.addShaped(<cathedral:roofing_block_natural>, [
    [<cathedral:firedtile>, <cathedral:firedtile>],
    [<cathedral:firedtile>, <cathedral:firedtile>],
]);

for itemStack in <ore:concretePowder>.items {
    recipes.remove(itemStack);
}

for itemStack in <ore:hardenedClay>.items {
    recipes.remove(itemStack);
}


########################################################################################################################

for color in ALL_COLORS {
    val dyeItem = getDyeItem(color);
    val terracottaItem = makeColoredStack(<minecraft:stained_hardened_clay>, color);
    val woolItem = makeColoredStack(<minecraft:wool>, color);

    # Balloon -- use the new dyes for balloons
    if color != "white" {
        val balloonItem = makeColoredStack(<davincisvessels:balloon>, color);
        recipes.remove(balloonItem);
        recipes.addShaped(balloonItem * 8, [
            [<davincisvessels:balloon:0>, <davincisvessels:balloon:0>, <davincisvessels:balloon:0>],
            [<davincisvessels:balloon:0>, dyeItem, <davincisvessels:balloon:0>],
            [<davincisvessels:balloon:0>, <davincisvessels:balloon:0>, <davincisvessels:balloon:0>],
        ]);
    }

    # Bed -- use the new dyes for beds
    if color != "white" {
        val bedItem = makeColoredStack(<minecraft:bed>, color);
        recipes.remove(bedItem);
        recipes.addShapeless(bedItem, [<minecraft:bed:0>, dyeItem]);
    }

    # Candles -- use the preferred dye
    if color != "white" {
        var whiteCandleItem = getHarvestCraftCandleItem("white");
        var candleItem = getHarvestCraftCandleItem(color);
        recipes.remove(candleItem);
        recipes.addShapeless(candleItem * 4, [
            dyeItem, whiteCandleItem, whiteCandleItem, whiteCandleItem, whiteCandleItem,
        ]);
    }

    # Clay Shingles -- only allow staining natural tiles
    var clayShingleItem = getClayShingleItem(color);
    recipes.remove(clayShingleItem);
    recipes.addShaped(clayShingleItem * 8, [
        [<cathedral:roofing_block_natural>, <cathedral:roofing_block_natural>, <cathedral:roofing_block_natural>],
        [<cathedral:roofing_block_natural>, dyeItem, <cathedral:roofing_block_natural>],
        [<cathedral:roofing_block_natural>, <cathedral:roofing_block_natural>, <cathedral:roofing_block_natural>],
    ]);

    # Concrete Powder -- add recipes using approved dyes
    var concretePowderItem = makeColoredStack(<minecraft:concrete_powder>, color);
    recipes.addShapeless(concretePowderItem * 8, [
        dyeItem,
        <minecraft:sand>, <minecraft:sand>, <minecraft:sand>, <minecraft:sand>,
        <minecraft:gravel>, <minecraft:gravel>, <minecraft:gravel>, <minecraft:gravel>,
    ]);

    # Fancy Lamps & Lanterns -- add colored recipes
    if color != "white" {
        var goldLampItem = makeColoredBibliocraftStack(<bibliocraft:lampgold>, color);
        recipes.addShapeless(goldLampItem, [<bibliocraft:lampgold:0>, dyeItem]);

        var ironLampItem = makeColoredBibliocraftStack(<bibliocraft:lampiron>, color);
        recipes.addShapeless(ironLampItem, [<bibliocraft:lampiron:0>, dyeItem]);

        var goldLanternItem = makeColoredBibliocraftStack(<bibliocraft:lanterngold>, color);
        recipes.addShapeless(goldLanternItem, [<bibliocraft:lanterngold:0>, dyeItem]);

        var ironLanternItem = makeColoredBibliocraftStack(<bibliocraft:lanterniron>, color);
        recipes.addShapeless(ironLanternItem, [<bibliocraft:lanterniron:0>, dyeItem]);
    }

    # Dye -- remove recipes to be replaced below
    recipes.remove(dyeItem);

    # Iron Tank Gauge -- add colored recipes
    if color != "white" {
        val ironTankGaugeItem = makeColoredStack(<railcraft:tank_iron_gauge>, color);
        recipes.addShaped(ironTankGaugeItem, [
            [<railcraft:tank_iron_gauge>, <railcraft:tank_iron_gauge>, <railcraft:tank_iron_gauge>],
            [<railcraft:tank_iron_gauge>, dyeItem, <railcraft:tank_iron_gauge>],
            [<railcraft:tank_iron_gauge>, <railcraft:tank_iron_gauge>, <railcraft:tank_iron_gauge>],
        ]);
    }

    # Iron Tank Valve -- add colored recipes
    if color != "white" {
        val ironTankGaugeItem = makeColoredStack(<railcraft:tank_iron_valve>, color);
        recipes.addShaped(ironTankGaugeItem, [
            [<railcraft:tank_iron_valve>, <railcraft:tank_iron_valve>, <railcraft:tank_iron_valve>],
            [<railcraft:tank_iron_valve>, dyeItem, <railcraft:tank_iron_valve>],
            [<railcraft:tank_iron_valve>, <railcraft:tank_iron_valve>, <railcraft:tank_iron_valve>],
        ]);
    }

    # Iron Tank Wall -- add colored recipes
    if color != "white" {
        val ironTankGaugeItem = makeColoredStack(<railcraft:tank_iron_wall>, color);
        recipes.addShaped(ironTankGaugeItem, [
            [<railcraft:tank_iron_wall>, <railcraft:tank_iron_wall>, <railcraft:tank_iron_wall>],
            [<railcraft:tank_iron_wall>, dyeItem, <railcraft:tank_iron_wall>],
            [<railcraft:tank_iron_wall>, <railcraft:tank_iron_wall>, <railcraft:tank_iron_wall>],
        ]);
    }

    # Reinforced Concrete -- add colored recipes
    if color != "lightGray" {
        var baseReinforcedConcreteItem = <railcraft:reinforced_concrete:8>;
        var reinforcedConcreteItem = makeColoredStack(<railcraft:reinforced_concrete>, color);
        recipes.addShaped(reinforcedConcreteItem, [
            [baseReinforcedConcreteItem, baseReinforcedConcreteItem, baseReinforcedConcreteItem],
            [baseReinforcedConcreteItem, dyeItem, baseReinforcedConcreteItem],
            [baseReinforcedConcreteItem, baseReinforcedConcreteItem, baseReinforcedConcreteItem],
        ]);
    }

    # Stained Glass -- only allow ordinary glass as input
    var stainedGlassItem = makeColoredStack(<minecraft:stained_glass>, color);
    recipes.addShaped(stainedGlassItem * 8, [
        [<minecraft:glass>, <minecraft:glass>, <minecraft:glass>],
        [<minecraft:glass>, dyeItem, <minecraft:glass>],
        [<minecraft:glass>, <minecraft:glass>, <minecraft:glass>],
    ]);

    # Stained Glass -- allow crushing with a chance of getting dye back
    var stainedGlassEntry = getStainedGlassEntry(color);
    Crusher.addRecipe(<minecraft:sand>, stainedGlassEntry, 1024, dyeItem, 0.05);

    # Strengthened Glass -- only allow dying white glass
    if color != "white" {
        val strengthenedGlassItem =  makeColoredStack(<railcraft:glass>, color);
        recipes.remove(strengthenedGlassItem);
        recipes.addShaped(strengthenedGlassItem * 8, [
            [<railcraft:glass:0>, <railcraft:glass:0>, <railcraft:glass:0>],
            [<railcraft:glass:0>, dyeItem, <railcraft:glass:0>],
            [<railcraft:glass:0>, <railcraft:glass:0>, <railcraft:glass:0>],
        ]);
    }

    # Steel Tank Gauge -- add colored recipes
    if color != "white" {
        val steelTankGaugeItem = makeColoredStack(<railcraft:tank_steel_gauge>, color);
        recipes.addShaped(steelTankGaugeItem, [
            [<railcraft:tank_steel_gauge>, <railcraft:tank_steel_gauge>, <railcraft:tank_steel_gauge>],
            [<railcraft:tank_steel_gauge>, dyeItem, <railcraft:tank_steel_gauge>],
            [<railcraft:tank_steel_gauge>, <railcraft:tank_steel_gauge>, <railcraft:tank_steel_gauge>],
        ]);
    }

    # Steel Tank Valve -- add colored recipes
    if color != "white" {
        val steelTankGaugeItem = makeColoredStack(<railcraft:tank_steel_valve>, color);
        recipes.addShaped(steelTankGaugeItem, [
            [<railcraft:tank_steel_valve>, <railcraft:tank_steel_valve>, <railcraft:tank_steel_valve>],
            [<railcraft:tank_steel_valve>, dyeItem, <railcraft:tank_steel_valve>],
            [<railcraft:tank_steel_valve>, <railcraft:tank_steel_valve>, <railcraft:tank_steel_valve>],
        ]);
    }

    # Steel Tank Wall -- add colored recipes
    if color != "white" {
        val steelTankGaugeItem = makeColoredStack(<railcraft:tank_steel_wall>, color);
        recipes.addShaped(steelTankGaugeItem, [
            [<railcraft:tank_steel_wall>, <railcraft:tank_steel_wall>, <railcraft:tank_steel_wall>],
            [<railcraft:tank_steel_wall>, dyeItem, <railcraft:tank_steel_wall>],
            [<railcraft:tank_steel_wall>, <railcraft:tank_steel_wall>, <railcraft:tank_steel_wall>],
        ]);
    }

    # Sword Pedestal -- add recipes for colored pedestals
    if color != "white" {
        val pedestalItem = makeColoredBibliocraftStack(<bibliocraft:swordpedestal>, color);
        recipes.remove(pedestalItem);
        recipes.addShaped(pedestalItem, [
            [null, <minecraft:stone_slab>, null],
            [<minecraft:stone_slab>, woolItem, <minecraft:stone_slab>],
        ]);
    }

    # Terracotta -- allow staining plain terracotta
    recipes.addShaped(terracottaItem * 8, [
        [<minecraft:hardened_clay>, <minecraft:hardened_clay>, <minecraft:hardened_clay>],
        [<minecraft:hardened_clay>, dyeItem, <minecraft:hardened_clay>],
        [<minecraft:hardened_clay>, <minecraft:hardened_clay>, <minecraft:hardened_clay>],
    ]);

    # Terracotta -- allow crushing terracotta back to clay
    Crusher.addRecipe(<minecraft:clay_ball> * 4, terracottaItem, 2048, dyeItem, 0.05);

    # Typewriter -- add recipes for colored typewriters
    val typewriterItem = makeColoredBibliocraftStack(<bibliocraft:typewriter>, color);
    recipes.remove(typewriterItem);
    recipes.addShaped(typewriterItem, [
        [<ore:ingotIron>, <ore:paper>, <ore:ingotIron>],
        [<ore:blockIron>, <ore:dyeBlack>, <ore:blockIron>],
        [terracottaItem, terracottaItem, terracottaItem],
    ]);

    # Wool -- allow crushing with a chance of getting dye back
    Crusher.removeRecipesForInput(woolItem);
    Crusher.addRecipe(<minecraft:string> * 4, woolItem, 2048, dyeItem, 0.05);

    # Wool -- allow dying white wool
    recipes.addShapeless(woolItem * 2, [<minecraft:wool:0>, <minecraft:wool:0>, dyeItem]);
}


########################################################################################################################

val WATER = <liquid:water>.name;

val mortar = <ore:toolMortarandpestle>.reuse();
val waterItem =
    <minecraft:water_bucket> | <claybucket:claybucket:1> |
    <forge:bucketfilled>.withTag({FluidName: WATER, Amount: 1000}) |
    <forestry:can:1>.withTag({Fluid: {FluidName: WATER, Amount: 1000}}) |
    <forestry:refractory:1>.withTag({Fluid: {FluidName: WATER, Amount: 1000}}) |
    <forestry:capsule:1>.withTag({Fluid: {FluidName: WATER, Amount: 1000}});

# Black Dye
var blackDust = <ore:dustCoal> | <ore:dustCharcoal>;
recipes.addShapeless(getDyeItem("black"), [mortar, <minecraft:dye:0>]);
recipes.addShaped(getDyeItem("black") * 7, [
    [blackDust, blackDust, blackDust],
    [blackDust, waterItem, blackDust],
    [blackDust, mortar, blackDust],
]);

# Red Dye
recipes.addShapeless(getDyeItem("red"), [
    mortar, <minecraft:red_flower:4> | <minecraft:red_flower:0> | <minecraft:beetroot>
]);
recipes.addShapeless(getDyeItem("red") * 2, [mortar, <minecraft:double_plant:4>]);

# Brown Dye
var brownDust = <harvestcraft:cocoapowderitem>;
recipes.addShaped(getDyeItem("brown") * 7, [
    [brownDust, brownDust, brownDust],
    [brownDust, waterItem, brownDust],
    [brownDust, mortar, brownDust],
]);

# Blue Dye
var blueDust = <minecraft:dye:4>;
recipes.addShaped(getDyeItem("blue") * 7, [
    [blueDust, blueDust, blueDust],
    [blueDust, waterItem, blueDust],
    [blueDust, mortar, blueDust],
]);

# Light Blue Dye
recipes.addShapeless(getDyeItem("lightBlue"), [mortar, <minecraft:red_flower:1>]);

# Light Gray Dye
recipes.addShapeless(getDyeItem("lightGray"), [
    mortar, <minecraft:red_flower:3> | <minecraft:red_flower:6> | <minecraft:red_flower:8>
]);

# Magenta Dye
recipes.addShapeless(getDyeItem("magenta"), [mortar, <minecraft:red_flower:2>]);
recipes.addShapeless(getDyeItem("magenta") * 2, [mortar, <minecraft:double_plant:1>]);

# Orange Dye
recipes.addShapeless(getDyeItem("orange"), [mortar, <minecraft:red_flower:5>]);

# Pink Dye
recipes.addShapeless(getDyeItem("pink"), [mortar, <minecraft:red_flower:7>]);
recipes.addShapeless(getDyeItem("pink") * 2, [mortar, <minecraft:double_plant:5>]);

# Yellow Dye
recipes.addShapeless(getDyeItem("yellow"), [mortar, <minecraft:yellow_flower:0>]);
recipes.addShapeless(getDyeItem("yellow") * 2, [mortar, <minecraft:double_plant:0>]);

# White Dye
var whiteDust = <minecraft:dye:15>;
recipes.addShaped(getDyeItem("white") * 7, [
    [whiteDust, whiteDust, whiteDust],
    [whiteDust, waterItem, whiteDust],
    [whiteDust, mortar, whiteDust],
]);

# Mixed Dyes
function d(color as string) as IItemStack { return getDyeItem(color); }

recipes.addShapeless(d("blue") * 2, [mortar, d("black"), d("lightBlue")]);
recipes.addShapeless(d("cyan") * 2, [mortar, d("blue"), d("green")]);
recipes.addShapeless(d("gray") * 2, [mortar, d("black"), d("white")]);
recipes.addShapeless(d("green") * 2, [mortar, d("black"), d("green")]);
recipes.addShapeless(d("lightBlue") * 2, [mortar, d("blue"), d("white")]);
recipes.addShapeless(d("lightGray") * 2, [mortar, d("gray"), d("white")]);
recipes.addShapeless(d("lightGray") * 3, [mortar, d("black"), d("white"), d("white")]);
recipes.addShapeless(d("lime") * 2, [mortar, d("green"), d("white")]);
recipes.addShapeless(d("magenta") * 2, [mortar, d("pink"), d("purple")]);
recipes.addShapeless(d("magenta") * 3, [mortar, d("blue"), d("pink"), d("red")]);
recipes.addShapeless(d("magenta") * 4, [mortar, d("blue"), d("red"), d("red"), d("white")]);
recipes.addShapeless(d("orange") * 2, [mortar, d("red"), d("yellow")]);
recipes.addShapeless(d("pink") * 2, [mortar, d("red"), d("white")]);
recipes.addShapeless(d("purple") * 2, [mortar, d("blue"), d("red")]);
