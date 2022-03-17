import 'dart:collection';
class Solution {
  List<String> findRepeatedDnaSequences(String s) {

    HashSet<String> seen = HashSet<String>();
    HashSet<String> res = HashSet<String>();
    for(int i = 0; i + 10 <= s.length; i ++){
      String key = s.substring(i, i + 10);
      if(seen.contains(key))
        res.add(key);
      else
        seen.add(key);
    }
    return res.toList();
  }
}