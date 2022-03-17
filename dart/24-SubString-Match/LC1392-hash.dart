class Solution2 {
  double MOD = 1e9 + 7;

  String longestPrefix(String s) {
    List<int> pow26 = List.filled(s.length, 0, growable: true);
    pow26[0] = 1;
    for (int i = 1; i < pow26.length; i++)
      pow26[i] = (pow26[i - 1] * 26 % MOD).toInt();

    // prehash[i]: hash(s[0...i])
    List<int> prehash = List.filled(s.length, 0, growable: true);
    prehash[0] = s[0].codeUnits[0] - 'a'.codeUnits[0];
    for (int i = 1; i < s.length; i++)
      prehash[i] =
          ((prehash[i - 1] * 26 + s[i].codeUnits[0] - 'a'.codeUnits[0]) % MOD)
              .toInt();

    // posthash[i]: hash(s[i...s.length - 1])
    List<int> posthash = List.filled(s.length, 0, growable: true);
    posthash[s.length - 1] = s[s.length - 1].codeUnits[0] - 'a'.codeUnits[0];
    for (int i = s.length - 2; i >= 0; i--)
      posthash[i] =
          ((pow26[s.length - i - 1] * (s[i].codeUnits[0] - 'a'.codeUnits[0]) +
                      posthash[i + 1]) %
                  MOD)
              .toInt();

    // s[0...len - 1], s[s.length - len...s.length - 1]
    for (int len = s.length - 1; len >= 1; len--) {
      if (prehash[len - 1] == posthash[s.length - len] &&
          _equal(s, 0, len - 1, s.length - len, s.length - 1))
        return s.substring(0, len);
    }
    return "";
  }

  bool _equal(String s, int l1, int r1, int l2, int r2) {
    for (int i = l1, j = l2; i <= r1 && j <= r2; i++, j++)
      if (s[i] != s[j]) return false;
    return true;
  }
}
