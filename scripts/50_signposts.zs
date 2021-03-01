import mods.chisel.Carving;


########################################################################################################################

# Signpost Brush -- allow any item metal
recipes.remove(<signpost:itembrush>);
recipes.addShaped(<signpost:itembrush>, [
    [<ore:blockWool>],
    [<ore:itemMetalIngot>],
    [<ore:stickWood>],
]);

# Signpost Wrench -- allow any tool metal
recipes.remove(<signpost:itemwrench>);
recipes.addShaped(<signpost:itemwrench>, [
    [<ore:toolMetalIngot>, <ore:toolMetalIngot>, null],
    [<ore:toolMetalIngot>, <ore:stickWood>, null],
    [<ore:stickWood>, null, null],
]);

# Waystone -- add missing recipes
recipes.addShaped(<signpost:blockbase>, [
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
    [<minecraft:stone>, <minecraft:compass>, <minecraft:stone>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
]);

Carving.addGroup("waystone");
Carving.addVariation("waystone", <signpost:blockbase>);
Carving.addVariation("waystone", <signpost:blockbasemodel0>);
Carving.addVariation("waystone", <signpost:blockbasemodel1>);
Carving.addVariation("waystone", <signpost:blockbasemodel2>);
Carving.addVariation("waystone", <signpost:blockbasemodel3>);
Carving.addVariation("waystone", <signpost:blockbasemodel4>);
