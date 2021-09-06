import 'dart:math';
import 'FileOperator.dart';

/**
 * AVL树
 */
class AVLTree<K extends Comparable<K>, V> {
  _Node? root;

  int? size;

  AVLTree() {
    root = null;
    size = 0;
  }

  @override
  add(key, value) {
    // TODO: implement add
    root = _addNode(root, key, value);
  }

  _Node _addNode(_Node? node, K key, V value) {
    if (node == null) {
      size = size! + 1;
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
    //更新height
    node.height =
        1 + [_getHeight(node.left), _getHeight(node.right)].reduce(max);
    // 计算平衡因子
    int balanceFactor = getBalanceFactor(node);
    if (balanceFactor.abs() > 1) {
//      print("unbalanced: $balanceFactor");
    }
    return node;
  }

  // 判断该二叉树是否是一棵平衡二叉树
  bool  isBalanced(){
    return _isBalancedDetail(root);
  }

  // 判断以Node为根的二叉树是否是一棵平衡二叉树，递归算法
  bool _isBalancedDetail(_Node? node){

    if(node == null)
      return true;

    int balanceFactor = getBalanceFactor(node);
    if(balanceFactor.abs() > 1)
      return false;
    return _isBalancedDetail(node.left) && _isBalancedDetail(node.right);
  }

  //获得节点node的平衡因子
  int getBalanceFactor(_Node node) {
    if (node == null) return 0;
    return _getHeight(node.left) - _getHeight(node.right);
  }

  // 判断该二叉树是否是一棵二分搜索树
  bool isBST() {

    List keys = List.empty(growable: true);
    _inOrder(root, keys);
    for(int i = 1 ; i < keys.length ; i ++) {
      if (keys[i-1].compareTo (keys[i])>0) {
        return false;
      }
    }
    return true;
  }

  _inOrder(_Node? node, List? keys) {
    if (node == null) return;

    _inOrder(node.left, keys);
    keys!.add(node._key);
    _inOrder(node.right, keys);
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
    return _getNode(root, key) != null;
  }

  @override
  get(key) {
    _Node? node = _getNode(root, key);
    return node == null ? null : node._value;
  }

  @override
  int? getSize() {
    return size;
  }

  @override
  bool isEmpty() {
    return size == 0;
  }

  // 获得节点node的高度
  int _getHeight(_Node? node) {
    if (node == null) return 0;
    return node.height;
  }

  @override
  remove(key) {
    _Node? node = _getNode(root, key);
    if (node != null) {
      root = _removeNode(root!, key);
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
        size = size! - 1;
        return rightNode;
      }
      // 待删除节点右子树为空的情况
      if (node.right == null) {
        _Node? leftNode = node.left;
        node.left = null;
        size = size! - 1;
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
      size = size! - 1;
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
    _Node? node = _getNode(root, key);
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

  int height = 1;

  _Node(K key, V value) {
    this._key = key;
    this._value = value;
    left = null;
    right = null;
  }
}

void main() async {
  List result = await FileOperator.getFileString('text2.txt');
  AVLTree<String, int> map = AVLTree();
  for (String word in result) {
    if (map.contains(word))
      map.set(word, map.get(word) + 1);
    else
      map.add(word, 1);
  }
  print("Total different words:  ${map.getSize()}");
  print("Frequency of PRIDE: ${map.get("pride")}");
  print("Frequency of PREJUDICE:  ${map.get("prejudice")}");

  print("is BST : ${map.isBST()}");
  print("is Balanced :  ${map.isBalanced()}");
}
