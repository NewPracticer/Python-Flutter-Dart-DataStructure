import 'SubstringMatch.dart';
class SubstringMatchHelper {

  SubstringMatchHelper(){}

  static void matchTest(String name, String s, String t){

    int pos = -1;

    int startTime = new DateTime.now().millisecondsSinceEpoch;
    if(name == "bruteforce"){
      pos = SubstringMatch.bruteforce(s, t);
    }
    int endTime = new DateTime.now().millisecondsSinceEpoch;

    double time = (endTime - startTime) / 1000.0;

    print(startTime);
    print(endTime);
    if(s.indexOf(t) != pos)
      throw new Exception(name + " failed");
    print("$name : res = $pos, time = $time s");
  }

}