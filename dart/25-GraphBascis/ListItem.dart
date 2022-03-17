import 'dart:collection';

class LinkedListEntryImpl<int> extends LinkedListEntry<LinkedListEntryImpl<int>> {
  final int value;

  LinkedListEntryImpl(this.value);

  @override
  String toString() {
    return "value is $value";
  }
}


