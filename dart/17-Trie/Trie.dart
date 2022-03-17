import 'dart:collection';

class Trie {
  _Node? _root;

  int? _size;

  Trie() {
    _root = _Node();
    _size = 0;
  }

  int? getSize() {
    return _size;
  }

  add(String? word) {
    _Node? cur = _root;
    for (int i = 0; i < word!.length; i++) {
      String c = word[i];
      if (cur!.next![c] == null) {
        cur.next!.putIfAbsent(c, () => _Node());
      }
      cur = cur.next![c];
    }
    if (!(cur!.isWord!)) {
      cur.isWord = true;
      _size = _size! + 1;
    }
  }

  // 查询单词word是否在Trie中
  bool contains(String word) {
    _Node? cur = _root;
    for (int i = 0; i < word.length; i++) {
      String c = word[i];
      if (cur!.next![c] == null) {
        return false;
      }
      cur = cur.next![c];
    }
    return cur!.isWord!;
  }

  // 查询是否在Trie中有单词以prefix为前缀
  bool isPrefix(String prefix){
    _Node? cur = _root;
    for(int i = 0 ; i < prefix.length ; i ++){
      String c = prefix[i];
      if(cur!.next![c] == null){
        return false;
      }
      cur = cur.next![c];
    }
    return true;
  }
}

class _Node {
  bool? isWord;

  SplayTreeMap<String, _Node>? next;

  _Node.isWord(bool isWord) {
    this.isWord = isWord;
    next = new SplayTreeMap();
  }

  factory _Node() {
    return _Node.isWord(false);
  }
}
