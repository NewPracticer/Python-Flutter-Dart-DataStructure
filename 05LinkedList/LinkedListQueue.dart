import 'Queue.dart';
class LinkedListQueue implements Queue{
  @override
  dequeue() {
    // TODO: implement dequeue
    throw UnimplementedError();
  }

  @override
  void enqueue(e) {
    // TODO: implement enqueue
  }

  @override
  getFront() {
    // TODO: implement getFront
    throw UnimplementedError();
  }

  @override
  int getSize() {
    // TODO: implement getSize
    throw UnimplementedError();
  }

  @override
  bool isEmpty() {
    // TODO: implement isEmpty
    throw UnimplementedError();
  }

}

//节点
class _Node<T> {
  _Node? next;

  T? t;

  _Node.empty();

  _Node.all(this.t, this.next);

  factory _Node.head(T t) {
    var result = new _Node.all(t,  null);
    return result;
  }

  @override
  String toString() {
    return t.toString();
  }
}