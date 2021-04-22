import crafttweaker.command.ICommandManager;
import crafttweaker.event.CommandEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;


########################################################################################################################

val PAUSE = 4 * 20;
val START_X = -5000.0;
val START_Y = 256.0;
val START_Z = -5000.0;
val STEP = 500.0;
val STOP_X = 5000.0;
val STOP_Z = 5000.0;


########################################################################################################################

events.onCommand(function(event as CommandEvent) {
    val command = event.command;
    val params = event.parameters;

    if isNull(command) || (command.name != "me") {
        return;
    }

    if (params.length < 1) || (params[0] != "explore") {
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
    } else {
        return;
    }

    val world = event.commandSender.world;
    if isNull(world) { return; }

    player.sendChat("Starting exploration!");
    player.executeCommand("/gamemode creative");
    player.executeCommand("/tp @p " ~ START_X ~ " " ~ START_Y ~ " " ~ START_Z);
    player.update(player.data + {isExploring: "YES", nextMove: 0});
});

events.onPlayerTick(function(event as PlayerTickEvent) {
    if isNull(event) { return; }
    if isNull(event.player) { return; }
    if isNull(event.player.world) { return; }

    val player = event.player;
    val world = event.player.world;

    if isNull(player.data.isExploring) { return; }

    var nextMove as long = player.data.nextMove.asLong();
    if (world.getWorldTime() < nextMove) { return; }

    var nextX as double = player.x;
    var nextZ as double = player.z;

    nextZ += STEP;
    if nextZ > STOP_Z {
        nextZ = START_Z;
        nextX += STEP;
    }

    if nextX > STOP_X {
        player.update(player.data + {isExploring: null, nextMove: 0});
        player.sendChat("Finished exploration!");
        return;
    }

    player.executeCommand("/tp @p " ~ nextX ~ " " ~ START_Y ~ " " ~ nextZ);
    nextMove = world.getWorldTime() + PAUSE;
    player.update(player.data + {nextMove: nextMove});
});
