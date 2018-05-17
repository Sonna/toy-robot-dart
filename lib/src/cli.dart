import 'dart:io';
import 'dart:convert';
import 'dart:async';

// import 'package:toy_robot_dart/src/robot.dart';
// import '../src/robot.dart';
import 'robot.dart';

class CLI {
  static void run(List<String> arguments) {
    Stream<List<int>> inputStream = stdin;
    Robot robot = new Robot();

    if (arguments.length > 0) {
      final file = new File(arguments[0]);
      inputStream = file.openRead();
    }

    processInput(inputStream, robot);
  }

  static void processInput(Stream source, Robot robot) {
    // Needs to be declared ahead of `listen` for `cancel()` to be callable
    StreamSubscription<String> subscription;
    subscription = source
      .transform(UTF8.decoder)       // Decode bytes to UTF8.
      .transform(new LineSplitter()) // Convert stream to individual lines.
      .listen((String line) {        // Process results.
          List<String> commands = line.split(" ");
          if (line == "EXIT") {
            subscription.cancel();
          }

          if (commands.length > 0) {
            if (commands.length > 1) {

              robot.exec(commands[0], commands[1]);
            } else {
              robot.exec(commands[0]);
            }
          }
        },
        onDone: () { /* End of File Stream */ },
        onError: (e) { print(e.toString()); });
  }
}
