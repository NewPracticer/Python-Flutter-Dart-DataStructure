import 'ShellSort.dart';
import 'BucketSort.dart';
class SortingHelper {
  SortingHelper() {}

  static bool isSorted(List? arr) {
    for (int i = 1; i < arr!.length; i++)
      if (arr[i - 1].compareTo(arr[i]) > 0) return false;
    return true;
  }

  static sortTest(String sortname, List arr) {
    var now = new DateTime.now();
    num startTime = now.millisecondsSinceEpoch;

    if (sortname == "SelectionSort") {
      //  SelectionSort.sort(arr);
    } else if (sortname == "InsertionSort") {
//  InsertionSort.sort(arr);
    } else if (sortname == "MergeSort") {
//  MergeSort.sort(arr);
    } else if (sortname == "MergeSortBU") {
//  MergeSort.sortBU(arr);
    } else if (sortname == "QuickSort") {
//  QuickSort.sort(arr);
    } else if (sortname == "QuickSort2Ways") {
//  QuickSort.sort2ways(arr);
    } else if (sortname == "QuickSort3Ways") {
//  QuickSort.sort3ways(arr);
    } else if (sortname == "QuickSort3Ways") {
//  QuickSort.sort3ways(arr);
    } else if (sortname == "HeapSort") {
//  HeapSort.sort(arr);
    } else if (sortname == "BubbleSort") {
//    BubbleSort.sort(arr);
    } else if (sortname == "ShellSort") {
      ShellSort.sort(arr);
    }else if(sortname == "BucketSort"){
//      BucketSort.sort(arr, 200);
  }
    var endNow = new DateTime.now();
    num endTime = endNow.millisecondsSinceEpoch;
    print("开始时间：$startTime : 结束时间:$endTime");
    double time = (endTime - startTime) / 1000.0;
    if (!SortingHelper.isSorted(arr)) throw new Exception(sortname + " failed");
    print("$sortname , n = ${arr.length}: $time s");
  }
}
