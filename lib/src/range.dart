part of test_utils;

extension RangeIntEx on int {
  /// [0, ... , length - 1]
  List<int> range([int? offset]) {
    return List.generate(this, (index) => index + (offset ?? 0));
  }

  /// [0, 2, 4, ... , (length - 1) * 2]
  List<int> rangeEven([int? offset]) {
    return List.generate(this, (index) => index * 2 + (offset ?? 0));
  }

  /// [1, 3, 5, ... , ((length + 1) * 2) - 1]
  List<int> rangeOdd([int? offset]) {
    return List.generate(this, (index) => index * 2 + 1 + (offset ?? 0));
  }

  /// {Random().nextInt(), Random().nextInt(), ... , Random().nextInt()};
  List<int> rangeRand([int? max]) {
    return List.generate(this, (index) => Random().nextInt(max ?? this));
  }

  /// {0: true, 1: true, ... , (length - 1): true};
  List<MapEntry<int, bool?>> rangeEntry([bool? value = true]) {
    return range(this).map((e) => MapEntry(e, true)).toList();
  }

  /// {0: true, 2: true, ... , ((length - 1) * 2): true};
  List<MapEntry<int, bool?>> rangeEntryEven([bool? value = true]) {
    return rangeEven(this).map((e) => MapEntry(e, value)).toList();
  }

  /// {1: true, 3: true, ... , (((length + 1) * 2) - 1): true};
  List<MapEntry<int, bool?>> rangeEntryOdd([bool? value = true]) {
    return rangeOdd(this).map((e) => MapEntry(e, value)).toList();
  }

  /// {Random().nextInt(): true, ... , Random().nextInt(): true};
  List<MapEntry<int, bool?>> rangeEntryRand([bool? value = true]) {
    return rangeRand(this).map((e) => MapEntry(e, value)).toList();
  }
}
