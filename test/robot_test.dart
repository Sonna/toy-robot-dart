import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:test/test.dart';

import 'package:toy_robot_dart/toy_robot.dart';

// import 'test_util.dart';

var log = [];

void main() {
  group('a Robot', () {
    test('constructor no parameters', () {
      Robot subject = new Robot();
      expect(subject.x, equals(0));
      expect(subject.y, equals(0));
      expect(subject.facing, equals("NORTH"));
    });

    test('constructor no parameters', () {
      Robot subject = new Robot(1, 2, "SOUTH");
      expect(subject.x, equals(1));
      expect(subject.y, equals(2));
      expect(subject.facing, equals("SOUTH"));
    });
  });

  group('standard output', () {
    // IOSink oldStdout;
    // var oldStdout;

    // setUp(() {
    //   oldStdout = Stdout;
    //   _stdout = _StdIOUtils._getStdioOutputStream(_stdoutFD);
    // });

    // tearDown(() {
    //   _stdout = oldStdout;
    // });

    // Stream readLine() => stdin
    //   .transform(UTF8.decoder)
    //   .transform(new LineSplitter());

    // Stream cmdLine = stdin
    //   // .transform(new StringDecoder())
    //   .transform(UTF8.decoder)
    //   .transform(new LineSplitter());

    // String stdoutOutput = cmdLine.listen(
    //   (line) => line,
    //   onDone: () => line,
    //   onError: (e) => '/* Error on input. */'
    // );

    // test('report prints current coordinates to the screen', () {
    // test('report prints current coordinates to the screen', () async {
    test('report prints current coordinates to the screen', overridePrint(() {
      Robot subject = new Robot();
      subject.report();
      // String actual = '';
      // String actual = readLine().listen(subject.report);
      // String actual = stdoutOutput;
      // String actual = stdin.readLineSync(encoding: Encoding.UTF_8);
      String expected = "0,0,NORTH";

      // await for (var value in readLine()) {
      //   actual += value;
      // }

      // expect(actual, equals(expected));
      // expect(actual, completion(equals(expected)));
      expect(log, [expected]);
    }));
  });
}

// main() {
//   test('override print', overridePrint(() {
//     print('hello world');
//     expect(log, ['hello world']);
//   }));
// }

overridePrint(testFn()) => () {
  var spec = new ZoneSpecification(
    print: (_, __, ___, String msg) {
      // Add to log instead of printing to stdout
      log.add(msg);
    }
  );
  return Zone.current.fork(specification: spec).run(testFn);
};
