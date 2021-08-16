class LinkedList<T> {
  _Node? _dummyHead;
  late int _size;

  LinkedList() {
    _dummyHead = new _Node.withEmpty();
    _size = 0;
  }

  int getSize() {
    return _size;
  }

  bool isEmpty() {
    return _size == 0;
  }

  remove(int index){
    if (index < 0 || index > _size) {
      throw Exception("Remove Failed,Illegal index");
    }
    _Node? prev = _dummyHead;
    for(var i =0;i<index ;i++){
      prev = prev?.next;
    }
    _Node? retNode = prev!.next;
    prev.next = retNode!.next;
    retNode.next = null;
    _size --;
    return retNode.t;
  }

  //从链表中删除第一个元素，返回删除元素
  T? removeFirst(){
    remove(0);
  }
  //从链表中删除第一个元素，返回删除元素
  T? removeLast(){
    remove(_size -1);
  }


  //在链表的index位置添加新的元素e
  add(int index, T t) {
    if (index < 0 || index > _size) {
      throw Exception("Add Failed,Illegal index");
    }
//      if(index == 0){
//         addFirst(t);
//      }else{
    _Node? prev = _dummyHead;
    for (var i = 0; i < index; i++) {
      prev = prev?.next;
    }
    _Node _node = new _Node.wihtHead(t);
    _node.next = prev?.next;
    prev?.next = _node;
    _size++;
//      }
  }

  addLast(T t) {
    add(_size, t);
  }

  addFirst(T t) {
//      _Node _node =new _Node.head(t);
//      _node.next = _head;
//      _head = _node;
    add(0, t);
  }

  //获取链表第index位置的元素
  T get(int index){
    if (index < 0 || index > _size) {
      throw Exception("Get Failed,Illegal index");
    }
    _Node? cur = _dummyHead!.next;
    for(var i=0;i<index;i++){
      cur = cur!.next;
    }
    return cur!.t;
  }

  T getFirst(){
    return get(0);
  }
  T getLast(){
    return get(_size-1);
  }
  set(int index,T t){
    if (index < 0 || index > _size) {
      throw Exception("Set Failed,Illegal index");
    }
    _Node? cur = _dummyHead!.next;
    for(var i =0;i<index;i++){
      cur = cur!.next;
    }
    cur!.t= t;
  }

  bool contains(T t){
    _Node? cur = _dummyHead!.next;
    for(var i =0;i<_size-1;i++){
      if(cur!.t.compareTo(t)){
        return true;
      }
      cur = cur.next;
    }
    return false;
  }

  @override
  String toString() {
    StringBuffer res =new StringBuffer();
    for(_Node? cur = _dummyHead!.next ; cur != null ; cur = cur.next){
      res.write(cur);
      res.write("->");
    }
    res.write("NULL");
    return res.toString();
  }
}
//节点
class _Node<T> {
   _Node? next;

  T? t;

  _Node.withEmpty();

  _Node.withAll(this.t, this.next);

  factory _Node.wihtHead(T t) {
    var result = new _Node.withAll(t,  null);
    return result;
  }

  @override
  String toString() {
    return t.toString();
  }
}
