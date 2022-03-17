import 'dart:collection';

/**
 * 哈希表重构
 */
class HashTableSec<K, V> {
  List? _hashtable;

  int? _size;

  int? _M;

  static final int _upperTol = 10;
  static final int _lowerTol = 2;
  static final int _initCapacity = 7;

  HashTableSec(int M) {
    this._M = M;
    _size = 0;
    _hashtable = List.filled(M, SplayTreeMap, growable: true);
    for (int i = 0; i < M; i++) {
      _hashtable![i] = SplayTreeMap<K, V>();
    }
  }

  factory HashTableSec.withFactory() {
    return HashTableSec(_initCapacity);
  }

  int _hash(K key) {
    return ((key.hashCode & 0x7fffffff) % _M!).toInt();
  }

  int? getSize() {
    return _size;
  }

  add(K key, V value) {
    SplayTreeMap<K, V> map = _hashtable![_hash(key)];
    if (map.containsKey(key))
      map.update(key, (e) => value);
    else {
      map.putIfAbsent(key, () => value);
      _size = _size! + 1;

      if (_size! >= _upperTol * _M!) _resize(2 * _M!);
    }
  }

  V? remove(K key) {
    V? ret = null;
    SplayTreeMap<K, V> map = _hashtable![_hash(key)];
    if (map.containsKey(key)) {
      ret = map.remove(key);
      _size = _size! + 1;

      if(_size! < _lowerTol * _M! && _M! / 2 >= _initCapacity) {
        _resize((_M!/ 2).toInt());
      }
    }
    return ret;
  }

  set(K key, V value) {
    SplayTreeMap<K, V> map = _hashtable![_hash(key)];
    if (!map.containsKey(key)) {
      throw new Exception("$key  doesn't exist!");
    }
    map.update(key, (e) => value);
  }

  bool contains(K key) {
    return _hashtable![_hash(key)].containsKey(key);
  }

  V? get(K key) {
    return _hashtable![_hash(key)][key];
  }

  /**
   * 设置尺寸
   */
  _resize(int newM) {
//    SplayTreeMap<K, V>[] newHashTable = new SplayTreeMap[newM];
    List _newHashtable = List.filled(newM, SplayTreeMap, growable: true);
    for (int i = 0; i < newM; i++) {
      _newHashtable[i] = SplayTreeMap<K, V>();
    }
    int oldM = _M!;
    this._M = newM;
    for (int i = 0; i < oldM; i++) {
      SplayTreeMap<K, V> map = _hashtable![i];
      for (K key in map.keys) {
        _newHashtable[_hash(key)].put(key, map[key]);
      };
    }

    this._hashtable = _newHashtable;
  }
}
