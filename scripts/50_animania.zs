import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

########################################################################################################################

val CARVING_QUANTITIES = [2, 2, 4, 3, 2, 3, 2] as int[];

val CLEAVER = <animania:carving_knife>;

val EGGS = [
    <minecraft:egg>,
    <animania:peacock_egg_blue>,
    <animania:peacock_egg_white>,
    <animania:brown_egg>,
    <betteranimalsplus:pheasant_egg>,
    <betteranimalsplus:turkey_egg>,
    <betteranimalsplus:goose_egg>,
] as IItemStack[];

val MEATS_RAW = [
    <minecraft:rabbit>,
    <animania:raw_peacock>,
    <animania:raw_prime_steak>,
    <animania:raw_prime_bacon>,
    <minecraft:chicken>,
    <minecraft:mutton>,
    <animania:raw_chevon>,
] as IItemStack[];

val MEATS_RAW_DICT_ENTRIES = [
    <ore:listAllbeefraw>,
    <ore:listAllchickenraw>,
    <ore:listAllmeatraw>,
    <ore:listAllmuttonraw>,
    <ore:listAllporkraw>,
    <ore:listAllrabbitraw>,
] as IOreDictEntry[];

val MEATS_COOKED = [
    <minecraft:cooked_rabbit>,
    <animania:cooked_peacock>,
    <animania:cooked_prime_steak>,
    <animania:cooked_prime_bacon>,
    <minecraft:cooked_chicken>,
    <minecraft:cooked_mutton>,
    <animania:cooked_chevon>,
] as IItemStack[];

val MEATS_COOKED_DICT_ENTRIES = [
    <ore:listAllbeefcooked>,
    <ore:listAllchickencooked>,
    <ore:listAllmeatcooked>,
    <ore:listAllmuttoncooked>,
    <ore:listAllporkcooked>,
    <ore:listAllrabbitcooked>,
] as IOreDictEntry[];

val PRIME_MEATS_RAW = [
    <animania:raw_prime_rabbit>,
    <animania:raw_prime_peacock>,
    <animania:raw_prime_beef>,
    <animania:raw_prime_pork>,
    <animania:raw_prime_chicken>,
    <animania:raw_prime_mutton>,
    <animania:raw_prime_chevon>,
] as IItemStack[];

val PRIME_MEATS_COOKED = [
    <animania:cooked_prime_rabbit>,
    <animania:cooked_prime_peacock>,
    <animania:cooked_prime_beef>,
    <animania:cooked_prime_pork>,
    <animania:cooked_prime_chicken>,
    <animania:cooked_prime_mutton>,
    <animania:cooked_prime_chevon>,
] as IItemStack[];


########################################################################################################################

# Cheese Mold -- allow any item metal in the recipe
recipes.remove(<animania:cheese_mold>);
recipes.addShaped(<animania:cheese_mold>, [
    [<ore:plankWood>, <ore:itemMetalIngot>, <ore:plankWood>],
    [null, <ore:plankWood>, null],
]);

# Carving Knife -- rename
CLEAVER.displayName = "Cleaver";

# Cooked Prime Meat -- remove from ore dict, and require carving first

# Omelette -- use any eggs
furnace.remove(<betteranimalsplus:fried_egg>);
furnace.remove(<animania:plain_omelette>);
for eggItem in EGGS {
    furnace.addRecipe(<animania:plain_omelette>, eggItem);
}

# Meats -- ensure all meats have the same recipes
for index in 0 to MEATS_RAW.length {
    var carvingQuantity as int = CARVING_QUANTITIES[index];
    var cookedMeatItem as IItemStack = MEATS_COOKED[index];
    var cookedPrimeMeatItem as IItemStack = PRIME_MEATS_COOKED[index];
    var rawMeatItem as IItemStack = MEATS_RAW[index];
    var rawPrimeMeatItem as IItemStack = PRIME_MEATS_RAW[index];

    # can cook raw meat
    furnace.remove(cookedMeatItem);
    furnace.addRecipe(cookedMeatItem, rawMeatItem);

    # can cook raw prime meat
    furnace.remove(cookedPrimeMeatItem);
    furnace.addRecipe(cookedPrimeMeatItem, rawPrimeMeatItem);

    # can carve raw prime meat to raw meat
    recipes.remove(rawMeatItem);
    recipes.addShapeless(rawMeatItem * carvingQuantity, [CLEAVER.transformDamage(), rawPrimeMeatItem]);

    # can carve cooked prime meat to cooked meat
    recipes.remove(cookedMeatItem);
    recipes.addShapeless(cookedMeatItem * carvingQuantity, [CLEAVER.transformDamage(), cookedPrimeMeatItem]);

    # remove raw prime meats from ore dict entries for ordinary meats
    for dictEntry in MEATS_RAW_DICT_ENTRIES {
        dictEntry.remove(rawPrimeMeatItem);
    }

    # remove cooked prime meats from ore dict entries for ordinary meats
    for dictEntry in MEATS_COOKED_DICT_ENTRIES {
        dictEntry.remove(cookedPrimeMeatItem);
    }
}
