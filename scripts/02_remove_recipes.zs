import mods.jei.JEI;


########################################################################################################################

var ids = [] as int[];

########################################################################################################################

#Charcoal -- remove recipes in favor of Forestry charcoal pile
recipes.remove(<minecraft:coal:1>);
furnace.remove(<minecraft:coal:1>);

# Chisel -- Block of Charcoal -- remove recipe which conflicts with TE
recipes.remove(<chisel:block_charcoal>);

# Enchantment Table -- don't allow enchantments
JEI.removeAndHide(<minecraft:brewing_stand>);
JEI.removeAndHide(<minecraft:enchanting_table>);
JEI.removeAndHide(<minecraft:experience_bottle>);

# Fist Full of Hay
JEI.removeAndHide(<fistful_of_hay:logo>);

# Mowzie's Mobs
JEI.removeAndHide(<mowziesmobs:mob_remover>);
JEI.removeAndHide(<mowziesmobs:test_structure>);

# Forestry Greenhouse Items
ids = [0, 3, 4, 5] as int[];
for i in ids {
    JEI.removeAndHide(<forestry:greenhouse>.definition.makeStack(i));
}

# Forestry Greenhouse Climatiser Items
ids = [0, 1, 2, 3, 4] as int[];
for i in ids {
    JEI.removeAndHide(<forestry:climatiser>.definition.makeStack(i));
}

# Forestry Greenhouse Additional Items
JEI.removeAndHide(<forestry:greenhouse.window>);
JEI.removeAndHide(<forestry:greenhouse.window_up>);

# Engineer's Hammer -- don't use for crushing ores
recipes.removeByRecipeName("immersiveengineering:hammercrushing_sulfur");
recipes.removeByRecipeName("immersiveengineering:hammercrushing_saltpeter");

# Remove Minecraft Spawn Eggs
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:bat"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:blaze"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cave_spider"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:creeper"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:donkey"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:elder_guardian"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:enderman"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:endermite"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:evocation_illager"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:ghast"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:guardian"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:horse"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:husk"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:llama"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:magma_cube"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:mooshroom"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:mule"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:ocelot"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:parrot"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:polar_bear"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:rabbit"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:shulker"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:silverfish"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:skeleton"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:skeleton_horse"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:slime"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:spider"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:squid"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:stray"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:vex"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:villager"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:vindication_illager"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:witch"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:wither_skeleton"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:wolf"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie_horse"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie_pigman"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:zombie_villager"}}));

# Remove Better Animals Plus Spawn Eggs
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:brownbear"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:blackbear"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:deer"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:lammergeier"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:feralwolf"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:coyote"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:fox"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:tarantula"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:hirschgeist"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:goat"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:jellyfish"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:pheasant"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:reindeer"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:boar"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:squirrel"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:songbird"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:badger"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:lamprey"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:nautilus"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:crab"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:horseshoecrab"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:shark"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:moose"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:turkey"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:zotzpyre"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:bobbit_worm"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:goose"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:eel_freshwater"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:eel_saltwater"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:whale"}}));
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "betteranimalsplus:walrus"}}));

# Remove Mozwie's Mobs Spawn Eggs
JEI.removeAndHide(<mowziesmobs:spawn_egg>.withTag({EntityTag: {id: "mowziesmobs:foliaath"}}));
JEI.removeAndHide(<mowziesmobs:spawn_egg>.withTag({EntityTag: {id: "mowziesmobs:ferrous_wroughtnaut"}}));
JEI.removeAndHide(<mowziesmobs:spawn_egg>.withTag({EntityTag: {id: "mowziesmobs:barakoana"}}));
JEI.removeAndHide(<mowziesmobs:spawn_egg>.withTag({EntityTag: {id: "mowziesmobs:barakoaya"}}));
JEI.removeAndHide(<mowziesmobs:spawn_egg>.withTag({EntityTag: {id: "mowziesmobs:barako"}}));
JEI.removeAndHide(<mowziesmobs:spawn_egg>.withTag({EntityTag: {id: "mowziesmobs:frostmaw"}}));
JEI.removeAndHide(<mowziesmobs:spawn_egg>.withTag({EntityTag: {id: "mowziesmobs:grottol"}}));
JEI.removeAndHide(<mowziesmobs:spawn_egg>.withTag({EntityTag: {id: "mowziesmobs:lantern"}}));
JEI.removeAndHide(<mowziesmobs:spawn_egg>.withTag({EntityTag: {id: "mowziesmobs:naga"}}));

# Remove Realistic Horse Genetics Sppawn Egg
JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "horse_colors:horse_felinoid"}}));

# Animania Spawn Eggs
JEI.removeAndHide(<animania:entity_egg_hamster>);
JEI.removeAndHide(<animania:entity_egg_ferret_grey>);
JEI.removeAndHide(<animania:entity_egg_ferret_white>);
JEI.removeAndHide(<animania:entity_egg_hedgehog>);
JEI.removeAndHide(<animania:entity_egg_hedgehog_albino>);
JEI.removeAndHide(<animania:entity_egg_frog>);
JEI.removeAndHide(<animania:entity_egg_toad>);
JEI.removeAndHide(<animania:entity_egg_buck_cottontail>);
JEI.removeAndHide(<animania:entity_egg_doe_cottontail>);
JEI.removeAndHide(<animania:entity_egg_kit_cottontail>);
JEI.removeAndHide(<animania:entity_egg_buck_chinchilla>);
JEI.removeAndHide(<animania:entity_egg_doe_chinchilla>);
JEI.removeAndHide(<animania:entity_egg_kit_chinchilla>);
JEI.removeAndHide(<animania:entity_egg_buck_dutch>);
JEI.removeAndHide(<animania:entity_egg_doe_dutch>);
JEI.removeAndHide(<animania:entity_egg_kit_dutch>);
JEI.removeAndHide(<animania:entity_egg_buck_havana>);
JEI.removeAndHide(<animania:entity_egg_doe_havana>);
JEI.removeAndHide(<animania:entity_egg_kit_havana>);
JEI.removeAndHide(<animania:entity_egg_buck_jack>);
JEI.removeAndHide(<animania:entity_egg_doe_jack>);
JEI.removeAndHide(<animania:entity_egg_kit_jack>);
JEI.removeAndHide(<animania:entity_egg_buck_new_zealand>);
JEI.removeAndHide(<animania:entity_egg_doe_new_zealand>);
JEI.removeAndHide(<animania:entity_egg_kit_new_zealand>);
JEI.removeAndHide(<animania:entity_egg_buck_rex>);
JEI.removeAndHide(<animania:entity_egg_doe_rex>);
JEI.removeAndHide(<animania:entity_egg_kit_rex>);
JEI.removeAndHide(<animania:entity_egg_buck_lop>);
JEI.removeAndHide(<animania:entity_egg_doe_lop>);
JEI.removeAndHide(<animania:entity_egg_kit_lop>);
JEI.removeAndHide(<animania:entity_egg_peachick_charcoal>);
JEI.removeAndHide(<animania:entity_egg_peahen_charcoal>);
JEI.removeAndHide(<animania:entity_egg_peacock_charcoal>);
JEI.removeAndHide(<animania:entity_egg_peachick_opal>);
JEI.removeAndHide(<animania:entity_egg_peahen_opal>);
JEI.removeAndHide(<animania:entity_egg_peacock_opal>);
JEI.removeAndHide(<animania:entity_egg_peachick_peach>);
JEI.removeAndHide(<animania:entity_egg_peahen_peach>);
JEI.removeAndHide(<animania:entity_egg_peacock_peach>);
JEI.removeAndHide(<animania:entity_egg_peachick_purple>);
JEI.removeAndHide(<animania:entity_egg_peahen_purple>);
JEI.removeAndHide(<animania:entity_egg_peacock_purple>);
JEI.removeAndHide(<animania:entity_egg_peachick_taupe>);
JEI.removeAndHide(<animania:entity_egg_peahen_taupe>);
JEI.removeAndHide(<animania:entity_egg_peacock_taupe>);
JEI.removeAndHide(<animania:entity_egg_peachick_blue>);
JEI.removeAndHide(<animania:entity_egg_peahen_blue>);
JEI.removeAndHide(<animania:entity_egg_peacock_blue>);
JEI.removeAndHide(<animania:entity_egg_peachick_white>);
JEI.removeAndHide(<animania:entity_egg_peahen_white>);
JEI.removeAndHide(<animania:entity_egg_peacock_white>);
JEI.removeAndHide(<animania:entity_egg_mare_draft>);
JEI.removeAndHide(<animania:entity_egg_foal_draft>);
JEI.removeAndHide(<animania:entity_egg_stallion_draft>);
JEI.removeAndHide(<animania:entity_egg_piglet_yorkshire>);
JEI.removeAndHide(<animania:entity_egg_sow_yorkshire>);
JEI.removeAndHide(<animania:entity_egg_hog_yorkshire>);
JEI.removeAndHide(<animania:entity_egg_piglet_old_spot>);
JEI.removeAndHide(<animania:entity_egg_sow_old_spot>);
JEI.removeAndHide(<animania:entity_egg_hog_old_spot>);
JEI.removeAndHide(<animania:entity_egg_piglet_large_black>);
JEI.removeAndHide(<animania:entity_egg_sow_large_black>);
JEI.removeAndHide(<animania:entity_egg_hog_large_black>);
JEI.removeAndHide(<animania:entity_egg_piglet_large_white>);
JEI.removeAndHide(<animania:entity_egg_sow_large_white>);
JEI.removeAndHide(<animania:entity_egg_hog_large_white>);
JEI.removeAndHide(<animania:entity_egg_piglet_hampshire>);
JEI.removeAndHide(<animania:entity_egg_sow_hampshire>);
JEI.removeAndHide(<animania:entity_egg_hog_hampshire>);
JEI.removeAndHide(<animania:entity_egg_piglet_duroc>);
JEI.removeAndHide(<animania:entity_egg_sow_duroc>);
JEI.removeAndHide(<animania:entity_egg_hog_duroc>);
JEI.removeAndHide(<animania:entity_egg_chick_leghorn>);
JEI.removeAndHide(<animania:entity_egg_hen_leghorn>);
JEI.removeAndHide(<animania:entity_egg_rooster_leghorn>);
JEI.removeAndHide(<animania:entity_egg_chick_orpington>);
JEI.removeAndHide(<animania:entity_egg_hen_orpington>);
JEI.removeAndHide(<animania:entity_egg_rooster_orpington>);
JEI.removeAndHide(<animania:entity_egg_chick_plymouth_rock>);
JEI.removeAndHide(<animania:entity_egg_hen_plymouth_rock>);
JEI.removeAndHide(<animania:entity_egg_rooster_plymouth_rock>);
JEI.removeAndHide(<animania:entity_egg_chick_rhode_island_red>);
JEI.removeAndHide(<animania:entity_egg_hen_rhode_island_red>);
JEI.removeAndHide(<animania:entity_egg_rooster_rhode_island_red>);
JEI.removeAndHide(<animania:entity_egg_chick_wyandotte>);
JEI.removeAndHide(<animania:entity_egg_hen_wyandotte>);
JEI.removeAndHide(<animania:entity_egg_rooster_wyandotte>);
JEI.removeAndHide(<animania:entity_egg_calf_angus>);
JEI.removeAndHide(<animania:entity_egg_cow_angus>);
JEI.removeAndHide(<animania:entity_egg_bull_angus>);
JEI.removeAndHide(<animania:entity_egg_calf_friesian>);
JEI.removeAndHide(<animania:entity_egg_cow_friesian>);
JEI.removeAndHide(<animania:entity_egg_bull_friesian>);
JEI.removeAndHide(<animania:entity_egg_calf_hereford>);
JEI.removeAndHide(<animania:entity_egg_cow_hereford>);
JEI.removeAndHide(<animania:entity_egg_bull_hereford>);
JEI.removeAndHide(<animania:entity_egg_calf_holstein>);
JEI.removeAndHide(<animania:entity_egg_cow_holstein>);
JEI.removeAndHide(<animania:entity_egg_bull_holstein>);
JEI.removeAndHide(<animania:entity_egg_calf_longhorn>);
JEI.removeAndHide(<animania:entity_egg_cow_longhorn>);
JEI.removeAndHide(<animania:entity_egg_bull_longhorn>);
JEI.removeAndHide(<animania:entity_egg_calf_highland>);
JEI.removeAndHide(<animania:entity_egg_cow_highland>);
JEI.removeAndHide(<animania:entity_egg_bull_highland>);
JEI.removeAndHide(<animania:entity_egg_calf_jersey>);
JEI.removeAndHide(<animania:entity_egg_cow_jersey>);
JEI.removeAndHide(<animania:entity_egg_bull_jersey>);
JEI.removeAndHide(<animania:entity_egg_calf_mooshroom>);
JEI.removeAndHide(<animania:entity_egg_cow_mooshroom>);
JEI.removeAndHide(<animania:entity_egg_bull_mooshroom>);
JEI.removeAndHide(<animania:entity_egg_kid_alpine>);
JEI.removeAndHide(<animania:entity_egg_buck_alpine>);
JEI.removeAndHide(<animania:entity_egg_doe_alpine>);
JEI.removeAndHide(<animania:entity_egg_kid_angora>);
JEI.removeAndHide(<animania:entity_egg_buck_angora>);
JEI.removeAndHide(<animania:entity_egg_doe_angora>);
JEI.removeAndHide(<animania:entity_egg_kid_fainting>);
JEI.removeAndHide(<animania:entity_egg_buck_fainting>);
JEI.removeAndHide(<animania:entity_egg_doe_fainting>);
JEI.removeAndHide(<animania:entity_egg_kid_kiko>);
JEI.removeAndHide(<animania:entity_egg_buck_kiko>);
JEI.removeAndHide(<animania:entity_egg_doe_kiko>);
JEI.removeAndHide(<animania:entity_egg_kid_kinder>);
JEI.removeAndHide(<animania:entity_egg_buck_kinder>);
JEI.removeAndHide(<animania:entity_egg_doe_kinder>);
JEI.removeAndHide(<animania:entity_egg_kid_nigerian_dwarf>);
JEI.removeAndHide(<animania:entity_egg_buck_nigerian_dwarf>);
JEI.removeAndHide(<animania:entity_egg_doe_nigerian_dwarf>);
JEI.removeAndHide(<animania:entity_egg_kid_pygmy>);
JEI.removeAndHide(<animania:entity_egg_buck_pygmy>);
JEI.removeAndHide(<animania:entity_egg_doe_pygmy>);
JEI.removeAndHide(<animania:entity_egg_lamb_friesian>);
JEI.removeAndHide(<animania:entity_egg_ewe_friesian>);
JEI.removeAndHide(<animania:entity_egg_ram_friesian>);
JEI.removeAndHide(<animania:entity_egg_lamb_suffolk>);
JEI.removeAndHide(<animania:entity_egg_ewe_suffolk>);
JEI.removeAndHide(<animania:entity_egg_ram_suffolk>);
JEI.removeAndHide(<animania:entity_egg_lamb_dorper>);
JEI.removeAndHide(<animania:entity_egg_ewe_dorper>);
JEI.removeAndHide(<animania:entity_egg_ram_dorper>);
JEI.removeAndHide(<animania:entity_egg_lamb_dorset>);
JEI.removeAndHide(<animania:entity_egg_ewe_dorset>);
JEI.removeAndHide(<animania:entity_egg_ram_dorset>);
JEI.removeAndHide(<animania:entity_egg_lamb_merino>);
JEI.removeAndHide(<animania:entity_egg_ewe_merino>);
JEI.removeAndHide(<animania:entity_egg_ram_merino>);
JEI.removeAndHide(<animania:entity_egg_lamb_jacob>);
JEI.removeAndHide(<animania:entity_egg_ewe_jacob>);
JEI.removeAndHide(<animania:entity_egg_ram_jacob>);
JEI.removeAndHide(<animania:entity_egg_random>);
JEI.removeAndHide(<animania:entity_egg_peacock_random>);
JEI.removeAndHide(<animania:entity_egg_rabbit_random>);
JEI.removeAndHide(<animania:entity_egg_dart_frog>);
JEI.removeAndHide(<animania:entity_egg_cow_random>);
JEI.removeAndHide(<animania:entity_egg_pig_random>);
JEI.removeAndHide(<animania:entity_egg_chicken_random>);
JEI.removeAndHide(<animania:entity_egg_goat_random>);
JEI.removeAndHide(<animania:entity_egg_sheep_random>);
