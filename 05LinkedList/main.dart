import 'LinkedList.dart';
import 'LinkedListStatck.dart';
void main(){
  LinkedList linkedList = new LinkedList();
  for(int i = 0 ; i < 5 ; i ++){
    linkedList.addFirst(i);
    print(linkedList);
  }
  linkedList.add(2, 666);
  print(linkedList);
  linkedList.remove(2);
  print(linkedList);
  linkedList.removeFirst();
  print(linkedList);
  linkedList.removeLast();
  print(linkedList);

  LinkedListStack stack =new LinkedListStack();
  for(int i = 0 ; i < 5 ; i ++){
    stack.push(i);
    print(stack);
  }
}