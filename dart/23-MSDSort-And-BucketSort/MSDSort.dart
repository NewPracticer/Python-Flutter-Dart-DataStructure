class MSDSort {
  MSDSort() {}

  static sort(List? arr) {
    int N = arr!.length;
    List? temp = List.filled(N, String, growable: true);
    _sortDetail(arr, 0, N - 1, 0, temp);
  }

  static _sortDetail(List? arr, int left, int right, int r, List? temp) {
    if (left >= right) return;

    int R = 256;
    List? cnt = List.filled(R + 1, 0, growable: true);
    List? index = List.filled(R + 2, 0, growable: true);

    // O(n)
    for (int i = left; i <= right; i++) {
      cnt[r >= arr![i].length ? 0 : (arr[i][r].codeUnits[0] + 1)]++;
    }
    // O(R)
    for (int i = 0; i < R + 1; i++) {
      index[i + 1] = index[i] + cnt[i];
    }
    // O(n)
    for (int i = left; i <= right; i++) {
      temp![index[r >= arr![i].length ? 0 : (arr[i][r].codeUnits[0] + 1)] +
          left] = arr[i];
      index[r >= arr[i].length ? 0 : (arr[i][r].codeUnits[0] + 1)]++;
    }

    // O(n)
    for (int i = left; i <= right; i++) {
      arr![i] = temp![i];
    }

    for (int i = 0; i < R; i++) {
      _sortDetail(arr, (left + index[i]).toInt(),
          (left + index[i + 1] - 1).toInt(), r + 1, temp);
    }
  }
}

void main() {
  List? arr = ["BCA", "CBAA", "AC", "BADFE", "ABC", "CBA"];
  MSDSort.sort(arr);
  for (String s in arr) {
    print(s);
  }
}
