import 'dart:collection';

/**
 * 哈希表
 */
class HashTable<K, V>{

  List? _hashtable;
  int? _size;
  int? _M;

  HashTable(int M){
    this._M = M;
    _size = 0;
    _hashtable = List.filled(M, SplayTreeMap,growable: true);
    for(int i = 0 ; i < M ; i ++)
      _hashtable![i] =SplayTreeMap<K,V>();
  }

  factory HashTable.withFactory(){
    return HashTable(97);
  }

  int _hash(K key){
    return ((key.hashCode & 0x7fffffff) % _M!).toInt();
  }

  int? getSize(){
    return _size;
  }

  add(K key, V value){
    SplayTreeMap<K, V> map = _hashtable![_hash(key)];
    if(map.containsKey(key))
      map.update(key,(e)=>value);
    else{
      map.putIfAbsent(key, ()=>value);
      _size = _size!+1;
    }
  }

  V? remove(K key){
    V? ret = null;
    SplayTreeMap<K, V> map = _hashtable![_hash(key)];
    if(map.containsKey(key)){
      ret = map.remove(key);
      _size = _size!+1;
    }
    return ret;
  }

  set(K key, V value){
    SplayTreeMap<K, V> map = _hashtable![_hash(key)];
    if(!map.containsKey(key)) {
      throw new Exception("$key  doesn't exist!");
    }
    map.update(key, (e)=>value);
  }

  bool contains(K key){
    return _hashtable![_hash(key)].containsKey(key);
  }

  V? get(K key){
    return _hashtable![_hash(key)][key];
  }
}