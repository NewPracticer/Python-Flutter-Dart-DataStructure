/**
 * 最小堆
 */
class MinHeap<E extends Comparable<E>> {
  List? _data;

  MinHeap.withCapacity(int capacity) {
    _data = List.filled(capacity, E, growable: true);
  }

  MinHeap.withEmpty() {
    _data = List.empty(growable: true);
  }

  // 返回堆中的元素个数
  int? size() {
    return _data!.length;
  }

  // 返回一个布尔值, 表示堆中是否为空
  bool isEmpty() {
    return _data!.isEmpty;
  }

  int _parent(int index) {
    if (index == 0) {
      throw Exception("index-0 doesn't have parent.");
    }
    return ((index - 1) / 2).toInt();
  }

  // 返回完全二叉树的数组表示中，一个索引所表示的元素的左孩子节点的索引
  int _leftChild(int index) {
    return index * 2 + 1;
  }

  // 返回完全二叉树的数组表示中，一个索引所表示的元素的右孩子节点的索引
  int _rightChild(int index) {
    return index * 2 + 2;
  }

  // 向堆中添加元素
  add(E e) {
    _data!.add(e);
    siftUp(_data!.length - 1);
  }

  siftUp(int k) {
    while (k > 0 && _data![_parent(k)].compareTo(_data![k]) > 0) {
      _swap(k, _parent(k));
      k = _parent(k);
    }
  }

  // 看堆中的最大元素
  E findMin() {
    if (_data!.length == 0)
      throw new Exception("Can not findMax when heap is empty.");
    return _data![0];
  }

  // 取出堆中最大元素
  E extractMax() {
    E ret = findMin();
    _swap(0, _data!.length - 1);
    _data!.removeLast();
    _siftDown(0);

    return ret;
  }

  _siftDown(int k) {
    while (_leftChild(k) < _data!.length) {
      int j = _leftChild(k); // 在此轮循环中,_data[k]和data[j]交换位置
      if (j + 1 < _data!.length && _data![j + 1].compareTo(_data![j]) < 0) {
        j++;
      }
      // _data[j] 是 leftChild 和 rightChild 中的最大值
      if (_data![k].compareTo(_data![j]) <= 0) {
        break;
      }
      _swap(k, j);
      k = j;
    }
  }

  // 取出堆中的最大元素，并且替换成元素e
  E replace(E e) {
    E ret = findMin();
    _data![0] = e;
    ;
    _siftDown(0);
    return ret;
  }

  _swap(int i, int j) {
    if (i < 0 || i >= _data!.length || j < 0 || j >= _data!.length)
      throw new Exception("Index is illegal.");

    E t = _data![i];
    _data![i] = _data![j];
    _data![j] = t;
  }
}
