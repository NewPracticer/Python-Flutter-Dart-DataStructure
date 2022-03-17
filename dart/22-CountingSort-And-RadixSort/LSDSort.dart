class LSDSort {
  LSDSort() {}

  static sort(List? arr, int W) {
    for (String s in arr!)
      if (s.length != W) {
        throw new Exception("All Strings' length must be the same.");
      }
    int R = 256;

    List temp = List.filled(arr.length, String, growable: true);
    List index = List.filled(R + 1, 0, growable: true);
    for (int r = W - 1; r >= 0; r--) {
      // O(n)
      List cnt = List.filled(R, 0, growable: true);
      for (String s in arr) {
        cnt[s[r].codeUnits[0]]++;
      }
      // O(R)
      for (int i = 0; i < R; i++) {
        index[i + 1] = index[i] + cnt[i];
      }
      // O(n)
      for (String s in arr) {
        temp[index[s[r].codeUnits[0]]] = s;
        index[s[r].codeUnits[0]]++;
      }
      // O(n)
      for (int i = 0; i < arr.length; i++) arr[i] = temp[i];
    }
  }


}

void main() {
  List arr = ["BCA", "CAB", "ACB", "BAC", "ABC", "CBA"];
  LSDSort.sort(arr, 3);
  for (String s in arr) {
    print(s);
  }
}


