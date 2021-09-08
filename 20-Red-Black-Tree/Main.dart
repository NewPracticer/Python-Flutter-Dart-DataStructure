import 'FileOperator.dart';
import 'BST.dart';
import 'AVLTree.dart';
import 'RBTree.dart';


void main() async{

  print("Pride and Prejudice");

  List words = await FileOperator.getFileString('text2.txt');

//  words.sort();

  // Test BST
  var now = new DateTime.now();
  num startTime = now.millisecondsSinceEpoch;

  BST<String, num> bst = BST();
  for (String word in words) {
    if (bst.contains(word))
      bst.set(word, bst.get(word) + 1);
    else
      bst.add(word, 1);
  }

  for(String word in words)
    bst.contains(word);

  var endNow = new DateTime.now();
  num endTime = endNow.millisecondsSinceEpoch;

  double time = (endTime - startTime) / 1000.0;
  print("BST:  $time  s");

// Test AVL
  var startNow1 = new DateTime.now();
  var startTime1 = startNow1.millisecondsSinceEpoch;

  AVLTree<String, num> avl = AVLTree();
  for (String word in words) {
    if (avl.contains(word))
      avl.set(word, avl.get(word) + 1);
    else
      avl.add(word, 1);
  }

  for(String word in words)
    avl.contains(word);

  var endNow1 = new DateTime.now();
  var endTime1 = endNow1.millisecondsSinceEpoch;

  double time3 = (endTime1 - startTime1) / 1000.0;
  print("AVL:  $time3  s");

  // Test BRTree
  var startNow2 = new DateTime.now();
  var startTime2 = startNow2.millisecondsSinceEpoch;

  RBTree<String, num> rb = RBTree();
  for (String word in words) {
    if (rb.contains(word))
      rb.set(word, rb.get(word) + 1);
    else
      rb.add(word, 1);
  }

  for(String word in words)
    avl.contains(word);
  var endNow2 = new DateTime.now();
  var endTime2 = endNow2.millisecondsSinceEpoch;

  double time2 = (endTime2 - startTime2) / 1000.0;
  print("RBTree:  $time2  s");


}