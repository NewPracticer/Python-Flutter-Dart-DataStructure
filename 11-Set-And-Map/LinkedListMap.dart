import 'Map.dart';

/**
 * 链表映射
 */
class LinkedListMap<K ,V> extends Map<K ,V>{

  _Node? dummyHead;
  int? size;

  @override
  add(key, value) {
    _Node? node = _getNode(key);
    if(node == null){
      dummyHead!.next = _Node(key, value, dummyHead!.next);
      size = size! + 1;
    }
    else{
      node.value = value;
    }
  }

  LinkedListMap(){
    dummyHead =_Node.withEmty();
    size = 0;
  }

  @override
  bool contains(key) {
    return _getNode(key) != null;
  }

  @override
  get(key) {
    _Node? node = _getNode(key);
    return node == null ? null : node.value;
  }

  @override
  int? getSize() {
    return size;
  }

  @override
  bool isEmpty() {
    return size == 0;
  }

  @override
  V? remove(K key) {
    _Node prev = dummyHead!;
    while(prev.next != null){
      if(prev.next!.key.equals(key))
        break;
      prev = prev.next!;
    }

    if(prev.next != null){
      _Node delNode = prev.next!;
      prev.next = delNode.next;
      delNode.next = null;
      size = size! -1;
      return delNode.value;
    }

    return null;
  }

  @override
  set(K key, newValue) {
    _Node? node = _getNode(key);
    if(node == null){
      throw new Exception("${key} doesn't exist!");
    }
    node.value = newValue;
  }

  _Node? _getNode(K key){
    _Node? cur = dummyHead!.next;
    while(cur != null){
      if(cur.key.equals(key))
        return cur;
      cur = cur.next;
    }
    return null;
  }

}
class _Node<K ,V >{
  K? key;
  V? value;
  _Node? next;

  _Node(this.key, this.value, this.next);

  _Node.withEmptyHead(K key, V value){
    _Node(key, value, null);
  }

  _Node.withEmty(){
    _Node(null, null, null);
  }
  @override
  String toString() {
    StringBuffer res =new StringBuffer();
    res.write("${key.toString()} : ${value.toString()}");
    return res.toString();
  }
}

