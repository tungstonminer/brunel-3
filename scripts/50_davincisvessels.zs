########################################################################################################################

# Anchor Point
recipes.remove(<davincisvessels:anchorpoint>);
recipes.addShaped(<davincisvessels:anchorpoint>, [
    [null, <ore:ingotIron>, null],
    [<ore:stickIron>, <ore:ingotIron>, <ore:stickIron>],
    [<ore:ingotIron>, <ore:blockIron>, <ore:ingotIron>],
]);

# Balloon -- only allow plain balloons from white wool
recipes.remove(<davincisvessels:balloon:0>);
recipes.addShapeless(<davincisvessels:balloon:0>, [<ore:blockWoolWhite>, <ore:string>]);

# Balloon -- allow unmaking balloons to recover materials
recipes.addShapeless(<minecraft:wool:0>, [<davincisvessels:balloon>.transformReplace(<minecraft:string>)]);

# Floater
recipes.remove(<davincisvessels:floater>);
recipes.addShaped(<davincisvessels:floater> * 8, [
    [<ore:blockWoolWhite>, <ore:blockWoolWhite>, <ore:blockWoolWhite>],
    [<ore:blockWoolWhite>, null, <ore:blockWoolWhite>],
    [<ore:blockWoolWhite>, <ore:blockWoolWhite>, <ore:blockWoolWhite>],
]);

# Gauge (basic)
recipes.remove(<davincisvessels:gauge:0>);
recipes.addShaped(<davincisvessels:gauge:0>, [
    [<rsgauges:flatgauge1>, <rsgauges:flatgauge6>, <rsgauges:flatgauge1>],
    [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
]);

# Gauge (advanced)
recipes.remove(<davincisvessels:gauge:1>);
recipes.addShaped(<davincisvessels:gauge:1>, [
    [<rsgauges:flatgauge2>, <davincisvessels:gauge:0>, <rsgauges:flatgauge5>],
]);

# Seat
recipes.remove(<davincisvessels:seat>);
recipes.addShaped(<davincisvessels:seat>, [
    [<ore:blockWoolRed>, null, null],
    [<ore:blockWoolRed>,  <ore:blockWoolRed>, null],
    [<ore:slabWood>, <ore:slabWood>, null],
]);

# Secured Bed
recipes.remove(<davincisvessels:securedbed>);
recipes.addShaped(<davincisvessels:securedbed>, [
    [null, <minecraft:bed:14>, null],
    [<mcwbridges:iron_rod>, <mcwbridges:iron_rod>, <mcwbridges:iron_rod>],
]);

# Ship's Helm
recipes.remove(<davincisvessels:marker>);
recipes.addShaped(<davincisvessels:marker>, [
    [<animania:wheel>, <ore:stickIron>, <ore:gearBrass>],
    [null, <ore:plankWood>, <cathedral:cathedral_chain_various:4>],
    [<ore:slabWood>, <ore:slabWood>, <ore:gearBrass>],
]);

# Shore Buffer
recipes.remove(<davincisvessels:buffer>);
recipes.addShaped(<davincisvessels:buffer>, [
    [<ore:logWood>, <ore:blockWoolGray>],
]);

# Steam Engine
recipes.remove(<davincisvessels:engine>);
recipes.addShaped(<davincisvessels:engine>, [
    [],
    [<railcraft:tank_steel_wall>, <railcraft:tank_steel_valve>, <ore:gearSteel>],
    [<railcraft:boiler_firebox_solid>, <railcraft:boiler_firebox_solid>, <railcraft:boiler_firebox_solid>],
]);
