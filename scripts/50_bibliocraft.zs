# Clipboard -- fix recipe to use black dye
recipes.remove(<bibliocraft:biblioclipboard>);
recipes.addShaped(<bibliocraft:biblioclipboard>, [
    [<ore:dyeBlack>, null, <ore:feather>],
    [<ore:paper>, <ore:paper>, <ore:paper>],
    [null, <minecraft:wooden_pressure_plate>, null],
]);

# Cookie Jar -- allow any light-colored metal
val COOKIE_JAR_METAL = <ore:ingotAluminum> | <ore:ingotIron> | <ore:ingotTin>;
recipes.remove(<bibliocraft:cookiejar>);
recipes.addShaped(<bibliocraft:cookiejar>, [
    [null, COOKIE_JAR_METAL, null],
    [<minecraft:glass_pane>, <minecraft:cookie>, <minecraft:glass_pane>],
    [<minecraft:glass_pane>, <ore:dustRedstone>, <minecraft:glass_pane>],
]);

# Desk Bell -- allow any item metal
recipes.remove(<bibliocraft:bell>);
recipes.addShaped(<bibliocraft:bell>, [
    [null, <minecraft:stone_button>, null],
    [null, <ore:itemMetalIngot>, null],
    [<ore:itemMetalIngot>, <ore:dustRedstone>, <ore:itemMetalIngot>],
]);

# Drafting Compass-- allow any item metal
recipes.remove(<bibliocraft:maptool>);
recipes.addShaped(<bibliocraft:maptool>, [
    [null, <ore:itemMetalIngot>, null],
    [<ore:itemMetalIngot>, null, <ore:itemMetalIngot>],
    [<ore:stickWood>, null, <ore:stickWood>],
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

# Framing Saw -- allow any item metal
recipes.remove(<bibliocraft:framingsaw>);
recipes.addShaped(<bibliocraft:framingsaw>, [
    [<ore:toolMetalIngot>, <ore:toolMetalIngot>, null],
    [null, <ore:toolMetalIngot>, <ore:plankWood>],
    [null, null, <ore:plankWood>],
]);

# Reading Glasses -- fix recipe to use black dye
recipes.remove(<bibliocraft:biblioglasses>);
recipes.addShaped(<bibliocraft:biblioglasses>, [
    [<minecraft:glass_pane>, <ore:itemMetalIngot>, <minecraft:glass_pane>],
    [<ore:dyeBlack>, null, <ore:dyeBlack>],
]);

# Tape Measure -- allow any item metal
recipes.remove(<bibliocraft:tapemeasure>);
recipes.addShaped(<bibliocraft:tapemeasure>, [
    [null, <ore:itemMetalIngot>, null],
    [<ore:itemMetalIngot>, <bibliocraft:tape>, <ore:itemMetalIngot>],
    [null, <ore:itemMetalIngot>, null],
]);
