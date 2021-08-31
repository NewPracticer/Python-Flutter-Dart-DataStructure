import 'SortingHelper.dart';
import 'ArrayGenerator.dart';
/**
 * 希尔排序
 */
class ShellSort {
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
}

void main(){
  int n = 100000;
  List arr = ArrayGenerator.generateRandomArray(n, n);

  SortingHelper.sortTest("ShellSort", arr);
}


