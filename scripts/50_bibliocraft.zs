# Clipboard -- fix recipe to use black dye
recipes.remove(<bibliocraft:biblioclipboard>);
recipes.addShaped(<bibliocraft:biblioclipboard>, [
    [<ore:dyeBlack>, null, <ore:feather>],
    [<ore:paper>, <ore:paper>, <ore:paper>],
    [null, <minecraft:wooden_pressure_plate>, null],
]);

# Dyeable Items -- remove colored recipes
for meta in 1 .. 16 {
    recipes.remove(<bibliocraft:lampgold>.definition.makeStack(meta));
    recipes.remove(<bibliocraft:lampiron>.definition.makeStack(meta));
    recipes.remove(<bibliocraft:lanterngold>.definition.makeStack(meta));
    recipes.remove(<bibliocraft:lanterniron>.definition.makeStack(meta));
    recipes.remove(<bibliocraft:swordpedestal>.definition.makeStack(meta));
}
recipes.removeByRecipeName("bibliocraft:white_dyed_lampgold");
recipes.removeByRecipeName("bibliocraft:white_dyed_lampiron");
recipes.removeByRecipeName("bibliocraft:white_dyed_lanterngold");
recipes.removeByRecipeName("bibliocraft:white_dyed_lanterniron");
recipes.removeByRecipeName("bibliocraft:white_dyed_swordpedestal");

# Reading Glasses -- fix recipe to use black dye
recipes.remove(<bibliocraft:biblioglasses>);
recipes.addShaped(<bibliocraft:biblioglasses>, [
    [<minecraft:glass_pane>, <ore:itemMetalIngot>, <minecraft:glass_pane>],
    [<ore:dyeBlack>, null, <ore:dyeBlack>],
]);
