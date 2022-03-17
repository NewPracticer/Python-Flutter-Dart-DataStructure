import 'dart:io';
import 'dart:convert';
import 'FileOperator.dart';
import 'BSTSet.dart';
import 'BST.dart';

void main() async{

  List result = await FileOperator.getFileString('text2.txt');
//  print(result);
  print("总数量：${result.length}");
  BSTSet<String> bstSet1 =new BSTSet();
  for (String word in result){
    bstSet1.add(word);
  }

  print("Total different words:  ${bstSet1.getSize()}");


}