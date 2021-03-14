########################################################################################################################

var salve = <roughtweaks:salve>;
var plaster = <roughtweaks:plaster>;
var bandage = <roughtweaks:bandage>;
var medikit = <roughtweaks:medikit>;

var plates = <ore:plateTin> | <ore:plateAluminum> | <ore:plateCopper>;
var healingPotion = <minecraft:potion>.withTag({Potion: "minecraft:healing"});


########################################################################################################################

# Replace Salve recipe
recipes.remove(salve);
recipes.addShapeless(salve, [<ore:listAllmilk>, <ore:cropAgave>, <ore:listAllsugar>, <minecraft:bowl>]);

# Replace Plaster recipe
recipes.remove(plaster);
recipes.addShapeless(plaster, [salve, salve, <ore:itemBeeswax>, <ore:paper>]);

# Replace Bandage recipe
recipes.remove(bandage);
recipes.addShapeless(bandage, [plaster, plaster, <ore:fabricHemp>, <ore:string>]);

# Replace Medikit recipe
recipes.remove(medikit);
recipes.addShapeless(medikit, [bandage, bandage, plates, healingPotion]);
