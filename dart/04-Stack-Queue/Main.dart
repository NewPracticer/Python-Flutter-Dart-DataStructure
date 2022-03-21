import 'ArrayStack.dart';
import 'ArrayQueue.dart';
import 'LoopQueue.dart';

void main() {
//  ArrayStack<int> stack = new ArrayStack<int>();
//  for(int i = 0 ; i < 10 ; i ++){
//    stack.push(i);
//    print(stack.toString());
//  }
//  stack.pop();
//
//  ArrayQueue queue = new ArrayQueue();
//  for(int i = 0 ; i < 20 ; i ++){
//    queue.enqueue(i);
//    print(queue);
//    if(i % 3 == 2){
//      print('----出栈头部元素-----');
//      queue.dequeue();
//      print(queue);
//    }
//  }

  LoopQueue<int> loopQueue = new LoopQueue<int>();

  for (int i = 0; i < 30; i++) {
    loopQueue.enqueue(i);
    print(loopQueue);

    if (i % 3 == 2) {
      loopQueue.dequeue();
      print(loopQueue);
    }
  }
}
