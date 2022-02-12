part of test_utils;

abstract class Rand {
  static final rand = math.Random();

  static const base62 =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  static bool boolean([truePercent = 50]) {
    assert(truePercent > 0, 'use false instead');
    assert(truePercent < 100, 'use true instead');
    return truePercent > rand.nextInt(100);
  }

  static intMax(int max) => rand.nextInt(max);

  static int intRange([int? min, int? max]) {
    if (min == null) {
      if (max == null) {
        return rand.nextInt(1 << 31);
      }
      assert(max > 0);
      return rand.nextInt(max + 1);
    }
    assert(min >= 0);
    if (max == null) {
      return min + rand.nextInt((1 << 31) - min);
    }
    if (max == min) {
      return max;
    }
    return min + rand.nextInt(max - min + 1);
  }

  static T? mayNull<T>(int nullPercent, T value) {
    if (boolean(nullPercent)) {
      return value;
    }
    return null;
  }

  static T enumVal<T>(Iterable<T> values) {
    return values.elementAt(rand.nextInt(values.length));
  }

  static String get randomDocId {
    final buffer = StringBuffer();
    for (int i = 0; i < 20; i++) {
      buffer.writeCharCode(base62.codeUnitAt(rand.nextInt(62)));
    }
    return buffer.toString();
  }
}
