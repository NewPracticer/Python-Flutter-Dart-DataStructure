/**
 * 冒泡排序，每轮选出最大的值，放到最后
 * 处理相邻的逆序对
 */
class BubblSort {
  static sort(List? data) {
    for (int i = 0; i + 1 < data!.length; i++) {
      // arr[n - i, n) 已排好序
      // 通过冒泡在 arr[n - i - 1] 位置放上合适的元素
      for (int j = 0; j < data.length - i - 1; j++) {
        if (data[j].compareTo(data[j + 1]) > 0) {
          _swap(data, j, j + 1);
        }
      }
    }
  }

  static sort2(List? data) {
    for (int i = 0; i + 1 < data!.length; i++) {
      // arr[n - i, n) 已排好序
      // 通过冒泡在 arr[n - i - 1] 位置放上合适的元素
      bool isSwapped = false;
      for (int j = 0; j < data.length - i - 1; j++) {
        if (data[j].compareTo(data[j + 1]) > 0) {
          _swap(data, j, j + 1);
          isSwapped = true;
        }
      }
      if (!isSwapped) {
        break;
      }
    }
  }

  static sort3(List? data) {
    for (int i = 0; i + 1 < data!.length;) {
      // arr[n - i, n) 已排好序
      // 通过冒泡在 arr[n - i - 1] 位置放上合适的元素
      int lastSwappedIndex = 0;
      for (int j = 0; j < data.length - i - 1; j++) {
        if (data[j].compareTo(data[j + 1]) > 0) {
          _swap(data, j, j + 1);
          lastSwappedIndex = j + 1;
        }
      }
      i = data.length - lastSwappedIndex;
    }
  }

  static _swap(List? arr, int i, int j) {
    var t = arr![i];
    arr[i] = arr[j];
    arr[j] = t;
  }
}
