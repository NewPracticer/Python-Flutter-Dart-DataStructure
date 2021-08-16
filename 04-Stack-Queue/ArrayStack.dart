import 'Stack.dart';
class ArrayStack<T> implements Stack<T>{

  List? arr;
  ArrayStack(){
    arr =<dynamic>[];
  }

  @override
  int getSize() {
    return arr!.length;
  }

  @override
  bool isEmpty() {
    return arr!.isEmpty;
  }

  @override
  T peek() {
    return arr![0];
  }

  @override
  T pop() => arr!.removeLast();

  @override
  void push(T e) {
    arr!.add(e);
  }

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    buffer.write("Stack: ");
    buffer.write('[');
    for(int i = 0 ; i < arr!.length ; i ++){
      buffer.write(arr![i]);
      if(i != arr!.length - 1)
        buffer.write(", ");
    }
    buffer.write("] top");
    return buffer.toString();
  }

}