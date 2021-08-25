import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;


########################################################################################################################

var bladeMetalIngot as IOreDictEntry = oreDict.get("bladeMetalIngot");
bladeMetalIngot.addAll(<ore:ingotBronze>);
bladeMetalIngot.addAll(<ore:ingotIron>);
bladeMetalIngot.addAll(<ore:ingotSteel>);

var cookwareMetalIngot as IOreDictEntry = oreDict.get("cookwareMetalIngot");
cookwareMetalIngot.addAll(<ore:ingotAluminum>);
cookwareMetalIngot.addAll(<ore:ingotBronze>);
cookwareMetalIngot.addAll(<ore:ingotCopper>);
cookwareMetalIngot.addAll(<ore:ingotIron>);
cookwareMetalIngot.addAll(<ore:ingotNickel>);
cookwareMetalIngot.addAll(<ore:ingotSteel>);

var decorativeMetalIngot as IOreDictEntry = oreDict.get("decorativeMetalIngot");
decorativeMetalIngot.addAll(<ore:ingotGold>);
decorativeMetalIngot.addAll(<ore:ingotSilver>);
decorativeMetalIngot.addAll(<ore:ingotBrass>);
decorativeMetalIngot.addAll(<ore:ingotCopper>);
decorativeMetalIngot.addAll(<ore:ingotElectrum>);

var itemMetalIngot as IOreDictEntry = oreDict.get("itemMetalIngot");
itemMetalIngot.addAll(<ore:ingotAluminum>);
itemMetalIngot.addAll(<ore:ingotBrass>);
itemMetalIngot.addAll(<ore:ingotBronze>);
itemMetalIngot.addAll(<ore:ingotCopper>);
itemMetalIngot.addAll(<ore:ingotIron>);
itemMetalIngot.addAll(<ore:ingotNickel>);
itemMetalIngot.addAll(<ore:ingotSteel>);
itemMetalIngot.addAll(<ore:ingotTin>);

var itemMetalNugget as IOreDictEntry = oreDict.get("itemMetalNugget");
itemMetalNugget.addAll(<ore:nuggetAluminum>);
itemMetalNugget.addAll(<ore:nuggetBrass>);
itemMetalNugget.addAll(<ore:nuggetBronze>);
itemMetalNugget.addAll(<ore:nuggetCopper>);
itemMetalNugget.addAll(<ore:nuggetIron>);
itemMetalNugget.addAll(<ore:nuggetNickel>);
itemMetalNugget.addAll(<ore:nuggetSteel>);
itemMetalNugget.addAll(<ore:nuggetTin>);

var plantOilInput = oreDict.plantOilInput;
plantOilInput.addAll(<ore:cropAvocado>);
plantOilInput.addAll(<ore:cropMustard>);
plantOilInput.addAll(<ore:cropOlive>);
plantOilInput.addAll(<ore:cropPeanut>);
plantOilInput.addAll(<ore:cropWalnut>);

var toolMetalIngot as IOreDictEntry = oreDict.get("toolMetalIngot");
toolMetalIngot.addAll(<ore:ingotBronze>);
toolMetalIngot.addAll(<ore:ingotInvar>);
toolMetalIngot.addAll(<ore:ingotIron>);
toolMetalIngot.addAll(<ore:ingotNickel>);
toolMetalIngot.addAll(<ore:ingotSteel>);

# Add individual items to ore dict entries
<ore:dustBronze>.add(<contenttweaker:bronze_dust>);
<ore:dustTin>.add(<contenttweaker:tin_dust>);
<ore:foodEelraw>.add(<betteranimalsplus:eel_meat_raw>);
<ore:toolMortarandpestle>.add(<contenttweaker:industrial_mortarandpestle>);

# Harvestcraft -- remove erroneous entries
<ore:listAllporkraw>.remove(<harvestcraft:bbqjackfruititem>);
<ore:listAllporkcooked>.remove(<harvestcraft:bbqjackfruititem>);
<ore:listAllbeefraw>.remove(<harvestcraft:groundbeefitem>);
<ore:listAllchickenraw>.remove(<harvestcraft:groundchickenitem>);
<ore:listAllduckraw>.remove(<harvestcraft:groundduckitem>);
<ore:listAllfishraw>.remove(<harvestcraft:groundfishitem>);
<ore:listAllmuttonraw>.remove(<harvestcraft:groundmuttonitem>);
<ore:listAllporkraw>.remove(<harvestcraft:groundporkitem>);
<ore:listAllrabbitraw>.remove(<harvestcraft:groundrabbititem>);
<ore:listAllturkeyraw>.remove(<harvestcraft:groundturkeyitem>);
<ore:listAllvenisonraw>.remove(<harvestcraft:groundvenisonitem>);

# Harvestcraft -- Pressed Wax
<ore:itemBeeswax>.add(<harvestcraft:beeswaxitem>);

# Just Another Raft Mod -- add all rafts to an ore dict entry
<ore:raft>.add(
    <jarm:oak_raft>, <jarm:spruce_raft>, <jarm:birch_raft>,
    <jarm:jungle_raft>, <jarm:acacia_raft>, <jarm:dark_oak_raft>
);

# Minecraft -- Concrete Powder
for meta in 0 .. 16 {
    <ore:concretePowder>.add(<minecraft:concrete_powder>.definition.makeStack(meta));
}

# Minecraft -- Dye -- remove items which are no longer valid dyes and add their replacements
<ore:dye>.add(<contenttweaker:black_dye>);
<ore:dye>.add(<contenttweaker:blue_dye>);
<ore:dye>.add(<contenttweaker:brown_dye>);
<ore:dye>.add(<contenttweaker:white_dye>);
<ore:dye>.remove(<minecraft:dye:0>);
<ore:dye>.remove(<minecraft:dye:15>);
<ore:dye>.remove(<minecraft:dye:3>);
<ore:dye>.remove(<minecraft:dye:4>);
<ore:dyeBlack>.add(<contenttweaker:black_dye>);
<ore:dyeBlack>.remove(<minecraft:dye:0>);
<ore:dyeBlue>.add(<contenttweaker:blue_dye>);
<ore:dyeBlue>.remove(<minecraft:dye:4>);
<ore:dyeBrown>.add(<contenttweaker:brown_dye>);
<ore:dyeBrown>.remove(<minecraft:dye:3>);
<ore:dyeWhite>.add(<contenttweaker:white_dye>);
<ore:dyeWhite>.remove(<minecraft:dye:15>);

# Minecraft -- Ore -- isolate various ores for use in the excavator
<ore:blockDiamondOre>.add(<minecraft:diamond_ore>);
<ore:blockEmeraldOre>.add(<minecraft:emerald_ore>);
<ore:blockLapisOre>.add(<minecraft:lapis_ore>);

# Minecraft -- Sandstone -- add dict entries which distinguish between yellow and red sandstone
for meta in 0 .. 3 { <ore:sandstoneYellow>.add(<minecraft:sandstone>.definition.makeStack(meta)); }
for meta in 0 .. 16 { <ore:sandstoneYellow>.add(<chisel:sandstoneyellow>.definition.makeStack(meta)); }
for meta in 0 .. 10 { <ore:sandstoneYellow>.add(<chisel:sandstoneyellow1>.definition.makeStack(meta)); }
for meta in 0 .. 8 { <ore:sandstoneYellow>.add(<chisel:sandstoneyellow2>.definition.makeStack(meta)); }
for meta in 0 .. 16 { <ore:sandstoneYellow>.add(<chisel:sandstone-scribbles>.definition.makeStack(meta)); }

for meta in 0 .. 3 { <ore:sandstoneRed>.add(<minecraft:red_sandstone>.definition.makeStack(meta)); }
for meta in 0 .. 16 { <ore:sandstoneRed>.add(<chisel:sandstonered>.definition.makeStack(meta)); }
for meta in 0 .. 10 { <ore:sandstoneRed>.add(<chisel:sandstonered1>.definition.makeStack(meta)); }
for meta in 0 .. 8 { <ore:sandstoneRed>.add(<chisel:sandstonered2>.definition.makeStack(meta)); }
for meta in 0 .. 16 { <ore:sandstoneRed>.add(<chisel:sandstonered-scribbles>.definition.makeStack(meta)); }

# Minecraft -- Soulsand -- add ore dict entry
<ore:blockSoulSand>.add(<minecraft:soul_sand>);

# Minecraft -- Stone -- add entries for the various kinds of vanilla stone
<ore:stoneGranite>.add(<minecraft:stone:2>);
<ore:stoneDiorite>.add(<minecraft:stone:4>);
<ore:stoneAndesite>.add(<minecraft:stone:6>);

# Minecraft -- Terracotta
for meta in 0 .. 16 {
    <ore:hardenedClay>.add(<minecraft:stained_hardened_clay>.definition.makeStack(meta));
}

# Railcraft -- Stones
<ore:stoneAbyssal>.add(<railcraft:generic:8>);
<ore:stoneQuarried>.add(<railcraft:generic:9>);
