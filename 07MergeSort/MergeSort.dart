import 'ArrayGenerator.dart';

/**
 * 归并排序
 */
class MergeSort{

  static sort(List arr){
    _sortContent(arr,0,arr.length-1);
  }

  static _sortContent (List arr,int left,int right){
    /**
     * 当数组过小时，可以使用插入排序
     */
    if(left >= right){
      return;
    }
    int mid = ((right-left)/2).toInt() +left;
    _sortContent(arr, left, mid);
    _sortContent(arr, mid+1, right);
    //提前进行判断，少一步merge
    if(arr[mid].compareTo(arr[mid+1])>0){
      _merge(arr,left,mid,right);
    }
  }

  static _merge(List arr,int l,int mid,int right){
//    List temp = List.copyRange(arr, l, r!+1);
    List temp = List.filled(right+1-l, true);
    List.copyRange(temp, 0, arr,l,right+1);
    int i = l, j = mid + 1;

    // 每轮循环为 arr[k] 赋值
    for(int k = l; k <= right; k ++){
      if(i > mid){
        arr[k] = temp[j - l]; j ++;
      }
      else if(j > right){
        arr[k] = temp[i - l]; i ++;
      }
      else if(temp[i - l].compareTo(temp[j - l]) <= 0){
        arr[k] = temp[i - l]; i ++;
      }
      else{
        arr[k] = temp[j - l]; j ++;
      }
    }
  }
}
void main(){
  int n = 20;
  List arr = ArrayGenerator.generateRandomArray(n, n);
  MergeSort.sort(arr);
  print(arr);
}