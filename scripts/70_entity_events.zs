# This doesn't work.  The saving of the NBT data just creates a massively recursive data structure repeating the
# item's own data over and over.  I'm trying to get some help with this from the CraftTweaker author. -- TungstonMiner
#
#
# import crafttweaker.damage.IDamageSource;
# import crafttweaker.data.IData;
# import crafttweaker.entity.IEntityLivingBase;
# import crafttweaker.event.EntityLivingUpdateEvent;
#
#
# ########################################################################################################################
#
# val MAX_SWIMMING_TIME = 200;
#
# val LAND_ANIMALS = [
#     "Sheep",
# ] as string[];
#
#
# ########################################################################################################################
#
# events.onEntityLivingUpdate(function(event as EntityLivingUpdateEvent) {
#     if isNull(event) || isNull(event.entityLivingBase) || isNull(event.entityLivingBase.definition) {
#         return;
#     }
#
#     var entity as IEntityLivingBase = event.entityLivingBase;
#     if (!(LAND_ANIMALS has entity.definition.name)) {
#         return;
#     }
#
#     if !(entity.nbt has "isSwimmingForShore") {
#         print("entity " ~ entity.definition.name ~ " hasn't been initialized yet");
#
#         entity.nbt = entity.nbt.update({
#             isSwimmingForShore: false,
#             shoreYawAngle: 0.0,
#             enterWaterTime: 0,
#         });
#     }
#
#     if entity.nbt.isSwimmingForShore {
#         # in "swimming for shore" mode
#         if entity.isInWater {
#             # really is still swimming for shore
#             var enterWaterTime = entity.nbt.enterWaterTime;
#             if entity.world.time - enterWaterTime > MAX_SWIMMING_TIME {
#                 entity.attackEntityFrom(IDamageSource.DROWN(), 1);
#             }
#         } else {
#             # just got out of the water, time to switch modes
#             print("entity " ~ entity.definition.name ~ " just got out of the water");
#             entity.nbt = entity.nbt.update({
#                 isSwimmingForShore: false,
#                 shoreYawAngle: 0.0,
#                 enterWaterTime: 0,
#             });
#             print("changing NBT to: " ~ entity.nbt.asString());
#         }
#     } else {
#         # not yet swimming for shore
#         if entity.isInWater {
#             # just fell in the water, not swimming for shore yet
#             print("entity " ~ entity.definition.name ~ " just fell in the water at " ~ entity.world.time);
#             entity.rotationYaw = (entity.rotationYaw + 180) % 360;
#             entity.nbt = entity.nbt.update({
#                 isSwimmingForShore: true,
#                 shoreYawAngle: entity.rotationYaw,
#                 enterWaterTime: entity.world.time,
#             });
#             print("changing NBT to: " ~ entity.nbt.asString());
#         }
#     }
# });
