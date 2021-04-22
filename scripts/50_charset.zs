########################################################################################################################

# Redstone Cable -- require copper or gold instead of iron
recipes.remove(<charset:logic_wire_n>);
recipes.addShaped(<charset:logic_wire_n>, [
    [<ore:dustRedstone>],
    [<ore:ingotCopper>],
    [<ore:dustRedstone>],
]);
recipes.addShaped(<charset:logic_wire_n> * 2, [
    [<ore:dustRedstone>],
    [<ore:ingotGold>],
    [<ore:dustRedstone>],
]);
