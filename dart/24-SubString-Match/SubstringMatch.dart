import 'SubstringMatchHelper.dart';
import 'FileOperator.dart';

/**
 * 字符串匹配
 */
class SubstringMatch {
  //粗暴强制
  static int bruteforce(String s, String t) {
    if (s.length < t.length) return -1;
    // s[i, i + t.length - 1]
    for (int i = 0; i + t.length - 1 < s.length; i++) {
      int j = 0;
      for (; j < t.length; j++)
        if (s[i + j] != t[j]) break;
      if (j == t.length) return i;
    }
    return -1;
  }

  static int rabinKarp(String s, String t) {
    if (s.length < t.length) return -1;
    if (t.length == 0) return 0;

    int thash = 0,
        B = 256;
    double MOD = 1e9 + 7;
    for(int i = 0; i < t.length; i ++){
    thash = ((thash * B + t[i].codeUnits[0]) % MOD).toInt();
    };
    int hash = 0, P = 1;
    for(int i = 0; i < t.length - 1; i ++)
    P = (P * B % MOD).toInt();

    for(int i = 0; i < t.length - 1; i ++)
    hash = ((hash * B + s[i].codeUnits[0]) % MOD).toInt();

    for(int i = t.length- 1; i < s.length; i ++){
    hash = ((hash * B + s[i].codeUnits[0]) % MOD).toInt();
    if(hash == thash && _equal(s, i - t.length + 1, t))
    return i - t.length + 1;
    hash = ((hash - s[i - t.length + 1].codeUnits[0] * P % MOD + MOD) % MOD).toInt();
    }
    return
    -
    1;
  }

  static bool _equal(String s, int l, String t) {
    for (int i = 0; i < t.length; i ++)
      if (s[l].codeUnits[0] + i != t[i].codeUnits[0]) return false;
    return true;
  }
}

void main() async {
  String s1 = "hello, this is liuyubobobo.";
  String t1 = "bo";
  SubstringMatchHelper.matchTest("bruteforce", s1, t1);

  List s2 = await FileOperator.getFileString("text2.txt");
  String t2 = "china";
  StringBuffer res = new StringBuffer();
  for (int i = 0; i < s2.length; i++) {
    res.write(s2[i]);
  }

  SubstringMatchHelper.matchTest("bruteforce", res.toString(), t2);

  SubstringMatchHelper.matchTest("bruteforce", res.toString(), "zyx");

  /// Worst case
  int n = 1000000,
      m = 1000;

  StringBuffer s3 = new StringBuffer();
  for (int i = 0; i < n; i++)
    s3.write('a');

  StringBuffer t3 = new StringBuffer();
  for (int i = 0; i < m - 1; i++)
    t3.write('a');
  t3.write('b');

  SubstringMatchHelper.matchTest("bruteforce", s3.toString(), t3.toString());
}
