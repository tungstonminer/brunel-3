import mods.jei.JEI;


########################################################################################################################

# Positive Chisel Design -- use blue dye
recipes.removeByRecipeName("chiselsandbits:positiveprint");
recipes.addShapeless(<chiselsandbits:positiveprint>, [
    <chiselsandbits:block_bit>, <ore:paper>, <ore:dyeBlue>
]);

# Mirror Chisel Design -- use blue dye
recipes.removeByRecipeName("chiselsandbits:mirrorprint");
recipes.addShapeless(<chiselsandbits:mirrorprint>, [
    <chiselsandbits:block_bit>, <ore:paper>, <ore:dyeYellow>
]);

# Negative Chisel Design -- use blue dye
recipes.removeByRecipeName("chiselsandbits:negativeprint");
recipes.addShapeless(<chiselsandbits:negativeprint>, [
    <chiselsandbits:block_bit>, <ore:paper>, <ore:dyeRed>
]);
