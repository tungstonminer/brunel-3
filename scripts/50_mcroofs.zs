import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;


########################################################################################################################

val COLORS = ["black", "gray", "light_gray", "white"] as string[];

val DYES = {
    "black": <ore:dyeBlack>,
    "gray": <ore:dyeGray>,
    "light_gray": <ore:dyeLightGray>,
    "white": <ore:dyeWhite>,
} as IOreDictEntry[string];

val GUTTER_ITEMS = {
    "base": [
        <mcwroofs:gutter_base>,
        <mcwroofs:gutter_bot>,
        <mcwroofs:gutter_corner>,
        <mcwroofs:gutter_middle>,
        <mcwroofs:gutter_top>,
        <mcwroofs:rec_tile>,
    ],
    "black": [
        <mcwroofs:gutter_base_black>,
        <mcwroofs:gutter_bot_black>,
        <mcwroofs:gutter_corner_black>,
        <mcwroofs:gutter_middle_black>,
        <mcwroofs:gutter_top_black>,
        <mcwroofs:rec_tile_black>,
    ],
    "gray": [
        <mcwroofs:gutter_base_gray>,
        <mcwroofs:gutter_bot_gray>,
        <mcwroofs:gutter_corner_gray>,
        <mcwroofs:gutter_middle_gray>,
        <mcwroofs:gutter_top_gray>,
        <mcwroofs:rec_tile_gray>,
    ],
    "light_gray": [
        <mcwroofs:gutter_base_light_gray>,
        <mcwroofs:gutter_bot_light_gray>,
        <mcwroofs:gutter_corner_light_gray>,
        <mcwroofs:gutter_middle_light_gray>,
        <mcwroofs:gutter_top_light_gray>,
        <mcwroofs:rec_tile_light_gray>,
    ],
    "white": [
        <mcwroofs:gutter_base_white>,
        <mcwroofs:gutter_bot_white>,
        <mcwroofs:gutter_corner_white>,
        <mcwroofs:gutter_middle_white>,
        <mcwroofs:gutter_top_white>,
        <mcwroofs:rec_tile_white>,
    ],
} as IItemStack[][string];


########################################################################################################################

for color in COLORS {
    for index in 0 .. GUTTER_ITEMS.base.length {
        var inputItem = GUTTER_ITEMS.base[index];
        var outputItem = GUTTER_ITEMS[color][index];
        var dyeItem = DYES[color];

        recipes.remove(outputItem);
        recipes.addShaped(outputItem * 8, [
            [inputItem, inputItem, inputItem],
            [inputItem, dyeItem, inputItem],
            [inputItem, inputItem, inputItem],
        ]);
    }
}
