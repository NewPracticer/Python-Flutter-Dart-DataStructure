import 'FileOperator.dart';

/**
 * 红黑树
 */
class RBTree<K extends Comparable<K>, V> {
  _Node? _root;

  int? _size;

  static const bool _RED = true;
  static const bool _BLACK = false;

  RBTree() {
    _root = null;
    _size = 0;
  }

  @override
  int? getSize() {
    return _size;
  }

  @override
  bool isEmpty() {
    return _size == 0;
  }

  // 判断节点node的颜色
  bool _isRed(_Node? node) {
    if (node == null) return _BLACK;
    return node.color!;
  }

  //   node                     x
  //  /   \     左旋转         /  \
  // T1   x   --------->   node   T3
  //     / \              /   \
  //    T2 T3            T1   T2
  _Node? _leftRotate(_Node node) {
    _Node? x = node.right;

    // 左旋转
    node.right = x?.left;
    x?.left = node;

    x?.color = node.color;
    node.color = _RED;

    return x;
  }

  //     node                   x
  //    /   \     右旋转       /  \
  //   x    T2   ------->   y   node
  //  / \                       /  \
  // y  T1                     T1  T2
  _Node? _rightRotate(_Node node) {
    _Node? x = node.left;

    // 右旋转
    node.left = x?.right;
    x?.right = node;

    x?.color = node.color;
    node.color = _RED;

    return x;
  }

  // 颜色翻转
  _flipColors(_Node? node) {
    node!.color = _RED;
    node.left!.color = _BLACK;
    node.right!.color = _BLACK;
  }

  @override
  add(key, value) {
    _root = _addNode(_root, key, value);
    _root!.color = _BLACK; // 最终根节点为黑色节点
  }

  _Node? _addNode(_Node? node, K key, V value) {
    if (node == null) {
      _size = _size! + 1;
      return new _Node(key, value);
    }

    if (key.compareTo(node._key) < 0) {
      node.left = _addNode(node.left, key, value);
    } else if (key.compareTo(node._key) > 0) {
      node.right = _addNode(node.right, key, value);
    } else {
      // key.compareTo(node.key) == 0
      node._value = value;
    }

    if (_isRed(node.right) && !_isRed(node.left)) {
      node = _leftRotate(node);
    }
    if (_isRed(node!.left) && _isRed(node.left!.left)) {
      node = _rightRotate(node);
    }
    if (_isRed(node!.left) && _isRed(node.right)) {
      _flipColors(node);
    }
    return node;
  }

  _Node? _getNode(_Node? node, K key) {
    if (node == null) {
      return null;
    }

    if (key.compareTo(node._key) == 0) {
      return node;
    } else if (key.compareTo(node._key) < 0) {
      return _getNode(node.left, key);
    } else {
      // if(key.compareTo(node.key) > 0)
      return _getNode(node.right, key);
    }
  }

  @override
  bool contains(key) {
    return _getNode(_root, key) != null;
  }

  @override
  get(key) {
    _Node? node = _getNode(_root, key);
    return node == null ? null : node._value;
  }

  @override
  remove(key) {
    _Node? node = _getNode(_root, key);
    if (node != null) {
      _root = _removeNode(_root!, key);
      return node._value;
    }
    return null;
  }

  _Node? _removeNode(_Node node, K key) {
    if (node == null) {
      return null;
    }
    if (key.compareTo(node._key) < 0) {
      node.left = _removeNode(node.left!, key);
      return node;
    } else if (key.compareTo(node._key) > 0) {
      node.right = _removeNode(node.right!, key);
      return node;
    } else {
      // 待删除节点左子树为空的情况
      if (node.left == null) {
        _Node? rightNode = node.right;
        node.right = null;
        _size = _size! - 1;
        return rightNode;
      }
      // 待删除节点右子树为空的情况
      if (node.right == null) {
        _Node? leftNode = node.left;
        node.left = null;
        _size = _size! - 1;
        return leftNode;
      }
      // 待删除节点左右子树均不为空的情况
      // 找到比待删除节点大的最小节点, 即待删除节点右子树的最小节点
      // 用这个节点顶替待删除节点的位置
      _Node successor = _minimum(node.right!);
      successor.right = _removeMin(node.right!);
      successor.left = node.left;
      node.left = node.right = null;
      return successor;
    }
  }

  // 删除掉以node为根的二分搜索树中的最小节点
  // 返回删除节点后新的二分搜索树的根
  _Node _removeMin(_Node node) {
    if (node.left == null) {
      _Node? rightNode = node.right;
      node.right = null;
      _size = _size! - 1;
      return rightNode!;
    }
    node.left = _removeMin(node.left!);
    return node;
  }

  // 返回以node为根的二分搜索树的最小值所在的节点
  _Node _minimum(_Node node) {
    if (node.left == null) {
      return node;
    }
    return _minimum(node.left!);
  }

  @override
  set(key, newValue) {
    _Node? node = _getNode(_root, key);
    if (node == null) {
      throw new Exception(" $key + doesn't exist!");
    }
    node._value = newValue;
  }
}

class _Node<K, V> {
  K? _key;

  V? _value;

  _Node? left, right;

  bool? color;

  _Node(K key, V value) {
    this._key = key;
    this._value = value;
    left = null;
    right = null;
    color = true;
  }
}

void main() async {
  List result = await FileOperator.getFileString('text2.txt');
  RBTree<String, int> map = RBTree();
  for (String word in result) {
    if (map.contains(word))
      map.set(word, map.get(word) + 1);
    else
      map.add(word, 1);
  }
  print("Total different words:  ${map.getSize()}");
  print("Frequency of PRIDE: ${map.get("pride")}");
  print("Frequency of PREJUDICE:  ${map.get("prejudice")}");

}
