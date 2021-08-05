abstract class Queue<T>{
  int getSize();
  bool isEmpty();
  void enqueue(T e);
  T dequeue();
  T getFront();
}