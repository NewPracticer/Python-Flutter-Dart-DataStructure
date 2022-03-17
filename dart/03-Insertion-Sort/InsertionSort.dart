/**
 * 插入排序
 * 1、Dart自带插入排序算法
 * 2、手动实现插入排序算法
 * 3、 源码部分
 *  dart数组天然支持泛型，
 *  compare 是实现比对接口
 */
void main() {
  var list = [2, 4, 6, 3, 1, 5];
  var list2 = ["2","4","6","3","1","5"];
  var list3 = [2, 4, 6, 3, 1, 5];
  sort(list);
  insertionSort(list2);
  insertionSort2(list3);
}

//Dart语言原生方法
void sort(List arr) {
  print("Dart自带排序算法----------------------");
  arr.sort();
  arr.forEach((element) {
    print(element);
  });

}

void insertionSort(List arr) {
  print("手动实现插入排序算法----------------------");
  for (int i = 0; i < arr.length; i++) {
    for (int j = i; j - 1 >= 0; j--) {
      if (Comparable.compare(arr[j] ,arr[j - 1]) < 0) {
        swap(arr, j - 1, j);
      }else{
        break;
      }
    }
  }
  arr.forEach((element) {
    print(element);
  });

}
/**
 * 插入排序优化
 */
void insertionSort2(List arr) {
  print("手动实现优化插入排序算法----------------------");
  for (int i = 0; i < arr.length; i++) {
    var t = arr[i];
    int j ;
    for (j = i; j - 1 >= 0 &&(t.compareTo(arr[j - 1])<0); j--) {
       arr[j] = arr[j-1];
    }
    arr[j] = t;
  }
  arr.forEach((element) {
    print(element);
  });

}

void swap(arr, int i, int j) {
  var t = arr[i];
  arr[i] = arr[j];
  arr[j] = t;
}

//  Dart 源码使用的是阀值，32
//  当在32以内使用插入排序，当在32以外使用双向快排
//  static const int _INSERTION_SORT_THRESHOLD = 32;
//  /**
//   * Sorts all elements of the given list [:a:] according to the given
//   * [:compare:] function.
//   *
//   * The [:compare:] function takes two arguments [:x:] and [:y:] and returns
//   *  -1 if [:x < y:],
//   *   0 if [:x == y:], and
//   *   1 if [:x > y:].
//   *
//   * The function's behavior must be consistent. It must not return different
//   * results for the same values.
//   */
//  static void sort<E>(List<E> a, int compare(E a, E b)) {
//    _doSort(a, 0, a.length - 1, compare);
//  }
//
//  /**
//   * Sorts all elements in the range [:from:] (inclusive) to [:to:] (exclusive)
//   * of the given list [:a:].
//   *
//   * If the given range is invalid an "OutOfRange" error is raised.
//   *
//   * See [:sort:] for requirements of the [:compare:] function.
//   */
//  static void sortRange<E>(List<E> a, int from, int to, int compare(E a, E b)) {
//    if ((from < 0) || (to > a.length) || (to < from)) {
//      throw "OutOfRange";
//    }
//    _doSort(a, from, to - 1, compare);
//  }
//
//  /**
//   * Sorts the list in the interval [:left:] to [:right:] (both inclusive).
//   */
//  static void _doSort<E>(
//      List<E> a, int left, int right, int compare(E a, E b)) {
//    if ((right - left) <= _INSERTION_SORT_THRESHOLD) {
//      _insertionSort(a, left, right, compare);
//    } else {
//      _dualPivotQuicksort(a, left, right, compare);
//    }
//  }
//
//


