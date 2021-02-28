# Golden Pickaxe -- make the golden pickaxe automatically have silk touch
recipes.remove(<minecraft:golden_pickaxe>);
recipes.addShaped(<minecraft:golden_pickaxe>.withTag({ench: [{lvl: 1 as short, id: 33 as short}]}), [
    [<ore:ingotGold>, <ore:ingotGold>, <ore:ingotGold>],
    [null, <ore:stickWood>, null],
    [null, <ore:stickWood>, null],
]);

# Golden Shovel -- make the golden shovel automatically have silk touch
recipes.remove(<minecraft:golden_shovel>);
recipes.addShaped(<minecraft:golden_shovel>.withTag({ench: [{lvl: 1 as short, id: 33 as short}]}), [
    [<ore:ingotGold>],
    [<ore:stickWood>],
    [<ore:stickWood>],
]);
