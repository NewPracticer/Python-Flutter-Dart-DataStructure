import 'Student.dart';
import 'dart:math';

void main() {
  print("abcdefghijklmnopqrstuvwxyz".codeUnits);
  print("abcdefghijklmnopqrstuvwxyz".runes);
  print(String.fromCharCode("abcdefghijklmnopqrstuvwxyz".codeUnits[0]));
  print(String.fromCharCode("abcdefghijklmnopqrstuvwxyz".codeUnits[0]));
  Iterable<int>? string = [
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122
  ];
  print(String.fromCharCodes(string, 0, 26));

  int n = 26 * 26 * 26 * 26;

  List students = List.filled(n, Student, growable: true);
  int k = 0;
  Random rnd = new Random();
  for (var c1 = 'a'.codeUnits[0]; c1 <= 'z'.codeUnits[0]; c1++)
    for (var c2 = 'a'.codeUnits[0]; c2 <= 'z'.codeUnits[0]; c2++)
      for (var c3 = 'a'.codeUnits[0]; c3 <= 'z'.codeUnits[0]; c3++)
        for (var c4 = 'a'.codeUnits[0]; c4 <= 'z'.codeUnits[0]; c4++) {
          students[k] = new Student(
              "${String.fromCharCode(c1)} + ${String.fromCharCode(c2)} + ${String.fromCharCode(c3)} + ${String.fromCharCode(c4)}",
              rnd.nextInt(101));
          k++;
        }

  // 计数排序过程
  int R = 101;

  // O(n)
  List cnt = List.filled(R, 0, growable: true);
  for (Student student in students) {
    cnt[student.getScore()!] = cnt[student.getScore()!] +1;
  };

  // O(R)
  List index = List.filled(R + 1, 0, growable: true);
  for (int i = 0; i < R; i++) index[i + 1] = index[i] + cnt[i];

  // O(n)
  List temp = List.filled(n, Student, growable: true);
  for (Student student in students) {
    temp[index[student.getScore()!]] = student;
    index[student.getScore()!]++;
  }

  // O(n)
  for (int i = 0; i < n; i++) students[i] = temp[i];

  // O(n + R)

  // 验证计数排序算法
  for (int i = 1; i < n; i++) {
    if (students[i - 1].getScore() > students[i].getScore())
      throw new Exception("Sort failed");

    if (students[i - 1].getScore() == students[i].getScore()) {
      if (students[i - 1].getName().compareTo(students[i].getName()) >= 0)
        throw new Exception("Non-Stable counting sort!");
    }
  }
}
