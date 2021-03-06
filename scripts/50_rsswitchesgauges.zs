# replace iron nuggets with any item metal nuggets
recipes.replaceAllOccurences(<minecraft:iron_nugget>, <ore:itemMetalNugget>, <*>.only(function(itemStack) {
    return itemStack.definition.owner == "rsgauges";
}));
