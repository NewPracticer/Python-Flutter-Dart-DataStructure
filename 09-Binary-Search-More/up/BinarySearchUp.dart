import 'ArrayGenerator.dart';

/**
 * 二分搜索
 */
class BinarySearch{

  BinarySearch(){}

  static int search<T>(List data,T target){

    int left = 0, right = data.length - 1;

    // 在 data[l, r] 的范围中查找 target
    while(left <= right){
      int mid = left + ((right - left) / 2).toInt();
      if(data[mid].compareTo(target) == 0)
        return mid;
      if(data[mid].compareTo(target) < 0)
        left = mid + 1;
      else
        right = mid - 1;
    }
    return -1;

  }
  // > target 的最小值索引
  static int upper<T>(List arr,T target){
     int left = 0,right = arr.length;
     while (left < right){
        int mid = left +((right -left)/2).toInt();
        if(arr[mid].compareTo(target)<=0){
          left = mid +1;
        }else{
          right = mid ;
        }
    }
    return left;
  }



}

void main(){
//  int n = 1000;
//  List arr2 = ArrayGenerator.generateOrderedArray(n);
//  print(BinarySearch.search(arr2, 50));
  var arr =[1,1,3,3,5,5,7,7];
  for(var i = 0;i<=6;i++){
    print(BinarySearch.upper(arr, i));
  }
}