import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:test/test.dart';

import 'package:toy_robot_dart/toy_robot.dart';

// List<String> log = [];
// var log = [];
// void print(String s) => log.add(s);
// var printLog = [];
// void print(String s) => printLog.add(s);

void main() {
  // setUp(() {
  //   log = [];
  // });

  // tearDown(() {
  //   log = null;
  // });

  group("CLI run", () {
    // setUp(() {
    //   log = [];
    // });

    // tearDown(() {
    //   log = null;
    // });

    test("can process Example A", () {
      Process.start('bin/app', ["examples/example_a.txt"]).then((Process process) {
        process.stdout
          .transform(UTF8.decoder)
          .listen((data) { expect(data, ["0,0,NORTH"]); });
        process.stdin.writeln('Hello, world!');
        process.stdin.writeln('Hello, galaxy!');
        process.stdin.writeln('Hello, universe!');
      });
      // CLI.run([]);
      // expect(log, ["0,0,NORTH"]);
    });
  // });

  // group("CLI proccesInput", () {
    // setUp(() {
    //   log = [];
    // });

    // tearDown(() {
    //   log = null;
    // });

    // test("can process from an input stream", () {
    test("can REPORT from standard input stream", () {
      // Robot robot = new Robot();
      // final file = new File("examples/example_a.txt");
      // Stream<List<int>> inputStream = file.openRead();

      // var log = [];
      // void print(String s) => log.add(s);
      // CLI.processInput(inputStream, robot);
      // expect(CLI.processInput(inputStream, robot), ["0,0,NORTH"]);

      Process.start('bin/app', []).then((Process process) {
        process.stdout
          .transform(UTF8.decoder)
          .listen((data) { expect(data, ["0,0,NORTH"]); });
        process.stdin.writeln("REPORT");
        process.stdin.writeln("EXIT");
      });
    });

    test("can EXIT from standard input stream", () {
      // Robot robot = new Robot();
      // Stream input = new Stream.fromIterable([UTF8.encode("EXIT\n")]);

      // // CLI.processInput(input, robot);
      // // var completer = new Completer<String>();
      // expect(CLI.processInput(input, robot), []);

      Process.start('bin/app', []).then((Process process) {
        process.stdout
          .transform(UTF8.decoder)
          .listen((data) { expect(data, []); });
        process.stdin.writeln("EXIT");
      });
    });

    // test("can REPORT from standard input stream", () {
    //   Robot robot = new Robot();
    //   Stream input = new Stream.fromIterable([UTF8.encode("REPORT\nEXIT\n")]);

    //   // CLI.processInput(input, robot);
    //   // print(log.toString());
    //   // await expect(input, emits("0,0,NORTH"));
    //   // expect(log, ["0,0,NORTH"]);
    //   expect(CLI.processInput(input, robot), ["0,0,NORTH"]);
    // });
  });
}

// overridePrint(testFn()) => () {
//   var spec = new ZoneSpecification(
//     print: (_, __, ___, String msg) {
//       // if (log == null) { log = []; }
//       // Add to log instead of printing to stdout
//       log.add(msg);
//     }
//   );
//   return Zone.current.fork(specification: spec).run(testFn);
// };

// Iterator<String> getStringIterator(String s) =>
//   s.runes.map((r) => new String.fromCharCode(r)).iterator;
