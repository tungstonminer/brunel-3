import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;


########################################################################################################################

print("Adjusting stack sizes...");

for itemDefinition in game.items {
    var item as IItemStack = itemDefinition.makeStack();
    if !isNull(item) {
        if item.isItemBlock || item.hasContainerItem {
            if item.maxStackSize > 4 {
                item.maxStackSize = 4;
            }

            var id = item.definition.id;

            if item.displayName has "Capacitor" { item.maxStackSize = 1; }
            else if id has "banner" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "bee_combs_" { item.maxStackSize = item.maxStackSize * 2; }
            else if id has "bottle" { item.maxStackSize = item.maxStackSize * 3; }
            else if id has "button" { item.maxStackSize = item.maxStackSize * 16; }
            else if id has "cake" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "carpet" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "chest" { item.maxStackSize = item.maxStackSize * 2; }
            else if id has "connector" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "door" { item.maxStackSize = item.maxStackSize * 2; }
            else if id has "fence" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "flower" { item.maxStackSize = item.maxStackSize * 16; }
            else if id has "gate" { item.maxStackSize = item.maxStackSize * 8; }
            else if id has "glass_pane" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "glasspane" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "glowstone" { item.maxStackSize = item.maxStackSize * 16; }
            else if id has "hay_bedding" { item.maxStackSize = item.maxStackSize * 16; }
            else if id has "hook" { item.maxStackSize = item.maxStackSize * 8; }
            else if id has "label" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "ladder" { item.maxStackSize = item.maxStackSize * 2; }
            else if id has "leaves" { item.maxStackSize = item.maxStackSize * 8; }
            else if id has "lever" { item.maxStackSize = item.maxStackSize * 8; }
            else if id has "lily" { item.maxStackSize = item.maxStackSize * 8; }
            else if id has "logic_gate" { item.maxStackSize = item.maxStackSize * 2; }
            else if id has "logic_wire" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "mapframe" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "mushroom" { item.maxStackSize = item.maxStackSize * 16; }
            else if id has "paintingframe" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "pipe" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "plant" { item.maxStackSize = item.maxStackSize * 8; }
            else if id has "post_metal" { item.maxStackSize = item.maxStackSize / 2; }
            else if id has "sapling" { item.maxStackSize = item.maxStackSize * 8; }
            else if id has "scaffolding_block" { item.maxStackSize = item.maxStackSize * 8; }
            else if id has "sheetmetal" { item.maxStackSize = item.maxStackSize * 4; }
            else if id has "slab" { item.maxStackSize = item.maxStackSize * 2; }
            else if id has "stairs" { item.maxStackSize = item.maxStackSize * 4 / 3; }
            else if id has "torch" { item.maxStackSize = item.maxStackSize * 8; }
            else if id has "track" { item.maxStackSize = item.maxStackSize * 2; }
            else if id has "trapdoor" { item.maxStackSize = item.maxStackSize * 2; }
            else if id has "vines" { item.maxStackSize = item.maxStackSize * 8; }

            # the following should come after the group above to avoid capturing partial words
            else if (id has "ore") && (!(id has "forestry")) { item.maxStackSize = item.maxStackSize / 2; }
            else if (id has "potion") && (!(id has "shelf")) { item.maxStackSize = item.maxStackSize * 3; }
        } else {
            if item.maxStackSize > 1 {
                item.maxStackSize = item.maxStackSize / 2;
            }
        }
    }
}
