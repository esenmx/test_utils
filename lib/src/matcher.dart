part of test_utils;

extension DateTimeCheckerX on DateTime {
  bool withinDuration(DateTime other, Duration margin) {
    return difference(other).inMicroseconds.abs() <= margin.inMicroseconds;
  }
}
