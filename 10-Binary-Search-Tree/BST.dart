/**
 * 二分搜索树
 */
class BST<T extends Comparable<T>> {
  _Node? root;

  int? size;

  BST() {
    root = null;
    size = 0;
  }

  int? getSize() {
    return size;
  }

  bool isEmpty() {
    return size == 0;
  }

  //添加元素
//  add(T t) {
//    if (root == null) {
//      root = _Node(t);
//      size = size! + 1;
//    } else {
//      addNext(root, t);
//    }
//  }
  add(T e) {
    root = addNext(root, e);
  }

//  向以node为根的二分搜索树中插入元素e，递归算法
//  addNext(_Node? node, T? t) {
//    if (t! == node!.e)
//      return;
//    else if (t.compareTo(node.e) < 0 && node.left == null) {
//      node.left = _Node(t);
//      size = size! +1;
//      return;
//    } else if (t.compareTo(node.e) > 0 && node.right == null) {
//      node.right = _Node(t);
//      size = size! +1;
//      return;
//    }
//    if (t.compareTo(node.e) < 0)
//      addNext(node.left, t);
//    else //e.compareTo(node.e) > 0
//      addNext(node.right, t);
//  }
  //返回新节点后二分搜索树的根
  _Node addNext(_Node? node, T t) {
    if (node == null) {
      size = size! + 1;
      return _Node(t);
    }
    if (t.compareTo(node.e) < 0) {
      node.left = addNext(node.left, t);
    } else if (t.compareTo(node.e) > 0) {
      node.right = addNext(node.right, t);
    }
    return node;
  }

  // 向二分搜索树中添加新的元素e，非递归写法
  add2(T e) {
    if (root == null) {
      root = _Node(e);
      size = size! + 1;
      return;
    }
    _Node? p = root;
    while (p != null) {
      if (e.compareTo(p.e) < 0) {
        if (p.left == null) {
          p.left = _Node(e);
          size = size! + 1;
          return;
        }
        p = p.left;
      } else if (e.compareTo(p.e) > 0) {
        if (p.right == null) {
          p.right = _Node(e);
          size = size! + 1;
          return;
        }
        p = p.right;
      } else
        return;
    }
  }

  //查询元素是否包含
  bool contains(T t) {
    return _containsAll(root, t);
  }

  bool _containsAll(_Node? node, T t) {
    if (node == null) {
      return false;
    }
    if (t.compareTo(node.e) == 0) {
      return true;
    } else if (t.compareTo(node.e) < 0) {
      return _containsAll(node.left, t);
    } else {
      return _containsAll(node.right, t);
    }
  }

  // 二分搜索树的前序遍历
  preOrder() {
    _preOrderDetail(root!);
  }

  _preOrderDetail(_Node? node) {
    if (node == null) {
      return;
    }
    print(node.e);
    _preOrderDetail(node.left);
    _preOrderDetail(node.right);
  }

  inOrder() {
    _inOrderDetail(root);
  }

  _inOrderDetail(_Node? node) {
    if (node == null) {
      return;
    }
    _inOrderDetail(node.left);
    print(node.e);
    _inOrderDetail(node.right);
  }

  postOrder() {
    _postOrderDetail(root);
  }

  _postOrderDetail(_Node? node) {
    if (node == null) {
      return;
    }
    _postOrderDetail(node.left);

    _postOrderDetail(node.right);
    print(node.e);
  }

  @override
  String toString() {
    StringBuffer res = new StringBuffer();
    _generateBSTString(root!, 0, res);
    return res.toString();
  }

  _generateBSTString(_Node? node, int depth, StringBuffer res) {
    if (node == null) {
      res.write("${_generateBSTStringDepth(depth)} null \n");
      return;
    }
    res.write("${_generateBSTStringDepth(depth)} ${node.e} \n");
    _generateBSTString(node.left, depth + 1, res);
    _generateBSTString(node.right, depth + 1, res);
  }

  _generateBSTStringDepth(int depth) {
    StringBuffer res = new StringBuffer();
    for (int i = 0; i < depth; i++) {
      res.write(" - -");
    }
    return res.toString();
  }
}

class _Node<T> {
  T? e;

  _Node? left;

  _Node? right;

  _Node(T t) {
    this.e = t;
    this.left = null;
    this.right = null;
  }
}
