import 'package:flutter_test/flutter_test.dart';
import 'package:test_utils/test_utils.dart';

void main() async {
  test('integerRange', () {
    expect(() => Rand.integer(1, 2), throwsA(isA<RangeError>()));
    expect(() => Rand.integer(-1), throwsA(isA<RangeError>()));
    expect(() => Rand.integer(1, -1), throwsA(isA<RangeError>()));
    expect(Rand.integer(), isA<int>());
    expect(Rand.integer(1), isA<int>());
    expect(Rand.integer(2, 1), isA<int>());
  });

  test('dateTime', () {
    for (int i = 0; i < 1000; i++) {
      final dt = Rand.dateTime();
      expect(dt.isAfter(DateTime(2000)) && dt.isBefore(DateTime(2100)), true);
    }
  });

  test('dateTimeAfter', () {
    for (int i = 0; i < 1000; i++) {
      final dt = Rand.dateTimeAfter(DateTime(2000), const Duration(days: 365));
      expect(dt.isAfter(DateTime(2000)) && dt.isBefore(DateTime(2001)), true);
    }
  });

  test('dateTimeBefore', () {
    for (int i = 0; i < 1000; i++) {
      final dt = Rand.dateTimeBefore(DateTime(2001), const Duration(days: 365));
      expect(dt.isAfter(DateTime(2000)) && dt.isBefore(DateTime(2001)), true);
    }
  });
}
