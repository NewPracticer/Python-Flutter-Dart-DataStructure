import 'ArrayGenerator.dart';
import 'dart:math';

/**
 * 自底向上归并排序
 */
class MergeSort{

  static sort(List arr){
    _sortContent(arr,0,arr.length-1);
  }

  static sortBU(List arr){
    List temp = List.filled(arr.length, true);
    List.copyRange(temp,0,arr);
    int n = arr.length;
    // 遍历合并的区间长度
    for(int sz = 1; sz < n; sz += sz){
      // 遍历合并的两个区间的起始位置 i
      // 合并 [i, i + sz - 1] 和 [i + sz, Math.min(i + sz + sz - 1, n - 1)]
      for(int i = 0; i + sz < n; i += sz + sz)
        if(arr[i + sz - 1].compareTo(arr[i + sz]) > 0)
          _merge2(arr, i, i + sz - 1, [i + sz + sz - 1, n - 1].reduce(min), temp);
    }
  }

  static sort2(List arr){
    List temp = List.filled(arr.length, true);
    List.copyRange(temp,0,arr);
    _sortContent2(arr, 0, arr.length - 1, temp);
  }

  static _sortContent2(List arr,int left,int right,List temp){
    if (left >= right)
      return;

    int mid =  ((right - left) / 2).toInt() + left;
    _sortContent2(arr, left, mid, temp);
    _sortContent2(arr, mid + 1, right, temp);

    if(arr[mid].compareTo(arr[mid + 1]) > 0)
      _merge2(arr, left, mid, right, temp);
  }
  static _merge2(List arr,int left,int mid,int right,List temp){
     List.copyRange(temp, left, arr,left,right+1);
     int i = left, j = mid + 1;

     // 每轮循环为 arr[k] 赋值
     for(int k = left; k <= right; k ++){
       if(i > mid){
         arr[k] = temp[j];
         j ++;
       }
       else if(j > right){
         arr[k] = temp[i];
         i ++;
       }
       else if(temp[i].compareTo(temp[j]) <= 0){
         arr[k] = temp[i];
         i ++;
       }
       else{
         arr[k] = temp[j];
         j ++;
       }
     }
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
  int n = 100;
//  List arr = ArrayGenerator.generateRandomArray(n, n);
//  MergeSort.sort(arr);
//  print(arr);
  List arr2 = ArrayGenerator.generateRandomArray(n, n);
  print(arr2);
  MergeSort.sortBU(arr2);
  print(arr2);
}