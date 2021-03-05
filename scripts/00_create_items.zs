#loader contenttweaker

import mods.contenttweaker.Block;
import mods.contenttweaker.Commands;
import mods.contenttweaker.Item;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.ResourceLocation;


########################################################################################################################

val IRON_AXE = <minecraft:iron_axe>;


########################################################################################################################

var blackDye = VanillaFactory.createItem("black_dye");
blackDye.creativeTab = <creativetab:misc>;
blackDye.maxStackSize = 32;
blackDye.register();

var blueDye = VanillaFactory.createItem("blue_dye");
blueDye.creativeTab = <creativetab:misc>;
blueDye.maxStackSize = 32;
blueDye.register();

var bronzeAxe = VanillaFactory.createItem("bronze_axe");
bronzeAxe.creativeTab = IRON_AXE.
bronzeAxe.maxStackSize = 32;
bronzeAxe.register();

var bronzeDust = VanillaFactory.createItem("bronze_dust");
bronzeDust.creativeTab = <creativetab:immersiveengineering>;
bronzeDust.maxStackSize = 32;
bronzeDust.register();

var brownDye = VanillaFactory.createItem("brown_dye");
brownDye.creativeTab = <creativetab:misc>;
brownDye.maxStackSize = 32;
brownDye.register();

var lawnBlock = VanillaFactory.createBlock("lawn", <blockmaterial:grass>);
lawnBlock.creativeTab = <creativetab:decorations>;
lawnBlock.setBlockHardness(0.6);
lawnBlock.setBlockResistance(0.6);
lawnBlock.setBlockSoundType(<soundtype:ground>);
lawnBlock.register();

var tinDust = VanillaFactory.createItem("tin_dust");
tinDust.creativeTab = <creativetab:immersiveengineering>;
tinDust.maxStackSize = 32;
tinDust.register();

var whiteDye = VanillaFactory.createItem("white_dye");
whiteDye.creativeTab = <creativetab:misc>;
whiteDye.maxStackSize = 32;
whiteDye.register();

var zincDust = VanillaFactory.createItem("zinc_dust");
zincDust.creativeTab = <creativetab:immersiveengineering>;
zincDust.maxStackSize = 32;
zincDust.register();
