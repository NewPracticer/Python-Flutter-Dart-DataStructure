/**
 * 1147号问题使用遍历查询
 */
class Solution {
  int longestDecomposition(String text) {
    return _solve(text, 0, text.length - 1);
  }

  int _solve(String s, int left, int right) {
    if (left > right) return 0;

    for (int i = left, j = right; i < j; i++, j--) {
      if (_equal(s, left, i, j, right)) return 2 + _solve(s, i + 1, j - 1);
    }
    return 1;
  }

  bool _equal(String s, int l1, int r1, int l2, int r2) {
    for (int i = l1, j = l2; i <= r1 && j <= r2; i++, j++)
      if (s[i] != s[j]) return false;
    return true;
  }
}
