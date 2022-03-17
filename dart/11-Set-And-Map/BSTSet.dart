import 'Set.dart';
import 'BST.dart';

/**
 * 二分搜索树集合
 */
class BSTSet<T extends Comparable<T>> extends Set<T>{

  BST? bst;

  BSTSet(){
    bst = BST<T>();
  }

  @override
  add(T e) {
    bst!.add(e);
  }

  @override
  bool contains(e) {
    return bst!.contains(e);
  }

  @override
  int? getSize() {
    return bst!.getSize();
  }

  @override
  bool isEmpty() {
    return bst!.isEmpty();
  }

  @override
  remove(e) {
    bst!.remove(e);
  }



}