/**
 * 1147号问题使用hash值解决
 */
class Solution2 {
  double MOD = 1e9 + 7;

  List<double>? pow26;

  int longestDecomposition(String text) {
    pow26 = List.filled(text.length, 0, growable: true);
    pow26![0] = 1;
    for (int i = 1; i < pow26!.length; i++)
      pow26![i] = pow26![i - 1] * 26 % MOD;

    return _solve(text, 0, text.length - 1);
  }

  int _solve(String s, int left, int right) {
    if (left > right) return 0;

    int prehash = 0, posthash = 0;
    for (int i = left, j = right; i < j; i++, j--) {
      prehash = ((prehash * 26 + (s[i].codeUnits[0] - 'a'.codeUnits[0])) % MOD)
          .toInt();
      posthash = (((s[j].codeUnits[0] - 'a'.codeUnits[0]) * pow26![right - j] +
                  posthash) %
              MOD)
          .toInt();

      if (prehash == posthash && _equal(s, left, i, j, right))
        return 2 + _solve(s, i + 1, j - 1);
    }
    return 1;
  }

  bool _equal(String s, int l1, int r1, int l2, int r2) {
    for (int i = l1, j = l2; i <= r1 && j <= r2; i++, j++)
      if (s[i] != s[j]) return false;
    return true;
  }
}
