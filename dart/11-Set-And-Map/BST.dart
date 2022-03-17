import 'LinkedListStatck.dart';
import 'LinkedListQueue.dart';
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

  // 二分搜索树的非递归前序遍历
  preOrderNR() {
    if (root == null) return;
    LinkedListStack stack = new LinkedListStack();
    stack.push(root);
    while (!stack.isEmpty()) {
      _Node cur = stack.pop();
      print(cur.e);
      if (cur.right != null) {
        stack.push(cur.right);
      }
      if (cur.left != null){
        stack.push(cur.left);
      }
    }
  }

  // 二分搜索树的层序遍历
  levelOrder(){
    if(root == null)
      return;
    LinkedListQueue q= new LinkedListQueue();
    q.enqueue(root);
    while(!q.isEmpty()){
      _Node cur = q.dequeue();
      print(cur.e);
      if(cur.left != null){
        q.enqueue(cur.left);
      }
      if(cur.right != null){
        q.enqueue(cur.right);
      }
    }
  }

  // 寻找二分搜索树的最小元素
  searchMinimum<T>(){
    if(size == 0){
      throw new Exception("BST is empty!");
    }
    return _minimum(root!).e;
  }
  // 返回以node为根的二分搜索树的最小值所在的节点
  _Node _minimum(_Node node){
    if(node.left == null){
      return node;
    }
    return _minimum(node.left!);
  }

  // 寻找二分搜索树的最大元素
  searchMaximum<T>(){
    if(size == 0){
      throw new Exception("BST is empty");
    }
    return _maximum(root!).e;
  }
  // 返回以node为根的二分搜索树的最大值所在的节点
  _Node _maximum(_Node node){
    if(node.right == null){
      return node;
    }
    return _maximum(node.right!);
  }

  // 从二分搜索树中删除最小值所在节点, 返回最小值
  removeMin<T>(){
    T ret = searchMinimum();
    root = _removeMinDetail(root!);
    return ret;
  }
  // 删除掉以node为根的二分搜索树中的最小节点
  // 返回删除节点后新的二分搜索树的根
  _Node _removeMinDetail(_Node node){
    if(node.left == null){
      _Node rightNode = node.right!;
      node.right = null;
      size = size! - 1;
      return rightNode;
    }
    node.left = _removeMinDetail(node.left!);
    return node;
  }


  // 从二分搜索树中删除最大值所在节点
  removeMax<T>(){
    T ret = searchMaximum();
    root = _removeMaxDetail(root!);
    return ret;
  }
  // 删除掉以node为根的二分搜索树中的最大节点
  // 返回删除节点后新的二分搜索树的根
  _Node _removeMaxDetail(_Node node){
    if(node.right == null){
      _Node leftNode = node.left!;
      node.left = null;
      size = size! -1 ;
      return leftNode;
    }
    node.right = _removeMaxDetail(node.right!);
    return node;
  }

  // 从二分搜索树中删除元素为e的节点
  remove(T e){
    root = _removeNode(root!, e);
  }

  _removeNode(_Node node, T? e){
    if( node == null )
      return null;

    if( e!.compareTo(node.e!) < 0 ){
      node.left = _removeNode(node.left! , e);
      return node;
    }
    else if(e.compareTo(node.e) > 0 ){
      node.right = _removeNode(node.right!, e);
      return node;
    }
    else{   // e.compareTo(node.e) == 0
      // 待删除节点左子树为空的情况
      if(node.left == null){
        _Node rightNode = node.right!;
        node.right = null;
        size = size! - 1 ;
        return rightNode;
      }
      // 待删除节点右子树为空的情况
      if(node.right == null){
        _Node leftNode = node.left!;
        node.left = null;
        size = size! -1;
        return leftNode;
      }
      // 待删除节点左右子树均不为空的情况
      // 找到比待删除节点大的最小节点, 即待删除节点右子树的最小节点
      // 用这个节点顶替待删除节点的位置
      _Node successor = _minimum(node.right!);
      successor.right = _removeMinDetail(node.right!);
      successor.left = node.left;
      node.left = node.right = null;
      return successor;
    }
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
