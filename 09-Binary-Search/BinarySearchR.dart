import 'ArrayGenerator.dart';

/**
 * 二分搜索，递归以及非递归方式
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

  static int searchR<T>(List data, T target){
    return _searchBinaryR(data,0,data.length-1,target);
  }

  static int _searchBinaryR<T>(List data,int left,int right,T target){
    if(left>right){
      return -1;
    }
    int mid = left + ((right - left) / 2).toInt();
    if(data[mid].compareTo(target) == 0)
      return mid;
    if(data[mid].compareTo(target) < 0)
      return _searchBinaryR(data, mid + 1, right, target);
    return _searchBinaryR(data, left, mid - 1, target);
  }

}

void main(){
  int n = 1000;
  List arr2 = ArrayGenerator.generateOrderedArray(n);
  print(BinarySearch.searchR(arr2, 100));
  print(BinarySearch.search(arr2, 50));
}