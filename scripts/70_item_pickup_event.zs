import crafttweaker.item.IItemStack;
import crafttweaker.event.PlayerItemPickupEvent;


########################################################################################################################

function cloneItemStack(itemStack as IItemStack, amount as int) as IItemStack {
    var result = itemStack.definition.makeStack(itemStack.metadata) * amount;
    if itemStack.hasTag {
        result = result.withTag(itemStack.tag);
    }
    return result;
}

val INVENTORY_SIZE = 36;

########################################################################################################################

events.onPlayerItemPickup(function(event as PlayerItemPickupEvent) {
    if isNull(event) || isNull(event.player) {
        return;
    }

    var player = event.player;
    for index in 0 .. INVENTORY_SIZE {
        var itemStack = player.getInventoryStack(index);
        if !isNull(itemStack) {
            if itemStack.amount > itemStack.maxStackSize {
                print("found stack which is too big " ~ itemStack.definition.id ~ "@" ~ itemStack.amount ~ "/" ~ itemStack.maxStackSize);
                var extraAmount = itemStack.amount;
                var replaceIndex = 0;

                player.replaceItemInInventory(index, cloneItemStack(itemStack, itemStack.maxStackSize));
                extraAmount -= itemStack.maxStackSize;
                print("placed " ~ itemStack.maxStackSize ~ " back at index " ~ index);

                while (extraAmount > 0) && (replaceIndex < INVENTORY_SIZE) {
                    if isNull(player.getInventoryStack(replaceIndex)) {
                        var toPlaceAmount = min(itemStack.maxStackSize, extraAmount);
                        print("placing " ~ toPlaceAmount ~ " at " ~ replaceIndex);

                        player.replaceItemInInventory(replaceIndex, cloneItemStack(itemStack, toPlaceAmount));
                        extraAmount -= toPlaceAmount;
                    }
                    replaceIndex += 1;
                }

                print("after placing in every available spot, there's still " ~ extraAmount ~ " left");
                if extraAmount > 0 {
                    print("dropping the surplus");
                    player.dropItem(cloneItemStack(itemStack, extraAmount));
                }
            }
        }
    }
});
