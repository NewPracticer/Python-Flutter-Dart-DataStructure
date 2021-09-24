import 'dart:collection';
import 'FileOperator.dart';
import 'HashTableSec.dart';

void main() async{
  int a = 42;
  print(a.hashCode);
  int b = -42;
  print(b.hashCode);
  double c = 3.1415926;
  print(c.hashCode);
  String d = "abcd";
  print(d.hashCode);

  HashSet set = HashSet();

  HashMap map = HashMap();


  List words = await FileOperator.getFileString('text2.txt');

//  words.sort();

  // Test HashTable
  var now = new DateTime.now();
  num startTime = now.millisecondsSinceEpoch;

//  HashTable<String, num> hashtable = HashTable(131071);
  HashTableSec<String, num> hashtable = HashTableSec(131071);
  for (String word in words) {
    if (hashtable.contains(word))
      hashtable.set(word, hashtable.get(word)! + 1);
    else
      hashtable.add(word, 1);
  }

  for(String word in words) {
    hashtable.contains(word);
  }
  var endNow = new DateTime.now();
  num endTime = endNow.millisecondsSinceEpoch;

  double time = (endTime - startTime) / 1000.0;
  print("HashTable:  $time  s");

}