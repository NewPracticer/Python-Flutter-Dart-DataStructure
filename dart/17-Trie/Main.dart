import 'dart:io';
import 'dart:convert';

import 'Trie.dart';
import 'FileOperator.dart';
void main() async{

  List result = await FileOperator.getFileString('text2.txt');
//  print(result);
  print("总数量：${result.length}");
  var now = new DateTime.now();
  num startTime = now.millisecondsSinceEpoch;

  Trie trie = new Trie();
  for(String word in result)
    trie.add(word);

  for(String word in result)
    trie.contains(word);

  var endNow = new DateTime.now();
  num endTime = endNow.millisecondsSinceEpoch;
  print("开始时间：$startTime : 结束时间:$endTime");
  double time = (endTime - startTime) / 1000.0;

  print("Total different words: ${trie.getSize()}");
  print("Trie: $time   s");

}