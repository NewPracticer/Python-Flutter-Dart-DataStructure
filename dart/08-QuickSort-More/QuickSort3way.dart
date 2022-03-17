import 'ArrayGenerator.dart';
import 'dart:math';
/**
 * 三路快排
 */
class QuickSort3way {
  QuickSort3way() {}

  static sort3ways(List arr) {
    Random rnd = new Random();
    _sort3waysDetail(arr, 0, arr.length - 1, rnd);
  }

  static _sort3waysDetail(List arr, int left, int right, Random rnd) {
    if (left >= right) return;
    // 生成 [l, r] 之间的随机索引
    int p = left + rnd.nextInt(right - left + 1);
    _swap(arr, left, p);
    // arr[l + 1, lt] < v, arr[lt + 1, i - 1] == v, arr[gt, r] > v
    int lt = left, i = left + 1, gt = right + 1;
    while(i < gt){
      if(arr[i].compareTo(arr[left]) < 0){
        lt ++;
        _swap(arr, i, lt);
        i ++;
      }
      else if(arr[i].compareTo(arr[left]) > 0){
        gt --;
        _swap(arr, i, gt);
      }
      else{ // arr[i] == v
        i ++;
      }
    }
    _swap(arr, left, lt);
    // 递归调用
    _sort3waysDetail(arr, left, lt - 1, rnd);
    _sort3waysDetail(arr, gt, right, rnd);
  }

  static int _partition3ways(List arr, int l, int r, Random rnd) {
    int p = l + rnd.nextInt(r - l + 1);
    _swap(arr, l, p);
    // arr[l+1...i-1] <= v; arr[j+1...r] >= v
    int i = l + 1, j = r;
    while (true) {
      while (i <= j && arr[i].compareTo(arr[l]) < 0){
        i++;
      }
      while (j >= i && arr[j].compareTo(arr[l]) > 0){
        j--;
      }
      if (i >= j){
        break;
      }
      _swap(arr, i, j);
      i++;
      j--;
    }
    _swap(arr, l, j);
    return j;
  }

  static _swap(List arr, int i, int j) {
    var t = arr[i];
    arr[i] = arr[j];
    arr[j] = t;
  }
}

void main() {
  int n = 1000;
  List arr2 = ArrayGenerator.generateRandomArray(n, n);
  print(arr2);
  QuickSort3way.sort3ways(arr2);
  print(arr2);
}
