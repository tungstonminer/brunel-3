# Crushing Hammer -- adjust recipe to not require metals
recipes.remove(<engineerstools:crushing_hammer>);
recipes.addShaped(<engineerstools:crushing_hammer>, [
    [null, <ore:stone>, <ore:string>],
    [null, <ore:stickWood>, <minecraft:flint>],
    [<ore:stickWood>, null, null]
]);
