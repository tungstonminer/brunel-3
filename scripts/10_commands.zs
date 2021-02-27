import crafttweaker.command.ICommandManager;
import crafttweaker.event.CommandEvent;
import crafttweaker.player.IPlayer;

events.onCommand(function(event as CommandEvent) {
    val command = event.command;
    val params = event.parameters;

    if isNull(command) || (command.name != "me") {
        return;
    }

    if (params.length < 1) || (params[0] != "pack") {
        return;
    }

    var player as IPlayer = null;
    if event.commandSender instanceof IPlayer {
        player = event.commandSender;

        if !server.isOp(player) {
            player.sendChat("Only admins may use pack commands");
            event.cancel();
            return;
        }
    }

    if params.length < 2 {
        if !isNull(player) {
            player.sendChat("/me pack <biomes|help>");
        }
        event.cancel();
        return;
    }
    val subcommand = params[1];
    event.cancel();

    if subcommand == "biomes" {
        if !isNull(player) {
            player.sendChat("Printing primary biomes to crafttweaker.log");
        }

        print("Biomes:");
        for biome in game.biomes {
            print(biome.name ~ " (temp: " ~ biome.temperature ~ ", rainfall: " ~ biome.rainfall ~ ")");
        }
    } else if subcommand == "help" {
        if !isNull(player) {
            player.sendChat("/me pack biomes -- print all the biomes to the crafttweaker.log file");
            player.sendChat("/me pack help -- show this help message");
            player.sendChat("/me pack mob -- reload mob configs");
        }
    } else if subcommand == "mob" {
        server.commandManager.executeCommand(event.commandSender, "/ctrlreload");
        server.commandManager.executeCommand(event.commandSender, "/cofh killall *");

        if params.length > 2 {
            var time = params[2];

            if time == "day" {
                server.commandManager.executeCommand(event.commandSender, "/time set 6000");
                server.commandManager.executeCommand(event.commandSender, "/effect @p clear");
            } else if time == "night" {
                server.commandManager.executeCommand(event.commandSender, "/time set 18000");
                server.commandManager.executeCommand(event.commandSender, "/effect @p minecraft:night_vision 999");
            } else if time == "twilight" {
                server.commandManager.executeCommand(event.commandSender, "/time set 12000");
                server.commandManager.executeCommand(event.commandSender, "/effect @p clear");
            }
        }
    } else if subcommand == "test" {
        server.commandManager.executeCommand(event.commandSender, "/gamemode creative");
        server.commandManager.executeCommand(event.commandSender, "/gamerule doDaylightCycle false");
        server.commandManager.executeCommand(event.commandSender, "/gamerule doWeatherCycle false");
        server.commandManager.executeCommand(event.commandSender, "/time set 6000");
        server.commandManager.executeCommand(event.commandSender, "/effect @p clear");
    } else {
        if !isNull(player) {
            player.sendChat("Unrecognized subcommand: " ~ subcommand);
        }
    }
});
