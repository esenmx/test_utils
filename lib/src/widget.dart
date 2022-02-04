part of test_utils;

T findWidget<T extends Widget>() {
  return find.byType(T).evaluate().first.widget as T;
}

T findWidgetAt<T extends Widget>(int index) {
  return find.byType(T).evaluate().elementAt(index).widget as T;
}
