import 'Queue.dart';
import 'MaxHeap.dart';

class PriorityQueue<E extends Comparable<E>> implements Queue<E> {

  MaxHeap<E>? maxHeap;

  PriorityQueue(){
    maxHeap = new MaxHeap.withEmpty();
  }

  @override
  int? getSize(){
    return maxHeap!.size();
  }

  @override
  bool isEmpty(){
    return maxHeap!.isEmpty();
  }

  @override
  E getFront(){
    return maxHeap!.findMax();
  }

  @override
  enqueue(E e){
    maxHeap!.add(e);
  }

  @override
  dequeue(){
    return maxHeap!.extractMax();
  }
}