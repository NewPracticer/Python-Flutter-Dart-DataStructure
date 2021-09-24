import 'ArrayGenerator.dart';
import 'dart:math';

/**
 * 二路快排
 */
class QuickSort2way {
  QuickSort2way() {}

  static sort2ways(List arr) {
    Random rnd = new Random();
    _sort2waysDetail(arr, 0, arr.length - 1, rnd);
  }

  static _sort2waysDetail(List arr, int l, int r, Random rnd) {
    if (l >= r) return;

    int p = _partition2ways(arr, l, r, rnd);
    _sort2waysDetail(arr, l, p - 1, rnd);
    _sort2waysDetail(arr, p + 1, r, rnd);
  }

  static int _partition2ways(List arr, int l, int r, Random rnd) {
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
  int n = 100;
  List arr2 = ArrayGenerator.generateRandomArray(n, n);
  print(arr2);
  QuickSort2way.sort2ways(arr2);
  print(arr2);
}
