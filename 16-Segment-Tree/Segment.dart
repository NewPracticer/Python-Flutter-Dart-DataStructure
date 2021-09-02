import 'Merger.dart';

/**
 * 线段树
 */
class SegmentTree<E> {
  List? _tree;

  List? _data;

  Merger<E>? _merger;

  SegmentTree(List? arr, Merger<E> merger) {
    this._merger = merger;
    _data = List.filled(arr!.length, E, growable: false);
    for (var i = 0; i < arr.length; i++) {
      _data![i] = arr[i];
    }
    _tree = List.filled(arr.length * 4, E, growable: false);
    _buildSegmentTree(0, 0, arr.length - 1);
  }

  // 在treeIndex的位置创建表示区间[l...r]的线段树
  _buildSegmentTree(int treeIndex, int left, int right) {
    if (left == right) {
      _tree![treeIndex] = _data![left];
      return;
    }

    int leftTreeIndex = _leftChild(treeIndex);
    int rightTreeIndex = _rightChild(treeIndex);

    // int mid = (l + r) / 2;
    int mid = left + ((right - left) / 2).toInt();
    _buildSegmentTree(leftTreeIndex, left, mid);
    _buildSegmentTree(rightTreeIndex, mid + 1, right);

    _tree![treeIndex] =
        _merger!.merge(_tree![leftTreeIndex], _tree![rightTreeIndex]);
  }

  int getSize() {
    return _data!.length;
  }

  get(int index) {
    if (index < 0 || index >= _data!.length) {
      throw new Exception("Index is illegal.");
    }
    return _data![index];
  }

  // 返回完全二叉树的数组表示中，一个索引所表示的元素的左孩子节点的索引
  int _leftChild(int index) {
    return 2 * index + 1;
  }

  // 返回完全二叉树的数组表示中，一个索引所表示的元素的右孩子节点的索引
  int _rightChild(int index) {
    return 2 * index + 2;
  }

  @override
  String toString() {
    StringBuffer res = new StringBuffer();
    res.write('[');
    for(int i = 0 ; i < _tree!.length ; i ++){
      if(_tree![i] != null)
        res.write(_tree![i]);
      else
        res.write("null");

      if(i != _tree!.length - 1)
        res.write(", ");
    }
    res.write(']');
    return res.toString();
  }
}
