import 'MaxHeap.dart';

/**
 * 堆排序
 * 以及堆排序优化
 */
class HeapSort {
  HeapSort() {}

  static sort<E extends Comparable<E>>(List data) {
    MaxHeap<E> maxHeap = MaxHeap.withCapacity(10);
    for (E e in data) {
      maxHeap.add(e);
    };

    for (int i = data.length - 1; i >= 0; i--) {
      data[i] = maxHeap.extractMax();
    }
  }

  static sort2<T extends Comparable<T>>(List data) {
    if (data.length <= 1) return;

    for (int i = (data.length - 2) / 2 as int; i >= 0; i--){
      _siftDown(data, i, data.length);
    }
    for (int i = data.length - 1; i >= 0; i--) {
      _swap(data, 0, i);
      _siftDown(data, 0, i);
    }
  }

  // 对 data[0, n) 所形成的最大堆中，索引 k 的元素，执行 siftDown
  static _siftDown<T>(List? data, int k, int n) {
    while (2 * k + 1 < n) {
      int j = 2 * k + 1; // 在此轮循环中,data[k]和data[j]交换位置
      if (j + 1 < n && data![j + 1].compareTo(data[j]) > 0) {
        j++;
      }
      // data[j] 是 leftChild 和 rightChild 中的最大值
      if (data![k].compareTo(data[j]) >= 0) {
        break;
      }
      _swap(data, k, j);
      k = j;
    }
  }

  static _swap<E>(List arr, int i, int j) {
    E t = arr[i];
    arr[i] = arr[j];
    arr[j] = t;
  }
}
