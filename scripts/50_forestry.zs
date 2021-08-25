import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.forestry.Moistener;
import mods.forestry.Squeezer;
import mods.immersiveengineering.BottlingMachine;
import mods.immersiveengineering.Crusher;
import mods.immersiveengineering.Mixer;
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

# Gear -- remove recipes in preference for the one from railcraft
JEI.removeAndHide(<forestry:gear_bronze>);

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

# Mulch -- add a crusher recipe
Crusher.addRecipe(<forestry:mulch>, <ore:listAllveggie>, 256);

# Short Mead -- add mixer recipe
Mixer.addRecipe(
    <liquid:short.mead> * 4000,
    <liquid:for.honey> * 4000,
    [<forestry:mulch>, <forestry:honeydew> * 4],
    4096
);

# Squeezer -- Remove recipes for things transferred to the IE Squeezer
Squeezer.removeRecipe(<liquid:biomass>);
Squeezer.removeRecipe(<liquid:for.honey>);
Squeezer.removeRecipe(<liquid:juice>);
Squeezer.removeRecipe(<liquid:seed.oil>);
Squeezer.removeRecipe(<liquid:water>);
