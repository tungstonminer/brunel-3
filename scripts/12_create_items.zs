#loader contenttweaker

import mods.contenttweaker.Block;
import mods.contenttweaker.Commands;
import mods.contenttweaker.Item;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.ResourceLocation;


########################################################################################################################

var lawnBlock = VanillaFactory.createBlock("lawn", <blockmaterial:grass>);
lawnBlock.setBlockHardness(0.6);
lawnBlock.setBlockResistance(0.6);
lawnBlock.setBlockSoundType(<soundtype:ground>);
lawnBlock.register();


var tinDust = VanillaFactory.createItem("tin_dust");
tinDust.creativeTab = <creativetab:Immersive Engineering>;
tinDust.maxStackSize = 32;
tinDust.register();

# TODO: add recipes for creating and using tin dust
