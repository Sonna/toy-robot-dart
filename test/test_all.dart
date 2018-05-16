import 'package:test/test.dart';

import 'cli_test.dart' as cli;
import 'robot_test.dart' as robot;

void main() {
  group('cli', cli.main);
  group('robot', robot.main);
}
