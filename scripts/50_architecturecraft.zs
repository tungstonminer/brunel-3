########################################################################################################################

# Architect's Chisel -- allow any blade metal
recipes.remove(<architecturecraft:chisel>);
recipes.addShaped(<architecturecraft:chisel>, [
    [<ore:bladeMetalIngot>],
    [<ore:dyeOrange>, <ore:stickWood>],
]);

# Architect's Hammer -- allow any tool metal
recipes.remove(<architecturecraft:hammer>);
recipes.addShaped(<architecturecraft:hammer>, [
    [<ore:toolMetalIngot>, <ore:toolMetalIngot>, null],
    [<ore:dyeOrange>, <ore:stickWood>, <ore:toolMetalIngot>],
    [<ore:dyeOrange>, <ore:stickWood>, null],
]);

# Architect's Sawbench -- allow any tool metal
recipes.remove(<architecturecraft:sawbench>);
recipes.addShaped(<architecturecraft:sawbench>, [
    [<ore:toolMetalIngot>, <architecturecraft:sawblade>, <ore:toolMetalIngot>],
    [<ore:stickWood>, <architecturecraft:largepulley>, <ore:stickWood>],
    [<ore:stickWood>, <minecraft:wooden_pressure_plate>, <ore:stickWood>],
]);

# Circular Sawblade -- allow any blade metal
recipes.remove(<architecturecraft:sawblade>);
recipes.addShaped(<architecturecraft:sawblade>, [
    [null, <ore:bladeMetalIngot>, null],
    [<ore:bladeMetalIngot>, <ore:stickWood>, <ore:bladeMetalIngot>],
    [null, <ore:bladeMetalIngot>, null],
]);
