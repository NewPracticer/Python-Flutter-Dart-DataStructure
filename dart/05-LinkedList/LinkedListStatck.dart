import 'Stack.dart';
import 'LinkedList.dart';

class LinkedListStack implements Stack{

  LinkedList? _linkedList;

  LinkedListStack(){
    _linkedList =new LinkedList();
  }

  @override
  int getSize() {
    return _linkedList!.getSize();
  }

  @override
  bool isEmpty() {
    return _linkedList!.isEmpty();
  }

  @override
  peek() {
    return _linkedList!.getFirst();
  }

  @override
  pop() {
    _linkedList!.removeFirst();
  }

  @override
  void push(e) {
    _linkedList!.addFirst(e);
  }

  @override
  String toString() {
    StringBuffer res = new StringBuffer();
    res.write("Stack:top ");
    res.write(_linkedList);
    return res.toString();
  }
  
}