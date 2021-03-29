import crafttweaker.item.IItemStack;
import crafttweaker.event.PlayerAnvilRepairEvent;

########################################################################################################################

events.onPlayerAnvilRepair(function(event as PlayerAnvilRepairEvent) {
    if isNull(event) {
        return;
    }

    if isNull(event.itemIngredient) {
        event.xpCost = 0;
        
    }
});
