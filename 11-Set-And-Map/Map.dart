abstract class Map<K,V>{
  add(K key, V value);
  V? remove(K key);
  bool contains(K key);
  V get(K key);
  set(K key, V newValue);
  int? getSize();
  bool isEmpty();
}