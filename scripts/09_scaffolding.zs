# Scaffolding Block -- make recipe less generous, but allow any planks
recipes.remove(<scaffolding:scaffolding_block>);
recipes.addShaped(<scaffolding:scaffolding_block> * 32, [
    [<ore:plankWood>, <ore:stickWood>, <ore:plankWood>],
    [<ore:stickWood>, <ore:itemMetalIngot>, <ore:stickWood>],
    [<ore:plankWood>, <ore:stickWood>, <ore:plankWood>],
]);
