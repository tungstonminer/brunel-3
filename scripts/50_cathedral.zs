# Checkered -- adjust to avoid collision with Kitchen Tile
recipes.remove(<cathedral:basalt_block_checkered>);
recipes.addShaped(<cathedral:basalt_block_checkered> * 4, [
    [<ore:blockBasalt>, <ore:blockMarble>],
    [<ore:blockMarble>, <ore:blockBasalt>],
]);
