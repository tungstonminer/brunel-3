# This doesn't work.  It seems to try to spread things out, but it doesn't actually change the inventory as expected.
# Instead, the "new" stacks never appear, but when you pick up one of the affected stacks or attempt to sort your
# inventory, everything goes back to where it started.  -- TungstonMiner
#
# import crafttweaker.item.IItemStack;
# import crafttweaker.event.PlayerItemPickupEvent;
#
#
# ########################################################################################################################
#
# function cloneItemStack(itemStack as IItemStack, amount as int) as IItemStack {
#     return itemStack.definition.makeStack(itemStack.metadata) * amount;
# }
#
# ########################################################################################################################
#
# events.onPlayerItemPickup(function(event as PlayerItemPickupEvent) {
#     var player = client.player;
#     for index in 0 .. player.inventorySize {
#         var itemStack = player.getInventoryStack(index);
#         if !isNull(itemStack) {
#             if itemStack.amount > itemStack.maxStackSize {
#                 var extraAmount = itemStack.amount - itemStack.maxStackSize;
#                 var replaceIndex = 0;
#
#                 player.replaceItemInInventory(index, cloneItemStack(itemStack, itemStack.maxStackSize));
#
#                 while (extraAmount > 0) && (replaceIndex < player.inventorySize) {
#                     if isNull(player.getInventoryStack(replaceIndex)) {
#                         var toPlaceAmount = min(itemStack.maxStackSize, extraAmount);
#                         extraAmount -= toPlaceAmount;
#
#                         player.replaceItemInInventory(replaceIndex, cloneItemStack(itemStack, toPlaceAmount));
#                     }
#                     replaceIndex += 1;
#                 }
#
#                 if extraAmount > 0 {
#                     player.dropItem(itemStack.definition.makeStack() * extraAmount);
#                 }
#             }
#         }
#     }
# });
