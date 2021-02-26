import crafttweaker.item.IItemStack;
import crafttweaker.event.PlayerItemPickupEvent;


########################################################################################################################

function cloneItemStack(itemStack as IItemStack, amount as int) as IItemStack {
    return itemStack.definition.makeStack(itemStack.metadata) * amount;
}

########################################################################################################################

events.onPlayerItemPickup(function(event as PlayerItemPickupEvent) {
    if isNull(event) || isNull(event.player) {
        return;
    }

    var player = event.player;
    for index in 0 .. player.inventorySize {
        var itemStack = player.getInventoryStack(index);
        if !isNull(itemStack) {
            if itemStack.amount > itemStack.maxStackSize {
                var extraAmount = itemStack.amount - itemStack.maxStackSize;
                var replaceIndex = 9;  # skip hotbar

                player.replaceItemInInventory(index, cloneItemStack(itemStack, itemStack.maxStackSize));

                while (extraAmount > 0) && (replaceIndex < player.inventorySize) {
                    if isNull(player.getInventoryStack(replaceIndex)) {
                        var toPlaceAmount = min(itemStack.maxStackSize, extraAmount);
                        extraAmount -= toPlaceAmount;

                        player.replaceItemInInventory(replaceIndex, cloneItemStack(itemStack, toPlaceAmount));
                    }
                    replaceIndex += 1;
                }

                if extraAmount > 0 {
                    player.dropItem(itemStack.definition.makeStack() * extraAmount);
                }
            }
        }
    }
});
