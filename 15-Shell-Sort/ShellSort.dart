import 'SortingHelper.dart';
import 'ArrayGenerator.dart';

/**
 * 希尔排序
 */
class ShellSort {
  //初始版本
  static sort(List? data) {
    int h = (data!.length / 2).toInt();
    while (h >= 1) {
      for (int start = 0; start < h; start++) {
        // 对 data[start, start + h, start + 2h, start + 3h ...], 进行插入排序
        for (int i = start + h; i < data.length; i += h) {
          var t = data[i];
          int j;
          for (j = i; j - h >= 0 && t.compareTo(data[j - h]) < 0; j -= h)
            data[j] = data[j - h];
          data[j] = t;
        }
      }
      h = (h / 2).toInt();
    }
  }

  //希尔排序优化
  static sort2(List? data) {
    int h = (data!.length / 2).toInt();
    while (h >= 1) {
      for (int i = h; i < data.length; i++) {
        var t = data[i];
        int j;
        for (j = i; j - h >= 0 && t.compareTo(data[j - h]) < 0; j -= h) {
          data[j] = data[j - h];
        }
        data[j] = t;
      }
      h = (h / 2).toInt();
    }
  }

  //希尔排序设定步长序列
  static sort3(List? data) {
    int h = 1;
    while (h < data!.length) {
      h = 3 * h + 1;
    }
    // 1, 4, 13, 40 ...
    while (h >= 1) {
      for (int i = h; i < data.length; i++) {
        var t = data[i];
        int j;
        for (j = i; j - h >= 0 && t.compareTo(data[j - h]) < 0; j -= h) {
          data[j] = data[j - h];
        }
        data[j] = t;
      }
      h = (h / 3).toInt();
    }
  }
}

void main() {
  int n = 100000;
  List arr = ArrayGenerator.generateRandomArray(n, n);

  SortingHelper.sortTest("ShellSort", arr);
}
