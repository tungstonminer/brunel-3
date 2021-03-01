# Redstone Cable -- require copper or gold instead of iron
recipes.remove(<charset:logic_wire_n>);
recipes.addShaped(<charset:logic_wire_n>, [
    [null, <ore:dustRedstone>, null],
    [<ore:dustRedstone>, <ore:ingotCopper> | <ore:ingotGold>, <ore:dustRedstone>],
    [null, <ore:dustRedstone>, null],
]);
