/**
 *
 *
 * @/7/14
 */
void main(){
  int gender = 1;
  String str = gender == 0 ? "Male=$gender" :"Female=$gender";
  print(str);

  String a = "Dart";
  String b = "Java";
  String c = a ?? b;
  print(c);


}
