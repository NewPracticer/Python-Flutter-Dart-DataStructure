import 'ArrayGenerator.dart';
class QuickSort{
  _QuickSort(){
  }
  static sort(List arr){
    _sortDetail(arr,0,arr.length-1);
  }

  static _sortDetail(List arr,int left,int right){
    if(left >= right){
      return;
    }
    int p = _partition(arr, left, right);
    _sortDetail(arr, left, p-1);
    _sortDetail(arr, p+1, right);
  }

  static int _partition(List arr,int left,int right){
    int j =left;
    for(var i = left+1;i<=right;i++){
        if(arr[i].compareTo(arr[left])<0){
          j++;
          _swap(arr,i,j);
        }
    }
    _swap(arr, left, j);
    return j;
  }
  static _swap(List arr,int i,int j){
      var t =arr[i];
      arr[i] = arr[j];
      arr[j] = t;
  }
}
void main(){
  int n  =10;
  List arr2 = ArrayGenerator.generateRandomArray(n, n);
  print(arr2);
  QuickSort.sort(arr2);
  print(arr2);
}