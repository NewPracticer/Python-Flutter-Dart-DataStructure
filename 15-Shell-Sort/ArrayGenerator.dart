import 'dart:math';

class ArrayGenerator{

  static List generateOrderedArray(int n){
     List arr =  List.filled(n, true);
     for(int i = 0;i<n;i++){
       arr[i] =i;
     }
     return arr;
  }

  static List generateRandomArray(int n,int bound){
    List arr = List.filled(n, true);
    Random random = new Random();
    for(int i = 0; i < n; i ++){
      arr[i] = random.nextInt(bound);
    }
    return arr;
  }
}