import 'BST.dart';
import 'AVLTree.dart';
import 'dart:math';
import 'RBTree.dart';


void main() async{


  // int n = 20000000;
  int n = 1000000;

  Random random = new Random(n);

  List testData = List.empty(growable: true);

  for(int i = 0 ; i < n ; i ++)
    testData.add(random.nextInt(1<<32));

  // Test BST
  var now = new DateTime.now();
  num startTime = now.millisecondsSinceEpoch;

  BST<num, num> bst = BST();
  for (num x in testData)
    bst.add(x, 0);

  var endNow = new DateTime.now();
  num endTime = endNow.millisecondsSinceEpoch;

  double time = (endTime - startTime) / 1000.0;
  print("BST:  $time  s");

// Test AVL
  var startNow1 = new DateTime.now();
  var startTime1 = startNow1.millisecondsSinceEpoch;

  AVLTree<num, num> avl = AVLTree();
  for (num word in testData) {
      avl.add(word, 1);
  }
  var endNow1 = new DateTime.now();
  var endTime1 = endNow1.millisecondsSinceEpoch;

  time = (endTime1 - startTime1) / 1000.0;
  print("AVL:  $time  s");

  // Test BRTree
  var startNow2 = new DateTime.now();
  var startTime2 = startNow2.millisecondsSinceEpoch;

  RBTree<num, num> rb = RBTree();
  for (num word in testData) {
      rb.add(word, 1);
  }

  var endNow2 = new DateTime.now();
  var endTime2 = endNow2.millisecondsSinceEpoch;

  double time2 = (endTime2 - startTime2) / 1000.0;
  print("RBTree:  $time2  s");


}