import crafttweaker.liquid.ILiquidStack;
import mods.immersiveengineering.BottlingMachine;
import mods.jei.JEI;


########################################################################################################################

var HOT_LIQUIDS = [
    <liquid:glass>,
    <liquid:lava>,
] as ILiquidStack[];

var MILK_LIQUIDS = [
    <liquid:milk>,
    <liquid:milk_friesian>,
    <liquid:milk_goat>,
    <liquid:milk_holstein>,
    <liquid:milk_jersey>,
    <liquid:milk_sheep>,
] as ILiquidStack[];

var COOL_LIQUIDS = [
    <liquid:bio.ethanol>,
    <liquid:biodiesel>,
    <liquid:biomass>,
    <liquid:concrete>,
    <liquid:creosote>,
    <liquid:diesel>,
    <liquid:dist_water>,
    <liquid:ethanol>,
    <liquid:for.honey>,
    <liquid:gasoline>,
    <liquid:ice>,
    <liquid:juice>,
    <liquid:lubricant>,
    <liquid:napalm>,
    <liquid:oil>,
    <liquid:plantoil>,
    <liquid:seed.oil>,
    <liquid:short.mead>,
    <liquid:slop>,
    <liquid:water>,
] as ILiquidStack[];

for liquidStack in MILK_LIQUIDS { COOL_LIQUIDS += liquidStack; }

var ALL_LIQUIDS = [] as ILiquidStack[];
for liquidStack in HOT_LIQUIDS { ALL_LIQUIDS += liquidStack; }
for liquidStack in COOL_LIQUIDS { ALL_LIQUIDS += liquidStack; }


########################################################################################################################

for liquidStack in ALL_LIQUIDS {
    BottlingMachine.addRecipe(
        <immersiveengineering:jerrycan>.withTag({Fluid: {FluidName: liquidStack.name, Amount: 10000}}),
        <immersiveengineering:jerrycan>,
        liquidStack * 10000
    );

    BottlingMachine.addRecipe(
        <immersivepetroleum:oil_can>.withTag({Fluid: {FluidName: liquidStack.name, Amount: 8000}}),
        <immersivepetroleum:oil_can>,
        liquidStack * 8000
    );

    BottlingMachine.addRecipe(
        <forge:bucketfilled>.withTag({FluidName: liquidStack.name, Amount: 1000}),
        <minecraft:bucket>,
        liquidStack * 1000
    );

    BottlingMachine.addRecipe(
        <forestry:can:1>.withTag({Fluid: {FluidName: liquidStack.name, Amount: 1000}}),
        <forestry:can>,
        liquidStack * 1000
    );

    BottlingMachine.addRecipe(
        <forestry:refractory:1>.withTag({Fluid: {FluidName: liquidStack.name, Amount: 1000}}),
        <forestry:refractory>,
        liquidStack * 1000
    );

    if COOL_LIQUIDS has liquidStack {
        BottlingMachine.addRecipe(
            <forestry:capsule:1>.withTag({Fluid: {FluidName: liquidStack.name, Amount: 1000}}),
            <forestry:capsule>,
            liquidStack * 1000
        );
    }

    if MILK_LIQUIDS has liquidStack {
        BottlingMachine.addRecipe(<animania:milk_bottle>, <minecraft:glass_bottle>, liquidStack * 250);
    }

    if liquidStack.name == <liquid:creosote>.name {
        BottlingMachine.addRecipe(
            <railcraft:fluid_bottle_creosote>, <minecraft:glass_bottle>, <liquid:creosote> * 1000
        );
    }

    if liquidStack.name == <liquid:lava>.name {
        BottlingMachine.addRecipe(<claybucket:claybucket:2>, <claybucket:claybucket>, <liquid:lava> * 1000);
    }

    if liquidStack.name == <liquid:water>.name {
        BottlingMachine.addRecipe(<claybucket:claybucket:1>, <claybucket:claybucket>, <liquid:water> * 1000);
    }
}
