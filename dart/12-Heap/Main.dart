import 'MaxHeap.dart';
import 'dart:math';
void main(){

  int n = 100;

  MaxHeap<num> maxHeap = new MaxHeap.withEmpty();
  Random random = new Random();

  for(int i = 0 ; i < n ; i ++){
    maxHeap.add(random.nextInt(1<<32));
  }
  print(maxHeap);
  List arr = List.filled(n, num, growable: true);
  for(int i = 0 ; i < n ; i ++){
    arr[i] = maxHeap.extractMax();
  }
  print(arr);
  for(int i = 1 ; i < n ; i ++){
    if(arr[i-1] < arr[i]){
      throw new Exception("Error");
    }
  }

  print("Test MaxHeap completed");



}