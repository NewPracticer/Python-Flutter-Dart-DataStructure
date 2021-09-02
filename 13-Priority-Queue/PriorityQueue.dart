import 'Queue.dart';
import 'MaxHeap.dart';

class PriorityQueue<E extends Comparable<E>> implements Queue<E> {

  MaxHeap<E>? _maxHeap;

  PriorityQueue(){
    _maxHeap = new MaxHeap.withEmpty();
  }

  @override
  int? getSize(){
    return _maxHeap!.size();
  }

  @override
  bool isEmpty(){
    return _maxHeap!.isEmpty();
  }

  @override
  E getFront(){
    return _maxHeap!.findMax();
  }

  @override
  enqueue(E e){
    _maxHeap!.add(e);
  }

  @override
  dequeue(){
    return _maxHeap!.extractMax();
  }
}