import 'Queue.dart';

class LoopQueue<T> implements Queue<T>{

  List? arr;
  int front = 0,tail=0;
  int size =0;

  LoopQueue(){
    arr = List.filled(10, false);
  }

  int getCapacity(){
    int capacity =  arr!.length;
    return capacity;
  }

  @override
  dequeue() {
    T ret = arr![front];
    arr![front] = null;
    front = (front + 1) % arr!.length;
    size--;
    if(size == getCapacity() / 4 && getCapacity() / 2 != 0){
      resize((getCapacity()/2) as int);
    }
    return ret;
  }

  void resize(int newCapacity){

    List? newArr = List.filled(newCapacity, false);
    for(int i = 0 ; i < arr!.length ; i ++){
      newArr[i] = arr![(i + front) % arr!.length];
    }
    arr = newArr;
    front = 0;
    tail = size;
  }

  @override
  void enqueue(e) {

    if((tail + 1) % arr!.length == front)
      resize(getCapacity() * 2);
    arr![tail] = e;
    tail = (tail + 1) % arr!.length;
    size++;
  }

  @override
  getFront() {
    if(isEmpty()){
      throw Exception("Queue is empty.");
    }
    return arr![front];
  }

  @override
  int getSize() {
    return arr!.length;
  }

  @override
  bool isEmpty() {
    return front == tail ;
  }

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    buffer.write("Queue: size = $size , capacity = ${getCapacity()} \n");
    buffer.write('front [');
    for(int i = front ; i != tail ; i = (i + 1) % arr!.length){
      buffer.write(arr![i]);
      if((i + 1) % arr!.length != tail)
        buffer.write(", ");
    }
    buffer.write("] tail");
    return buffer.toString();
  }

}