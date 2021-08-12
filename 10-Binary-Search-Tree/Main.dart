import 'BST.dart';
void main(){
  BST<num> bst = new BST<num>();
  var list =[5,3,6,8,4,2];
  for(var i = 0;i<list.length;i++){
    bst.add(list[i]);
  }
  //前序遍历
  bst.preOrder();
  print(bst);

  //中序遍历
  bst.inOrder();
  print(bst);

  //后序遍历
  bst.postOrder();
  print(bst);
}