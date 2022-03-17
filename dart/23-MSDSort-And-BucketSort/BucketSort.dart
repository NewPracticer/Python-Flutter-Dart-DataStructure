import 'ArrayGenerator.dart';
import 'dart:math';

class BucketSort {
  BucketSort() {}

  static sort(List<int> arr, int B) {
    if (B <= 1) throw new Exception("B must be > 1");

    List temp = List.filled(arr.length, 0, growable: true);
    _sortDetail(arr, 0, arr.length - 1, B, temp);
  }

  static _sortDetail(List<int> arr, int left, int right, int B, List? temp) {
    if (left >= right) return;

    int maxv = 1 >> 32, minv = 1 << 32;
    for (int i = left; i <= right; i++) {
      maxv = [maxv, arr[i]].reduce(max);
      minv = [minv, arr[i]].reduce(min);
    }

    if (maxv == minv) {return;}

    int d =
        ((maxv - minv + 1) / B).toInt() + ((maxv - minv + 1) % B > 0 ? 1 : 0);

    List cnt = List.filled(B, 0, growable: true);
    List index = List.filled(B + 1, 0, growable: true);

    // O(n)
    for (int i = left; i <= right; i++) cnt[((arr[i] - minv) / d).toInt()]++;

    // O(R)
    for (int i = 0; i < B; i++) {
      index[i + 1] = index[i] + cnt[i];
    }
    // O(n)
    for (int i = left; i <= right; i++) {
      int p = ((arr[i] - minv) / d).toInt();
      temp![(left + index[p]).toInt()] = arr[i];
      index[p]++;
    }

    // O(n)
    for (int i = left; i <= right; i++) {
      arr[i] = temp![i];
    }

    // 递归下去：
    _sortDetail(arr, left, (left + index[0] - 1).toInt(), B, temp);
    for (int i = 0; i < B - 1; i++)
      _sortDetail(arr, (left + index[i]).toInt(),
          (left + index[i + 1] - 1).toInt(), B, temp);
  }

  static sort2(List<int> arr, int c) {
    if (c <= 0) throw new Exception("c must be > 0");

    int maxv = 1 >> 32, minv = 1 << 32;
    for (int e in arr) {
      maxv = [maxv, e].reduce(max);
      minv = [minv, e].reduce(min);
    }

    int range = maxv - minv + 1; // arr 中的数据范围
    int B = (range / c).toInt() + (range % c > 0 ? 1 : 0); // 根据数据范围决定桶的个数

    List buckets = List.filled(B, List, growable: true);
//  for(int i = 0; i < B; i ++)
//  buckets[i] = new LinkedList<>();
    for (int e in arr) {
      buckets[((e - minv) / range).toInt()].add(e);
    }
    for (int i = 0; i < B; i++) {
      buckets[i].sort();
    }
    int index = 0;
    for (int i = 0; i < B; i++) for (int e in buckets[i]) {
      arr[index++] = e;
    }
  }
}

void main() {
  int n = 1000000;
  List? arr = ArrayGenerator.generateRandomArray(n, n);
  List? arr2 = List.from(arr);

//SortingHelper.sortTest("BucketSort", arr);
//SortingHelper.sortTest("BucketSort2", arr2);
}
