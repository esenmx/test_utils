part of test_utils;

abstract class Rand {
  static final _rand = math.Random();

  static const maxRngInt = 1 << 32;

  static const base62CharSet =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  static bool boolean([truePercent = 50]) {
    assert(truePercent > 0, 'use false instead');
    assert(truePercent < 100, 'use true instead');
    return truePercent > _rand.nextInt(100);
  }

  /// [max] is exclusive, [min] is inclusive
  /// default adjusted max value [adjMax] is `1 << 32`
  static int integer([int? max, int min = 0]) {
    RangeError.checkNotNegative(min, 'min');
    final adjMax = max ?? maxRngInt;
    RangeError.checkNotNegative(adjMax, 'max');
    return adjMax == min ? adjMax : _rand.nextInt(adjMax - min) + min;
  }

  static T? mayBeNull<T>(T value, [int nullPercent = 50]) {
    return boolean(nullPercent) ? null : value;
  }

  static T element<T>(Iterable<T> iterable) {
    return iterable.elementAt(_rand.nextInt(iterable.length));
  }

  static MapEntry<K, V> entry<K, V>(Map<K, V> map) {
    return map.entries.elementAt(_rand.nextInt(map.length));
  }

  static DateTime dateTime({DateTime? min, DateTime? max}) {
    final microEpoch = lerpDouble(
      (min ?? DateTime(2000)).microsecondsSinceEpoch,
      (max ?? DateTime(2100)).microsecondsSinceEpoch,
      _rand.nextDouble(),
    );
    return DateTime.fromMicrosecondsSinceEpoch(microEpoch!.toInt());
  }

  static DateTime dateTimeAfter(DateTime a, Duration within) {
    return dateTime(min: a, max: a.add(within));
  }

  static DateTime dateTimeBefore(DateTime a, Duration within) {
    return dateTime(min: a, max: a.subtract(within));
  }

  /// 20 stands for usual length of [Firestore] document id
  static String string([int length = 20]) {
    final buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
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
