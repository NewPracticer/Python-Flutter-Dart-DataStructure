import 'Queue.dart';

/**
 * 带尾结点的队列
 */
class LinkedListQueue implements Queue{

  late _Node? _head;
  late _Node? _tail;
  late int _size;

  LinkedListQueue(){
    _head = null;
    _tail = null;
    _size = 0;
  }

  @override
  dequeue() {
    if (isEmpty()) {
      throw Exception("Cannot dequeue from an empty queue");
    }
    _Node retNode = _head!;
    _head = _head!.next;
    retNode.next = null;
    if(_head == null){
      _tail =null;
    }
    _size --;
    return retNode.t;
  }

  @override
  void enqueue(e) {
    if(_tail == null){
      _tail = _Node.wihtHead(e);
      _head = _tail;
    }else{
    _tail!.next =_Node.wihtHead(e);
    _tail = _tail!.next;
    }
    _size++;
  }

  @override
  getFront() {
    if (isEmpty()) {
      throw Exception("Queue is empty");
    }
    return _head!.t;
  }

  @override
  int getSize() {
    return _size;
  }

  @override
  bool isEmpty() {
    return _size == 0;
  }

  @override
  String toString() {
    StringBuffer res =new StringBuffer();
    res.write("Queue: front ");
    for(_Node? cur = _head!.next ; cur != null ; cur = cur.next){
      res.write(cur);
      res.write("->");
    }
    res.write("NULL tail");
    return res.toString();
  }

}

//节点
class _Node<T> {
  _Node? next;

  T? t;

  _Node();

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

void main(){
  LinkedListQueue queue = new LinkedListQueue();
  for(int i = 0 ; i < 10 ; i ++){
    queue.enqueue(i);
    print(queue);
    if(i % 3 ==2){
      queue.dequeue();
      print(queue);
    }
  }
}