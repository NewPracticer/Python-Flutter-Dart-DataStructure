import 'dart:math';

class ArrayGenerator{

  static List generateOrderedArray(int n){
     List arr = <dynamic>[n];
     for(int i = 0;i<n;i++){
       arr[i] =i;
     }
     return arr;
  }

  static List generateRandomArray(int n,int bound){
    List arr = <dynamic>[n];
    Random random = new Random();
    for(int i = 0; i < n; i ++)
      arr[i] = random.nextInt(bound);
    return arr;
  }
}