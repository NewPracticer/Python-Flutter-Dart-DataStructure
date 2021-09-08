import 'dart:collection';

/**
 * dart中无类型提升
 * dart中不能让字符串与数字相加，比如将数字转为字符串才能相加，其实就是字符串链接
 */
class Solution {
  firstUniqChar(String s) {

    List freq = List.empty(growable: true);
    for(int i = 0 ; i < s.length ; i ++) {
      freq[int.parse(s[i]) - int.parse('a')] ++;
    }
    for(int i = 0 ; i < s.length ; i ++) {
      if (freq[int.parse(s[i]) - int.parse('a')] == 1) {
        return i;
      }
    }

    return -1;
  }
}