# Animal Boat -- use gold plates instead of gold ingots
recipes.remove(<moarboats:animal_boat>);
recipes.addShaped(<moarboats:animal_boat>, [
    [<ore:plateGold>, <moarboats:modular_boat>, <ore:plateGold>],
    [<ore:plateGold>, <ore:plateGold>, <ore:plateGold>],
]);

# Boat Energy Battery -- use more compatible recipe
recipes.remove(<moarboats:boat_battery>);
recipes.addShaped(<moarboats:boat_battery>, [
    [<ore:dyeYellow>, null, <ore:dyeBlack>],
    [<ore:plateZinc>, <immersiveengineering:metal_device0:0>, <ore:plateZinc>],
    [<ore:plateZinc>, <ore:plateZinc>, <ore:plateZinc>],
]);

# Boat Energy Charger -- use more compatible recipe
recipes.remove(<moarboats:boat_energy_charger>);
recipes.addShaped(<moarboats:boat_energy_charger>, [
    [<ore:dyeYellow>, null, <ore:dyeBlack>],
    [<ore:plateZinc>, <railcraft:manipulator:10>, <ore:plateZinc>],
    [<ore:plateZinc>, <ore:plateZinc>, <ore:plateZinc>],
]);

# Boat Energy Discharger -- use more compatible recipe
recipes.remove(<moarboats:boat_energy_discharger>);
recipes.addShaped(<moarboats:boat_energy_discharger>, [
    [<ore:dyeYellow>, null, <ore:dyeBlack>],
    [<ore:plateZinc>, <railcraft:manipulator:11>, <ore:plateZinc>],
    [<ore:plateZinc>, <ore:plateZinc>, <ore:plateZinc>],
]);

# Boat Fluid Loader -- use a more compatible recipe
recipes.remove(<moarboats:boat_fluid_loader>);
recipes.addShaped(<moarboats:boat_fluid_loader>, [
    [<ore:plateZinc>, <railcraft:manipulator:4>, <ore:plateZinc>],
    [<ore:plateZinc>, <ore:plateZinc>, <ore:plateZinc>],
]);

# Boat Fluid Tank -- use a more compatible recipe
recipes.remove(<moarboats:boat_tank>);
recipes.addShaped(<moarboats:boat_tank>, [
    [<ore:plateZinc>, <railcraft:tank_iron_gauge>, <ore:plateZinc>],
    [<ore:plateZinc>, <railcraft:tank_iron_gauge>, <ore:plateZinc>],
]);

# Boat Fluid Unloader -- use a more compatible recipe
recipes.remove(<moarboats:boat_fluid_unloader>);
recipes.addShaped(<moarboats:boat_fluid_unloader>, [
    [<ore:plateZinc>, <railcraft:manipulator:5>, <ore:plateZinc>],
    [<ore:plateZinc>, <ore:plateZinc>, <ore:plateZinc>],
]);

# Chunk Loader -- interchangable with a Railcraft WorldSpike
recipes.remove(<moarboats:chunk_loader>);
recipes.addShapeless(<moarboats:chunk_loader>, [<railcraft:worldspike:3>]);
recipes.addShapeless(<railcraft:worldspike>, [<moarboats:chunk_loader>]);

# Diving Bottle -- use a more compatible recipe
recipes.remove(<moarboats:diving_bottle>);
recipes.addShaped(<moarboats:diving_bottle>, [
    [<ore:plateSteel>, <immersiveengineering:metal_decoration0:4>, <ore:plateSteel>],
    [<ore:plateSteel>, null, <ore:plateSteel>],
    [<ore:plateSteel>, <railcraft:tank_steel_valve>, <ore:plateSteel>],
]);

# Golden Ticket -- use recipe without redstone
recipes.remove(<moarboats:golden_ticket>);
recipes.addShaped(<moarboats:golden_ticket>, [
    [<ore:nuggetGold>, <ore:nuggetGold>, <ore:nuggetGold>],
    [<ore:paper>, <ore:paper>, <ore:paper>],
]);

# Helm -- use more compatible recipe
recipes.remove(<moarboats:helm>);
recipes.addShaped(<moarboats:helm>, [
    [<ore:plankWood>, <ore:stickIron>, <ore:gearBrass>],
    [null, <ore:plankWood>, <cathedral:cathedral_chain_various:4>],
    [<ore:slabWood>, <ore:slabWood>, <ore:gearBrass>],
]);

# IceBreaker -- allow exchanging with same item from Immersive Petroleum
recipes.remove(<moarboats:icebreaker>);
recipes.addShapeless(<moarboats:icebreaker>, [<immersivepetroleum:upgrades:1>]);
recipes.addShapeless(<immersivepetroleum:upgrades:1>, [<moarboats:icebreaker>]);

# Modular Boat -- change to more compatible recipe
recipes.remove(<moarboats:modular_boat>);
recipes.addShaped(<moarboats:modular_boat>, [
    [<ore:plateAluminum>, null, <ore:plateAluminum>],
    [<ore:plateAluminum>, <ore:plateAluminum>, <ore:plateAluminum>],
]);

# Paddles -- interchangable with the same item from Immersive Petroleum
recipes.remove(<moarboats:oars>);
recipes.addShapeless(<moarboats:oars>, [<immersivepetroleum:upgrades:4>]);
recipes.addShapeless(<immersivepetroleum:upgrades:4>, [<moarboats:oars>]);

# Rope -- make from IE hemp fiber
recipes.remove(<moarboats:rope>);
recipes.addShaped(<moarboats:rope>, [
    [<ore:fiberHemp>, null, <ore:fiberHemp>],
    [null, <ore:fiberHemp>, null],
    [<ore:fiberHemp>, null, <ore:fiberHemp>],
]);


# Rudder -- change to more compatible recipe
recipes.remove(<moarboats:rudder>);
recipes.addShaped(<moarboats:rudder>, [
    [null, null, <ore:plankWood>],
    [null, <ore:plateIron> | <ore:plateSteel>, <ore:plankWood>],
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
]);
