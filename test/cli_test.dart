import 'package:toy_robot_dart/toy_robot.dart';
import 'package:test/test.dart';

// import 'test_util.dart';

void main() {
  group("some_Group_Name", () {
    test("test_name_1", () {
      var actual = 0;
      var expected = 0;
      expect(actual, equals(expected));
    });

    test("test_name_2", () {
      var actual = 'String';
      var expected = 'String';
      expect(actual, equals(expected));
    });
  });
}
