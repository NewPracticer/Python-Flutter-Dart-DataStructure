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

  query(int queryL, int queryR) {
    if (queryL < 0 ||
        queryL >= _data!.length ||
        queryR < 0 ||
        queryR >= _data!.length ||
        queryL > queryR) {
      throw new Exception("Index is illegal.");
    }
    return _queryDetail(0, 0, _data!.length - 1, queryL, queryR);
  }

  _queryDetail(int treeIndex, int l, int r, int queryL, int queryR) {
    if (l == queryL && r == queryR) {
      return _tree![treeIndex];
    }
    int mid = l + ((r - l) / 2).toInt();
    // treeIndex的节点分为[l...mid]和[mid+1...r]两部分

    int leftTreeIndex = _leftChild(treeIndex);
    int rightTreeIndex = _rightChild(treeIndex);
    if (queryL >= mid + 1) {
      return _queryDetail(rightTreeIndex, mid + 1, r, queryL, queryR);
    } else if (queryR <= mid) {
      return _queryDetail(leftTreeIndex, l, mid, queryL, queryR);
    }
    E leftResult = _queryDetail(leftTreeIndex, l, mid, queryL, mid);
    E rightResult = _queryDetail(rightTreeIndex, mid + 1, r, mid + 1, queryR);
    return _merger!.merge(leftResult, rightResult);
  }

  //将index位置的值，更新为e
  set(int index, E e){
    if(index < 0 || index >= _data!.length) {
      throw new Exception("Index is illegal");
    }
    _data![index] = e;
    _setDetail(0, 0, _data!.length - 1, index, e);
  }

  // 在以treeIndex为根的线段树中更新index的值为e
  _setDetail(int treeIndex, int l, int r, int index, E e){
    if(l == r){
      _tree![treeIndex] = e;
      return;
    }
    int mid = l + ((r - l) / 2).toInt();
    // treeIndex的节点分为[l...mid]和[mid+1...r]两部分
    int leftTreeIndex = _leftChild(treeIndex);
    int rightTreeIndex = _rightChild(treeIndex);
    if(index >= mid + 1) {
      _setDetail(rightTreeIndex, mid + 1, r, index, e);
    }else { // index <= mid
      _setDetail(leftTreeIndex, l, mid, index, e);
    }
    _tree![treeIndex] = _merger!.merge(_tree![leftTreeIndex], _tree![rightTreeIndex]);
  }

  @override
  String toString() {
    StringBuffer res = new StringBuffer();
    res.write('[');
    for (int i = 0; i < _tree!.length; i++) {
      if (_tree![i] != null) {
        res.write(_tree![i]);
      } else {
        res.write("null");
      }
      if (i != _tree!.length - 1) {
        res.write(", ");
      }
    }
    res.write(']');
    return res.toString();
  }
}
