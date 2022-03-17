class Solution {

  String longestPrefix(String s) {

    // s[0...len - 1], s[s.length - len...s.length - 1]
    for(int len = s.length - 1; len >= 1; len --)
      if(_equal(s, 0, len - 1, s.length - len, s.length - 1))
        return s.substring(0, len);
    return "";
  }

  bool _equal(String s, int l1, int r1, int l2, int r2){

    for(int i = l1, j = l2; i <= r1 && j <= r2; i ++, j ++)
      if(s[i] != s[j]) return false;
    return true;
  }


}

void main() {

print((new Solution()).longestPrefix("level"));
}
