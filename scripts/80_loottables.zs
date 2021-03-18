# This is a start at generating loot tables in ZenScript, but it's going to take more time than I currently have to get
# everything working correctly, so this is just disabled for now.

# import crafttweaker.item.IItemStack;
# import loottweaker.LootTweaker;
# import loottweaker.vanilla.loot.Functions;
# import loottweaker.vanilla.loot.LootFunction;
# import loottweaker.vanilla.loot.LootPool;
# import loottweaker.vanilla.loot.LootTable;
#
#
# ########################################################################################################################
#
# function addItem(
#     pool as LootPool,
#     itemWeight as int,
#     name as string,
#     itemStack as IItemStack,
#     funcs as LootFunction[]
# ) {
#     pool.addItemEntryHelper(itemStack, itemWeight, 0, funcs, [], name);
# }
#
# function addTable(
#     pool as LootPool,
#     tableWeight as int,
#     name as string,
#     tableName as string
# ) {
#     pool.addLootTableEntry(tableName, tableWeight, name);
# }
#
#
#
# ########################################################################################################################
#
# var pool as LootPool = null;
# var table as LootTable = null;
#
#
# # Generic Tables #######################################################################################################
#
# table = LootTweaker.newTable("brunel:general/food");
# pool = table.addPool("main", 0, 3, 0, 2);
# addItem(pool, 100, "beef-jerky",       <harvestcraft:beefjerkyitem>,           [Functions.setCount(1, 2)]);
# addItem(pool,  90, "pumpkin-seeds",    <harvestcraft:roastedpumpkinseedsitem>, [Functions.setCount(1, 2)]);
# addItem(pool,  80, "dried-soup",       <harvestcraft:driedsoupitem>,           [Functions.setCount(1, 2)]);
# addItem(pool,  70, "lemonaade",        <harvestcraft:lemonaideitem>,           [Functions.setCount(1, 2)]);
# addItem(pool,  60, "pb-cookies",       <harvestcraft:peanutbuttercookiesitem>, [Functions.setCount(1, 2)]);
# addItem(pool,  50, "minced-pie",       <harvestcraft:mincepieitem>,            []);
# addItem(pool,  40, "baken-ham",        <harvestcraft:bakedhamitem>,            []);
# addItem(pool,  30, "corned-beef",      <harvestcraft:cornedbeefitem>,          []);
# addItem(pool,  20, "chicken-sandwich", <harvestcraft:chickensandwichitem>,     []);
# addItem(pool,  10, "cheeseburger",     <harvestcraft:cheeseburgeritem>,        []);
#
# table = LootTweaker.newTable("brunel:chests/abandoned_mineshaft");
# pool = table.addPool("main", 4, 8, 0, 2);
# addItem( pool, 100, "cobblestone",     <minecraft:cobblestone>,          [Functions.setCount(1, 4)]);
# addTable(pool,  90, "food",            "brunel:general/food");
# addItem( pool,  80, "stick",           <minecraft:stick>,                [Functions.setCount(1, 2)]);
# addItem( pool
# addItem( pool,  60, "iron-pickaxe",    <minecraft:iron_pickaxe>,         [Functions.setDamage(0, 1.0)]);
# addItem( pool,  50, "track",           <minecraft:rail>,                 [Functions.setCount(1, 4)]);
# addItem( pool,  25, "abandoned-track", <railcraft:track_flex_abandoned>, [Functions.setCount(1, 4)]);
# addItem( pool,  10, "goggles",         <railcraft:armor_goggles>,        [Functions.setDamage(0, 1.0)]);
#
#
# # Location Tables ######################################################################################################
#
# table = LootTweaker.getTable("minecraft:chests/abandoned_mineshaft");
# table.clear();
#
# pool = table.addPool("brunel-main", 4, 8, 0, 4);
