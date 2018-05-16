import 'dart:io';

// import 'package:toy_robot_dart/src/robot.dart';
// import '../src/robot.dart';
import 'robot.dart';

class CLI {
  static void run(List<String> arguments) {
    Robot robot = new Robot();

    processInput(stdin, robot);
  }

  static void processInput(Stream source, Robot robot) {
    robot.report();
  }
}
