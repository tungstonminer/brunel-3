import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;

print("Adjusting stack sizes...");

for itemDefinition in game.items {
    var item as IItemStack = itemDefinition.makeStack();
    if !isNull(item) {
        if item.isItemBlock || item.hasContainerItem {
            if item.maxStackSize > 4 {
                item.maxStackSize = 4;
            }
        } else {
            if item.maxStackSize > 1 {
                item.maxStackSize = item.maxStackSize / 2;
            }
        }
    }
}
