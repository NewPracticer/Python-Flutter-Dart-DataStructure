import 'Queue.dart';
class ArrayQueue implements Queue{

  List? arr;
  ArrayQueue(){
    arr =<dynamic>[];
  }

  @override
  dequeue() {
    arr!.removeAt(0);
  }

  @override
  void enqueue(e) {
    arr!.add(e);
  }

  @override
  getFront() {
    return arr![0];
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
  String toString() {
    StringBuffer buffer = new StringBuffer();
    buffer.write("Queue: ");
    buffer.write('front [');
    for(int i = 0 ; i < arr!.length ; i ++){
      buffer.write(arr![i]);
      if(i != arr!.length - 1)
        buffer.write(", ");
    }
    buffer.write("] tail");
    return buffer.toString();
  }
}