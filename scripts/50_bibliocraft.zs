# Dyeable Items -- remove colored recipes
for meta in 1 .. 16 {
    recipes.remove(<bibliocraft:lampgold>.definition.makeStack(meta));
    recipes.remove(<bibliocraft:lampiron>.definition.makeStack(meta));
    recipes.remove(<bibliocraft:lanterngold>.definition.makeStack(meta));
    recipes.remove(<bibliocraft:lanterniron>.definition.makeStack(meta));
    recipes.remove(<bibliocraft:typewriter>.definition.makeStack(meta));
    recipes.remove(<bibliocraft:swordpedestal>.definition.makeStack(meta));
}
recipes.removeByRecipeName("bibliocraft:white_dyed_lampgold");
recipes.removeByRecipeName("bibliocraft:white_dyed_lampiron");
recipes.removeByRecipeName("bibliocraft:white_dyed_lanterngold");
recipes.removeByRecipeName("bibliocraft:white_dyed_lanterniron");
recipes.removeByRecipeName("bibliocraft:white_dyed_typewriter");
recipes.removeByRecipeName("bibliocraft:white_dyed_swordpedestal");
