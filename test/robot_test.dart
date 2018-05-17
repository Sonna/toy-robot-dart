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

    test("left method turns Robot to face WEST, when facing NORTH", () {
      Robot subject = new Robot();
      subject.left();
      expect(subject.x, equals(0));
      expect(subject.y, equals(0));
      expect(subject.facing, equals("WEST"));
    });

    test("left method turns Robot to face SOUTH, when facing WEST", () {
      Robot subject = new Robot(0, 0, 'WEST');
      subject.left();
      expect(subject.x, equals(0));
      expect(subject.y, equals(0));
      expect(subject.facing, equals("SOUTH"));
    });

    test("left method turns Robot to face EAST, when facing SOUTH", () {
      Robot subject = new Robot(0, 0, 'SOUTH');
      subject.left();
      expect(subject.x, equals(0));
      expect(subject.y, equals(0));
      expect(subject.facing, equals("EAST"));
    });

    test("left method turns Robot to face NORTH, when facing EAST", () {
      Robot subject = new Robot(0, 0, 'EAST');
      subject.left();
      expect(subject.x, equals(0));
      expect(subject.y, equals(0));
      expect(subject.facing, equals("NORTH"));
    });

    test("right method turns Robot to face EAST, when facing NORTH", () {
      Robot subject = new Robot();
      subject.right();
      expect(subject.x, equals(0));
      expect(subject.y, equals(0));
      expect(subject.facing, equals("EAST"));
    });

    test("right method turns Robot to face SOUTH, when facing EAST", () {
      Robot subject = new Robot(0, 0, 'EAST');
      subject.right();
      expect(subject.x, equals(0));
      expect(subject.y, equals(0));
      expect(subject.facing, equals("SOUTH"));
    });

    test("right method turns Robot to face WEST, when facing SOUTH", () {
      Robot subject = new Robot(0, 0, 'SOUTH');
      subject.right();
      expect(subject.x, equals(0));
      expect(subject.y, equals(0));
      expect(subject.facing, equals("WEST"));
    });

    test("right method turns Robot to face NORTH, when facing WEST", () {
      Robot subject = new Robot(0, 0, 'WEST');
      subject.right();
      expect(subject.x, equals(0));
      expect(subject.y, equals(0));
      expect(subject.facing, equals("NORTH"));
    });
  });

  group('standard output', () {
    test('report prints current coordinates to the screen', overridePrint(() {
      Robot subject = new Robot();
      subject.report();
      expect(log, ["0,0,NORTH"]);
    }));
  });
}

overridePrint(testFn()) => () {
  var spec = new ZoneSpecification(
    print: (_, __, ___, String msg) {
      // Add to log instead of printing to stdout
      log.add(msg);
    }
  );
  return Zone.current.fork(specification: spec).run(testFn);
};
