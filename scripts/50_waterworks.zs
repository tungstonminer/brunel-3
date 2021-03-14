########################################################################################################################

# Water Pipe -- replace with more compatible recipe
val PIPE_PLATE = <ore:plateAluminum> | <ore:plateCopper> | <ore:plateTin>;
<waterworks:water_pipe>.maxStackSize = 32;
recipes.remove(<waterworks:water_pipe>);
recipes.addShaped(<waterworks:water_pipe> * 6, [
    [PIPE_PLATE],
    [PIPE_PLATE],
    [PIPE_PLATE],
]);

# Groundwater Pump -- add a recipe which suites the modpack
recipes.addShaped(<waterworks:groundwater_pump>, [
    [<immersiveengineering:metal_device0:5>],
    [<immersiveengineering:material:8>],
    [<waterworks:water_pipe>],
]);
