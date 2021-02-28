# Exchange Machine -- replace recipe with more compatible with the modpack
recipes.remove(<modcurrency:blockexchanger>);
recipes.addShaped(<modcurrency:blockexchanger>, [
    [<ore:plateAluminum>, <engineersdecor:factory_hopper>, <ore:plateAluminum>],
    [<immersiveengineering:material:27>, <immersiveengineering:wooden_device0:3>, <modcurrency:wallet>],
    [<ore:plateAluminum>, <immersiveengineering:wooden_device0:5>, <ore:plateAluminum>],
]);

# Vending Machine -- replace recipe with more compatible with the modpack
recipes.remove(<modcurrency:blockvending>);
recipes.addShaped(<modcurrency:blockvending>, [
    [<ore:plateAluminum>, <immersiveengineering:wooden_device0:5>, <ore:plateAluminum>],
    [<immersiveengineering:material:27>, <immersiveengineering:wooden_device0:3>, <modcurrency:wallet>],
    [<ore:plateAluminum>, <engineersdecor:factory_hopper>, <ore:plateAluminum>],
]);
