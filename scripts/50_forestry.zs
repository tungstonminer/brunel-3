import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.forestry.Moistener;
import mods.forestry.Squeezer;
import mods.immersiveengineering.BottlingMachine;
import mods.jei.JEI;

########################################################################################################################

val HONEY_CAPSULE = <forestry:capsule:1>.withTag({Fluid: {FluidName: "for.honey", Amount: 1000}});


########################################################################################################################

# Ambrosia -- limit receipt to only use honey capsules
recipes.remove(<forestry:ambrosia>);
recipes.addShaped(<forestry:ambrosia>, [
    [<ore:dropHoneydew>, HONEY_CAPSULE, <ore:dropHoneydew>],
    [<ore:dropRoyalJelly>, <ore:dropRoyalJelly>, <ore:dropRoyalJelly>],
    [<ore:dropHoneydew>, <ore:dropHoneydew>, <ore:dropHoneydew>]
]);

# Compost -- Allow making compost out of any grain
recipes.remove(<forestry:fertilizer_bio>);
recipes.addShaped(<forestry:fertilizer_bio> * 2, [
    [null, <ore:listAllgrain>, null],
    [<ore:listAllgrain>, <ore:dirt>, <ore:listAllgrain>],
    [null, <ore:listAllgrain>, null],
]);
recipes.addShaped(<forestry:fertilizer_bio>, [
    [null, <ore:dustAsh>, null],
    [<ore:dustAsh>, <ore:dirt>, <ore:dustAsh>],
    [null, <ore:dustAsh>, null],
]);

# Greenhouse -- Hide everything to do with the defunct Greenhouse
JEI.removeAndHide(<forestry:crafting_material:7>);
JEI.removeAndHide(<forestry:greenhouse:0>);
JEI.removeAndHide(<forestry:greenhouse:3>);
JEI.removeAndHide(<forestry:greenhouse:4>);
JEI.removeAndHide(<forestry:greenhouse:5>);
JEI.removeAndHide(<forestry:climatiser:0>);
JEI.removeAndHide(<forestry:climatiser:1>);
JEI.removeAndHide(<forestry:climatiser:2>);
JEI.removeAndHide(<forestry:climatiser:3>);
JEI.removeAndHide(<forestry:climatiser:4>);
JEI.removeAndHide(<forestry:greenhouse.window>);
JEI.removeAndHide(<forestry:greenhouse.window_up>);

# Honey Pot -- fix recipe to only allow honey
recipes.remove(<forestry:honey_pot>);
recipes.addShaped(<forestry:honey_pot>, [
    [<ore:dropHoney>, null, <ore:dropHoney>],
    [null, HONEY_CAPSULE, null],
    [<ore:dropHoney>, null, <ore:dropHoney>],
]);

# Mulch -- Add recipes to return various things into mulch
BottlingMachine.addRecipe(<forestry:mulch>, <harvestcraft:fruitbaititem>, <liquid:water> * 10);
BottlingMachine.addRecipe(<forestry:mulch>, <harvestcraft:veggiebaititem>, <liquid:water> * 20);
BottlingMachine.addRecipe(<forestry:mulch>, <harvestcraft:grainbaititem>, <liquid:water> * 40);

# Squeezer -- Remove recipes for things transferred to the IE Squeezer
Squeezer.removeRecipe(<liquid:biomass>);
Squeezer.removeRecipe(<liquid:for.honey>);
Squeezer.removeRecipe(<liquid:juice>);
Squeezer.removeRecipe(<liquid:seed.oil>);
Squeezer.removeRecipe(<liquid:water>);
