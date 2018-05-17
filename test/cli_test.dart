import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:test/test.dart';

import 'package:toy_robot_dart/toy_robot.dart';

void main() {
  group("CLI run", () {
    test("can process Example A", () {
      Process.start('bin/app', ["examples/example_a.txt"]).then((Process process) {
        process.stdout
          .transform(UTF8.decoder)
          .listen((data) { expect(data, "0,0,NORTH\n"); });
      });
    });

    test("can process Example B", () {
      Process.start('bin/app', ["examples/example_b.txt"]).then((Process process) {
        process.stdout
          .transform(UTF8.decoder)
          .listen((data) { expect(data, "0,0,WEST\n"); });
      });
    });

    test("can process Example C", () {
      Process.start('bin/app', ["examples/example_c.txt"]).then((Process process) {
        process.stdout
          .transform(UTF8.decoder)
          .listen((data) { expect(data, "3,3,NORTH\n"); });
      });
    });

    test("can REPORT from standard input stream", () {
      Process.start('bin/app', []).then((Process process) {
        process.stdout
          .transform(UTF8.decoder)
          .listen((data) { expect(data, ["0,0,NORTH"]); });
        process.stdin.writeln("REPORT");
        process.stdin.writeln("EXIT");
      });
    });

    test("can EXIT from standard input stream", () {
      Process.start('bin/app', []).then((Process process) {
        process.stdout
          .transform(UTF8.decoder)
          .listen((data) { expect(data, []); });
        process.stdin.writeln("EXIT");
      });
    });

    test("can process all commands from standard input stream", () {
      Process.start('bin/app', []).then((Process process) {
        process.stdout
          .transform(UTF8.decoder)
          .listen((data) {
            expect(data, [
              "0,0,NORTH",
              "0,1,EAST",
              "0,2,WEST",
              "3,3,SOUTH"
            ]);
          });
        process.stdin.writeln("REPORT");
        process.stdin.writeln("MOVE");
        process.stdin.writeln("RIGHT");
        process.stdin.writeln("REPORT");
        process.stdin.writeln("MOVE");
        process.stdin.writeln("LEFT");
        process.stdin.writeln("LEFT");
        process.stdin.writeln("REPORT");
        process.stdin.writeln("PLACE 3,3,SOUTH");
        process.stdin.writeln("REPORT");
        process.stdin.writeln("EXIT");
      });
    });
  });
}
