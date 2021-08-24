import 'MaxHeap.dart';

/**
 * 堆排序
 */
class HeapSort {

  HeapSort() {

  }
  static sort<E extends Comparable<E>>(List data) {
    MaxHeap<E> maxHeap = MaxHeap.withCapacity(10);
    for (E e in data){
      maxHeap.add(e);
    }
    for (int i = data.length - 1; i >= 0; i --)
      data[i] = maxHeap.extractMax();
  }

}