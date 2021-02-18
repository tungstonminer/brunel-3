import crafttweaker.item.IItemStack;

########################################################################################################################

val CARVING_KNIFE = <animania:carving_knife>;

val PRIME_MEATS = [
    <animania:raw_prime_rabbit>,
    <animania:raw_prime_peacock>,
    <animania:raw_prime_beef>,
    <animania:raw_prime_pork>,
    <animania:raw_prime_chicken>,
    <animania:raw_prime_mutton>,
    <animania:raw_prime_chevon>,
] as IItemStack[];

val STEAKS = [
    <minecraft:rabbit>,
    <animania:raw_peacock>,
    <animania:raw_prime_steak>,
    <animania:raw_prime_bacon>,
    <minecraft:chicken>,
    <minecraft:mutton>,
    <animania:raw_chevon>,
] as IItemStack[];

val STEAK_QUANTITY = [2, 2, 4, 3, 2, 3, 2] as int[];


########################################################################################################################

# Cheese Mold -- allow any item metal in the recipe
recipes.remove(<animania:cheese_mold>);
recipes.addShaped(<animania:cheese_mold>, [
    [<ore:plankWood>, <ore:itemMetalIngot>, <ore:plankWood>],
    [null, <ore:plankWood>, null],
]);


# Raw Prime Meat -- remove it from ordinary meat ore dict entries
recipes.remove(<animania:raw_prime_steak>);
for index, primeMeatItem in PRIME_MEATS {
    val steakItem as IItemStack = STEAKS[index];
    val quantity as int = STEAK_QUANTITY[index];

    recipes.remove(steakItem);
    recipes.addShapeless(steakItem * quantity, [CARVING_KNIFE.transformDamage(), primeMeatItem]);
}

<ore:listAllmeatraw>.removeItems(PRIME_MEATS);
<ore:listAllbeefraw>.removeItems(PRIME_MEATS);
<ore:listAllporkraw>.removeItems(PRIME_MEATS);
<ore:listAllchickenraw>.removeItems(PRIME_MEATS);
<ore:listAllmuttonraw>.removeItems(PRIME_MEATS);
