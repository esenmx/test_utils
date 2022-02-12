part of test_utils;

abstract class Rand {
  static final _rand = math.Random();

  static const base62CharSet =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  static bool boolean([truePercent = 50]) {
    assert(truePercent > 0, 'use false instead');
    assert(truePercent < 100, 'use true instead');
    return truePercent > _rand.nextInt(100);
  }

  static integer(int max) => _rand.nextInt(max);

  static int integerRange([int? min, int? max]) {
    if (min == null) {
      if (max == null) {
        return _rand.nextInt(1 << 31);
      }
      assert(max > 0);
      return _rand.nextInt(max + 1);
    }
    assert(min >= 0);
    if (max == null) {
      return min + _rand.nextInt((1 << 31) - min);
    }
    if (max == min) {
      return max;
    }
    return min + _rand.nextInt(max - min + 1);
  }

  static get float => _rand.nextDouble();

  static T? mayNull<T>(int nullPercent, T value) {
    if (boolean(nullPercent)) {
      return value;
    }
    return null;
  }

  static T element<T>(Iterable<T> values) {
    return values.elementAt(_rand.nextInt(values.length));
  }

  static String get randomDocId {
    final buffer = StringBuffer();
    for (int i = 0; i < 20; i++) {
      buffer.writeCharCode(base62CharSet.codeUnitAt(_rand.nextInt(62)));
    }
    return buffer.toString();
  }

  static String randomPassword({
    int length = 16,
    bool withLowercase = true,
    bool withUppercase = true,
    bool withNumeric = true,
    bool withSpecial = true,
  }) {
    const lowerCase = "abcdefghijklmnopqrstuvwxyz";
    const upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const numeric = "0123456789";
    const special = "!@#\$%^&*()-_=+[]{}\\|;:'\",<.>/?`~";
    final chars = (StringBuffer()
          ..write(withLowercase ? lowerCase : '')
          ..write(withUppercase ? upperCase : '')
          ..write(withNumeric ? numeric : '')
          ..write(withSpecial ? special : ''))
        .toString();
    final buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      final value = math.Random.secure().nextInt(chars.length);
      buffer.write(chars[value]);
    }
    return buffer.toString();
  }
}
