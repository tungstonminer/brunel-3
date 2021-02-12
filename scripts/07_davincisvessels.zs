# Steam Engine -- replace with more compatible (and more difficult) recipe
recipes.remove(<davincisvessels:engine>);
recipes.addShaped(<davincisvessels:engine>, [
    [<railcraft:steam_oven>, <railcraft:steam_oven>, <minecraft:furnace>],
    [<railcraft:steam_oven>, <railcraft:steam_oven>, <minecraft:furnace>],
]);

# Helm -- replace with more challenging recipe
recipes.remove(<davincisvessels:marker>);
recipes.addShaped(<davincisvessels:marker>, [
    [<ore:stickWood>, <ore:gearIron>, null],
    [<ore:plankWood>, <cathedral:cathedral_chain_various:0>, null],
    [<ore:stickWood>, <ore:gearIron>, <ore:plankWood>],
]);
