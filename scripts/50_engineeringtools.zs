########################################################################################################################

# Crushing Hammer -- adjust recipe to not require metals
recipes.remove(<engineerstools:crushing_hammer>);
recipes.addShaped(<engineerstools:crushing_hammer>, [
    [null, <ore:stone>, <ore:string>],
    [null, <ore:stickWood>, <minecraft:flint>],
    [<ore:stickWood>, null, null]
]);

# Sleeping Bag -- make recipe *much* simpler
recipes.remove(<engineerstools:sleeping_bag>);
recipes.addShaped(<engineerstools:sleeping_bag>, [
    [<ore:blockWool>, <ore:blockWool>, <ore:blockWool>],
]);
