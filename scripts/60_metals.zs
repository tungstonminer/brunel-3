import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.immersiveengineering.AlloySmelter;
import mods.immersiveengineering.Crusher;
import mods.immersiveengineering.MetalPress;

# Items ################################################################################################################

val bushing = <railcraft:gear:3>;
val clippers = <immersiveengineering:tool:1>;
val crushingHammer = <engineerstools:crushing_hammer>;
val engineeringHammer = <immersiveengineering:tool:0>;
val gearMold = <immersiveengineering:mold:1>;
val largePackingMold = <immersiveengineering:mold:6>;
val plateMold = <immersiveengineering:mold:0>;
val rodMold = <immersiveengineering:mold:2>;
val unpackingMold = <immersiveengineering:mold:7>;

# Metal Lookup Functions ###############################################################################################

function allAlloys() as string[][] {
    return [
        ["constantan", "copper", "nickel"],
        ["electrum", "gold", "silver"],
        ["invar", "iron", "nickel"],
        ["bronze", "copper", "tin"],
        ["brass", "copper", "zinc"],
    ] as string[][];
}

function allAlloyAmounts() as int[][] {
    return [
        [2, 1, 1],
        [2, 1, 1],
        [3, 2, 1],
        [4, 3, 1],
        [4, 3, 1],
    ] as int[][];
}

function allMetals() as string[] {
    return [
        "aluminum",
        "bronze",
        "brass",
        "bronze",
        "constantan",
        "copper",
        "electrum",
        "gold",
        "invar",
        "iron",
        "lead",
        "nickel",
        "silver",
        "steel",
        "tin",
        "uranium",
        "zinc",
    ] as string[];
}

function blockDictEntry(name as string) as IOreDictEntry {
    var blocks = {
        "aluminum": <ore:blockAluminum>,
        "brass": <ore:blockBrass>,
        "bronze": <ore:blockBronze>,
        "constantan": <ore:blockConstantan>,
        "copper": <ore:blockCopper>,
        "electrum": <ore:blockElectrum>,
        "gold": <ore:blockGold>,
        "invar": <ore:blockInvar>,
        "iron": <ore:blockIron>,
        "lead": <ore:blockLead>,
        "nickel": <ore:blockNickel>,
        "silver": <ore:blockSilver>,
        "steel": <ore:blockSteel>,
        "tin": <ore:blockTin>,
        "uranium": <ore:blockUranium>,
        "zinc": <ore:blockZinc>,
    } as IOreDictEntry[string];

    return blocks[name];
}

function dust(name as string) as IItemStack {
    var dusts = {
        "aluminum": <immersiveengineering:metal:10>,
        "brass": null,
        "bronze": <contenttweaker:bronze_dust>,
        "constantan": <immersiveengineering:metal:15>,
        "copper": <immersiveengineering:metal:9>,
        "electrum": <immersiveengineering:metal:16>,
        "gold": <immersiveengineering:metal:19>,
        "invar": null,
        "iron": <immersiveengineering:metal:18>,
        "lead": <immersiveengineering:metal:11>,
        "nickel": <immersiveengineering:metal:13>,
        "silver": <immersiveengineering:metal:12>,
        "steel": <immersiveengineering:metal:17>,
        "tin": <contenttweaker:tin_dust>,
        "uranium": <immersiveengineering:metal:14>,
        "zinc": <contenttweaker:zinc_dust>,
    } as IItemStack[string];

    return dusts[name];
}

function gear(name as string) as IItemStack {
    var ingots = {
        "aluminum": null,
        "brass": null,
        "bronze": <railcraft:gear:4>,
        "constantan": null,
        "copper": <forestry:gear_copper>,
        "electrum": null,
        "gold": null,
        "invar": <railcraft:gear:5>,
        "iron": <railcraft:gear:1>,
        "lead": null,
        "nickel": null,
        "silver": null,
        "steel": <railcraft:gear:2>,
        "tin": <forestry:gear_tin>,
        "uranium": null,
        "zinc": null,
    } as IItemStack[string];

    return ingots[name];
}

function ingot(name as string) as IItemStack {
    var ingots = {
        "aluminum": <immersiveengineering:metal:1>,
        "brass": <railcraft:ingot:9>,
        "bronze": <railcraft:ingot:5>,
        "constantan": <immersiveengineering:metal:6>,
        "copper": <immersiveengineering:metal:0>,
        "electrum": <immersiveengineering:metal:7>,
        "gold": <minecraft:gold_ingot>,
        "invar": <railcraft:ingot:7>,
        "iron": <minecraft:iron_ingot>,
        "lead": <immersiveengineering:metal:2>,
        "nickel": <immersiveengineering:metal:4>,
        "silver": <immersiveengineering:metal:3>,
        "steel": <immersiveengineering:metal:8>,
        "tin": <railcraft:ingot:2>,
        "uranium": <immersiveengineering:metal:5>,
        "zinc": <railcraft:ingot:8>,
    } as IItemStack[string];

    return ingots[name];
}

function ingotDictEntry(name as string) as IOreDictEntry {
    var blocks = {
        "aluminum": <ore:ingotAluminum>,
        "brass": <ore:ingotBrass>,
        "bronze": <ore:ingotBronze>,
        "constantan": <ore:ingotConstantan>,
        "copper": <ore:ingotCopper>,
        "electrum": <ore:ingotElectrum>,
        "gold": <ore:ingotGold>,
        "invar": <ore:ingotInvar>,
        "iron": <ore:ingotIron>,
        "lead": <ore:ingotLead>,
        "nickel": <ore:ingotNickel>,
        "silver": <ore:ingotSilver>,
        "steel": <ore:ingotSteel>,
        "tin": <ore:ingotTin>,
        "uranium": <ore:ingotUranium>,
        "zinc": <ore:ingotZinc>,
    } as IOreDictEntry[string];

    return blocks[name];
}

function metalBlock(name as string) as IItemStack {
    var blocks = {
        "aluminum": <immersiveengineering:storage:1>,
        "brass": <railcraft:metal:9>,
        "bronze": <railcraft:metal:5>,
        "constantan": <immersiveengineering:storage:6>,
        "copper": <immersiveengineering:storage:0>,
        "electrum": <immersiveengineering:storage:7>,
        "gold": <minecraft:gold_block>,
        "invar": <railcraft:metal:7>,
        "iron": <minecraft:iron_block>,
        "lead": <immersiveengineering:storage:2>,
        "nickel": <immersiveengineering:storage:4>,
        "silver": <immersiveengineering:storage:3>,
        "steel": <immersiveengineering:storage:8>,
        "tin": <railcraft:metal:1>,
        "uranium": <immersiveengineering:storage:5>,
        "zinc": <railcraft:metal:8>,
    } as IItemStack[string];

    return blocks[name];
}

function nugget(name as string) as IItemStack {
    var ingots = {
        "aluminum": <agricraft:agri_nugget:8>,
        "brass": <railcraft:nugget:9>,
        "bronze": <railcraft:nugget:5>,
        "constantan": <immersiveengineering:metal:26>,
        "copper": <agricraft:agri_nugget:4>,
        "electrum": <immersiveengineering:metal:27>,
        "gold": <minecraft:gold_nugget>,
        "invar": <railcraft:nugget:7>,
        "iron": <agricraft:agri_nugget:3>,
        "lead": <agricraft:agri_nugget:5>,
        "nickel": <agricraft:agri_nugget:9>,
        "silver": <agricraft:agri_nugget:7>,
        "steel": <railcraft:nugget:0>,
        "tin": <agricraft:agri_nugget:5>,
        "uranium": <immersiveengineering:metal:25>,
        "zinc": <railcraft:nugget:8>,
    } as IItemStack[string];

    return ingots[name];
}

function nuggetDictEntry(name as string) as IOreDictEntry {
    var blocks = {
        "aluminum": <ore:nuggetAluminum>,
        "brass": <ore:nuggetBrass>,
        "bronze": <ore:nuggetBronze>,
        "constantan": <ore:nuggetConstantan>,
        "copper": <ore:nuggetCopper>,
        "electrum": <ore:nuggetElectrum>,
        "gold": <ore:nuggetGold>,
        "invar": <ore:nuggetInvar>,
        "iron": <ore:nuggetIron>,
        "lead": <ore:nuggetLead>,
        "nickel": <ore:nuggetNickel>,
        "silver": <ore:nuggetSilver>,
        "steel": <ore:nuggetSteel>,
        "tin": <ore:nuggetTin>,
        "uranium": <ore:nuggetUranium>,
        "zinc": <ore:nuggetZinc>,
    } as IOreDictEntry[string];

    return blocks[name];
}

function oreBlockDictEntry(name as string) as IOreDictEntry {
    var blocks = {
        "aluminum": <ore:oreAluminum>,
        "brass": null,
        "bronze": null,
        "constantan": null,
        "copper": <ore:oreCopper>,
        "electrum": null,
        "gold": <ore:oreGold>,
        "invar": null,
        "iron": <ore:oreIron>,
        "lead": <ore:oreLead>,
        "nickel": <ore:oreNickel>,
        "silver": <ore:oreSilver>,
        "steel": null,
        "tin": <ore:oreTin>,
        "uranium": <ore:oreUranium>,
        "zinc": <ore:oreZinc>,
    } as IOreDictEntry[string];

    return blocks[name];
}

function plate(name as string) as IItemStack {
    var plateItems = {
        "aluminum": <immersiveengineering:metal:31>,
        "brass": <railcraft:plate:11>,
        "bronze": <railcraft:plate:6>,
        "constantan": <immersiveengineering:metal:36>,
        "copper": <immersiveengineering:metal:30>,
        "electrum": <immersiveengineering:metal:37>,
        "gold": <immersiveengineering:metal:40>,
        "invar": <railcraft:plate:9>,
        "iron": <immersiveengineering:metal:39>,
        "lead": <immersiveengineering:metal:32>,
        "nickel": <immersiveengineering:metal:34>,
        "silver": <immersiveengineering:metal:33>,
        "steel": <immersiveengineering:metal:38>,
        "tin": <railcraft:plate:2>,
        "uranium": <immersiveengineering:metal:35>,
        "zinc": <railcraft:plate:10>,
    } as IItemStack[string];

    return plateItems[name];
}

function plateDictEntry(name as string) as IOreDictEntry {
    var entries = {
        "aluminum": <ore:plateAluminum>,
        "brass": <ore:plateBrass>,
        "bronze": <ore:plateBronze>,
        "constantan": <ore:plateConstantan>,
        "copper": <ore:plateCopper>,
        "electrum": <ore:plateElectrum>,
        "gold": <ore:plateGold>,
        "invar": <ore:plateInvar>,
        "iron": <ore:plateIron>,
        "lead": <ore:plateLead>,
        "nickel": <ore:plateNickel>,
        "silver": <ore:plateSilver>,
        "steel": <ore:plateSteel>,
        "tin": <ore:plateTin>,
        "uranium": <ore:plateUranium>,
        "zinc": <ore:plateZinc>,
    } as IOreDictEntry[string];

    return entries[name];
}

function rod(name as string) as IItemStack {
    var rodItems = {
        "aluminum": <immersiveengineering:material:3>,
        "brass": null,
        "bronze": null,
        "constantan": <immersiveposts:metal_rods:5>,
        "copper": <immersiveposts:metal_rods:1>,
        "electrum": <immersiveposts:metal_rods:6>,
        "gold": <immersiveposts:metal_rods:0>,
        "invar": null,
        "iron": <immersiveengineering:material:1>,
        "lead": <immersiveposts:metal_rods:2>,
        "nickel": <immersiveposts:metal_rods:4>,
        "silver": <immersiveposts:metal_rods:3>,
        "steel": <immersiveengineering:material:2>,
        "tin": null,
        "uranium": <immersiveposts:metal_rods:7>,
        "zinc": null,
    } as IItemStack[string];

    return rodItems[name];
}


# Formulaic Recipes ####################################################################################################

for metal in allMetals() {
    var blockItem = metalBlock(metal);
    var dustItem = dust(metal);
    var gearItem = gear(metal);
    var ingotItem = ingot(metal);
    var nuggetItem = nugget(metal);
    var plateItem = plate(metal);
    var rodItem = rod(metal);

    var blockDictEntry = blockDictEntry(metal);
    var ingotDictEntry = ingotDictEntry(metal);
    var nuggetDictEntry = nuggetDictEntry(metal);
    var oreDictEntry = oreBlockDictEntry(metal);
    var plateDictEntry = plateDictEntry(metal);

    if (!isNull(oreDictEntry)) {
        for item in oreDictEntry.items {
            item.maxStackSize = 4;
        }
    }

    if (!isNull(blockDictEntry)) {
        for item in blockDictEntry.items {
            item.maxStackSize = 1;
            recipes.remove(item);
        }
    }

    if (!isNull(ingotDictEntry)) {
        for item in ingotDictEntry.items {
            item.maxStackSize = 9;
            furnace.remove(item);
            recipes.remove(item);
        }
    }

    if (!isNull(nuggetDictEntry)) {
        for item in nuggetDictEntry.items {
            item.maxStackSize = 32;
            furnace.remove(item);
            recipes.remove(item);
        }
    }

    if (!isNull(plateDictEntry)) {
        for item in plateDictEntry.items {
            item.maxStackSize = 9;
        }
    }

    if (!isNull(blockItem)) {
        recipes.remove(blockItem);

        if (!isNull(blockDictEntry)) {
            recipes.addShapeless(blockItem, [blockDictEntry]);
        }

        if (!isNull(ingotItem)) {
            MetalPress.addRecipe(blockItem, ingotItem * 9, largePackingMold, 2304);
        }
    }

    if (!isNull(dustItem)) {
        dustItem.maxStackSize = 9;
        recipes.remove(dustItem);
        Crusher.removeRecipe(dustItem);

        if (!isNull(ingotItem)) {
            Crusher.addRecipe(dustItem, ingotItem, 1024);
        }

        if (!isNull(oreDictEntry)) {
            Crusher.addRecipe(dustItem * 2, oreDictEntry, 2048, <minecraft:gravel>, 1.0);
            recipes.addShapeless(dustItem, [
                oreDictEntry, crushingHammer.anyDamage().transformDamage(4)
            ]);
        }

        if (!isNull(gearItem)) {
            Crusher.addRecipe(dustItem * 4, gearItem, 4096);
        }
    }

    if (!isNull(gearItem)) {
        gearItem.maxStackSize = 9;
        MetalPress.removeRecipe(gearItem);
        recipes.remove(gearItem);

        if (!isNull(ingotItem)) {
            MetalPress.addRecipe(gearItem * 4, ingotItem * 4, gearMold, 1024);

            recipes.addShaped(gearItem * 4, [
                [null, ingotItem, null],
                [ingotItem, bushing * 4, ingotItem],
                [null, ingotItem, null],
            ]);
        }
    }

    if (!isNull(ingotItem)) {
        if (!isNull(dustItem)) {
            furnace.addRecipe(ingotItem, dustItem);
        }

        if (!isNull(blockDictEntry)) {
            MetalPress.addRecipe(ingotItem * 9, blockDictEntry, unpackingMold, 2304);
        }

        if (!isNull(ingotDictEntry)) {
            recipes.addShapeless(ingotItem, [ingotDictEntry]);
        }

        if (!isNull(nuggetItem)) {
            MetalPress.addRecipe(ingotItem, nuggetItem * 9, largePackingMold, 2304);
        }
    }

    if (!isNull(nuggetItem)) {
        if (!isNull(ingotItem)) {
            MetalPress.addRecipe(nuggetItem * 9, ingotItem, unpackingMold, 256);
            val SHEARS =
                <minecraft:shears>.anyDamage().transformDamage(9) |
                <railcraft:tool_shears_steel>.anyDamage().transformDamage(3);
            recipes.addShapeless(nuggetItem * 9, [SHEARS, ingotItem]);
        }

        if (!isNull(nuggetDictEntry)) {
            recipes.addShapeless(nuggetItem, [nuggetDictEntry]);
        }
    }

    if (!isNull(plateItem)) {
        plateItem.maxStackSize = 9;
        MetalPress.removeRecipe(plateItem);
        recipes.remove(plateItem);

        if (!isNull(ingotDictEntry)) {
            MetalPress.addRecipe(plateItem, ingotDictEntry, plateMold, 1024);
            recipes.addShapeless(plateItem, [ingotDictEntry, crushingHammer.anyDamage().transformDamage(2)]);
        }
    }

    if (!isNull(rodItem)) {
        rodItem.maxStackSize = 18;
        MetalPress.removeRecipe(rodItem);
        recipes.remove(rodItem);

        if (!isNull(ingotItem)) {
            MetalPress.addRecipe(rodItem * 2, ingotItem, rodMold, 256);
        }

        if (!isNull(plateDictEntry)) {
            recipes.addShapeless(rodItem * 2, [plateDictEntry, engineeringHammer.reuse()]);
        }
    }
}


# Alloy Furnace Recipes ################################################################################################

for index, alloyDefinition in allAlloys() {
    var output = alloyDefinition[0];
    var firstInput = alloyDefinition[1];
    var secondInput = alloyDefinition[2];
    var amounts = allAlloyAmounts()[index];

    var firstInputAmount = amounts[1];
    var firstInputIngotItem = ingot(firstInput);
    var outputAmount = amounts[0];
    var outputIngotItem = ingot(output);
    var secondInputAmount = amounts[2];
    var secondInputIngotItem = ingot(secondInput);

    AlloySmelter.removeRecipe(outputIngotItem);
    if !isNull(firstInputIngotItem) && !isNull(secondInputIngotItem) {
        AlloySmelter.addRecipe(
            outputIngotItem * outputAmount,
            firstInputIngotItem * firstInputAmount,
            secondInputIngotItem * secondInputAmount,
            (outputAmount * 80)
        );
    }
}


# Crafting Table Recipes ###############################################################################################

recipes.addShapeless(<contenttweaker:bronze_dust> * 4, [
    <ore:dustCopper>, <ore:dustCopper>, <ore:dustCopper>, <ore:dustTin>
]);
