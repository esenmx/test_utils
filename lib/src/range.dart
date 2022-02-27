part of test_utils;

extension RangeIntEx on int {
  /// [0, ... , length - 1]
  List<int> range([int? offset]) {
    return List.generate(this, (i) => i + (offset ?? 0));
  }

  /// [0, 2, 4, ... , (length - 1) * 2]
  List<int> rangeEven([int? offset]) {
    return List.generate(this, (i) => i * 2 + (offset ?? 0) * 2);
  }

  /// [1, 3, 5, ... , ((length + 1) * 2) - 1]
  List<int> rangeOdd([int? offset]) {
    return List.generate(this, (i) => i * 2 + 1 + (offset ?? 0) * 2);
  }

  /// {Random().nextInt(), Random().nextInt(), ... , Random().nextInt()};
  List<int> rangeRand([int? max]) {
    return List.generate(this, (i) => Random().nextInt(max ?? this));
  }

  /// {0: true, 1: true, ... , (length - 1): true};
  List<MapEntry<int, bool?>> rangeEntry([bool? value = true]) {
    return range().map((e) => MapEntry(e, value)).toList();
  }

  /// {0: true, 2: true, ... , ((length - 1) * 2): true};
  List<MapEntry<int, bool?>> rangeEntryEven([bool? value = true]) {
    return rangeEven().map((e) => MapEntry(e, value)).toList();
  }

  /// {1: true, 3: true, ... , (((length + 1) * 2) - 1): true};
  List<MapEntry<int, bool?>> rangeEntryOdd([bool? value = true]) {
    return rangeOdd().map((e) => MapEntry(e, value)).toList();
  }

  /// {Random().nextInt(): true, ... , Random().nextInt(): true};
  List<MapEntry<int, bool?>> rangeEntryRand([bool? value = true]) {
    return rangeRand().map((e) => MapEntry(e, value)).toList();
  }
}
