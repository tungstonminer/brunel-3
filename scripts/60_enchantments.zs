########################################################################################################################

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

# Steel Pickaxe -- allow adding an electrum coating to make it have silk touch
recipes.addShaped(<immersiveengineering:pickaxe_steel>.withTag({ench: [{lvl: 1 as short, id: 33 as short}]}), [
    [<ore:ingotElectrum>, <ore:ingotElectrum>, <ore:ingotElectrum>],
    [null, <immersiveengineering:pickaxe_steel>, null],
    [null, <immersiveposts:metal_rods:6>, null],
]);

# Steel Shovel -- allow adding an electrum coating to make it have silk touch
recipes.addShaped(<immersiveengineering:shovel_steel>.withTag({ench: [{lvl: 1 as short, id: 33 as short}]}), [
    [<ore:ingotElectrum>],
    [<immersiveengineering:shovel_steel>],
    [<immersiveposts:metal_rods:6>],
]);
