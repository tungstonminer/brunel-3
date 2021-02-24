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
<ore:foodEelraw>.add(<betteranimalsplus:eel_meat_raw>);
<ore:listAllmeatcooked>.add(<animania:cooked_peacock>);
<ore:listAllmeatraw>.add(<animania:raw_peacock>);

# Concrete Powder
for meta in 0 .. 16 {
    <ore:concretePowder>.add(<minecraft:concrete_powder>.definition.makeStack(meta));
}

# Terracotta
for meta in 0 .. 16 {
    <ore:hardenedClay>.add(<minecraft:stained_hardened_clay>.definition.makeStack(meta));
}

# Pressed Wax
<ore:itemBeeswax>.add(<harvestcraft:beeswaxitem>);
