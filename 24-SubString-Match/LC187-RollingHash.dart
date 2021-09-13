import 'dart:collection';
class Solution2 {
  List<String> findRepeatedDnaSequences(String s) {

    if(s.length < 10) {
      return List.empty(growable: true);
    };

    List<int> map = List.filled(256,0, growable: true);
    map['A'.codeUnits[0]] = 1;
    map['C'.codeUnits[0]] = 2;
    map['G'.codeUnits[0]] = 3;
    map['T'.codeUnits[0]] = 4;

    HashSet<int> seen = new HashSet<int>();
    HashSet<String> res = new HashSet<String>();

    int hash = 0;
        double ten9 = 1e9;

    for(int i = 0; i < 9; i ++)
      hash = hash * 10 + map[s[i].codeUnits[0]];

    for(int i = 9; i < s.length; i ++){

      hash = hash * 10 + map[s[i].codeUnits[0]];

      if(seen.contains(hash)) res.add(s.substring(i - 9, i + 1));
      else seen.add(hash);

      hash -= (map[s[i - 9].codeUnits[0]] * ten9).toInt();
    }
    return res.toList();
  }
}