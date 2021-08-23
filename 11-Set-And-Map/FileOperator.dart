import 'dart:io';
import 'dart:convert';

/**
 * 文件操作类
 */
class FileOperator{

    static Future<List> getFileString(String filename) async{
      Stream<List<int>> content = File(filename).openRead();
      List<String> lines = await content.transform(utf8.decoder).transform(LineSplitter()).toList();
      var words = [];
      for(int i = 0;i<lines.length;i++){
        words.addAll(lines[i].split(" ").toList());
      }
      words.removeWhere((element) => element == "");
      return words;
    }
}