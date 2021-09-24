import 'ArrayGenerator.dart';

/**
 * 二分搜索
 */
class BinarySearch {
  BinarySearch() {}

  static int search<T>(List data, T target) {
    int left = 0, right = data.length - 1;

    // 在 data[l, r] 的范围中查找 target
    while (left <= right) {
      int mid = left + ((right - left) / 2).toInt();
      if (data[mid].compareTo(target) == 0) return mid;
      if (data[mid].compareTo(target) < 0)
        left = mid + 1;
      else
        right = mid - 1;
    }
    return -1;
  }

  // > target 的最小值索引
  static int upper<T>(List arr, T target) {
    int left = 0, right = arr.length;
    while (left < right) {
      int mid = left + ((right - left) / 2).toInt();
      if (arr[mid].compareTo(target) <= 0) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }

  // > target ，返回最小值索引
  // == target，返回最大索引
  static int upper_ceil<T>(List arr, T target) {
    int u = upper(arr, target);
    if (u - 1 >= 0 && arr[u - 1].compareTo(target) == 0) {
      return u - 1;
    }
    return u;
  }

  // >= target 的最小值索引
  static int lower_ceil<T>(List data, T target) {
    int left = 0, right = data.length;
    // 在 data[l, r] 中寻找解
    while (left < right) {
      int mid = left + ((right - left) / 2).toInt();
      if (data[mid].compareTo(target) < 0)
        left = mid + 1;
      else
        right = mid;
    }
    return left;
  }

  // < target 的最大值索引
  static int lower<T>(List data, T target) {
    int left = -1, right = data.length - 1;
    // 在 data[l, r] 中寻找解
    while (left < right) {
      int mid = left + ((right - left + 1) / 2).toInt();
      if (data[mid].compareTo(target) < 0)
        left = mid;
      else
        right = mid - 1;
    }
    return left;
  }

  // < target ，返回最大值索引
  // == target，返回最小索引
  static int lower_floor<T>(List data, T target) {
    int l = lower(data, target);
    if (l + 1 < data.length && data[l + 1].compareTo(target) == 0) return l + 1;
    return l;
  }

  // <= target 最大索引
  static int upper_floor<T>(List data, T target) {
    int left = -1, right = data.length - 1;
    // 在 data[l, r] 中寻找解
    while (left < right) {
      int mid = left + ((right - left + 1) / 2).toInt();
      if (data[mid].compareTo(target) <= 0)
        left= mid;
      else
        right = mid - 1;
    }
    return left;
  }
}

void main() {
//  int n = 1000;
//  List arr2 = ArrayGenerator.generateOrderedArray(n);
//  print(BinarySearch.search(arr2, 50));
  var arr = [1, 1, 3, 3, 5, 5, 7, 7];
  for (var i = 0; i <= 6; i++) {
    print(BinarySearch.lower(arr, i));
  }
}
