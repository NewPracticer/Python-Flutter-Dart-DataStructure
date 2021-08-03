/**
 *
 *
 * @/7/15
 */
void main(){
  String language = "Java";

  switch(language){
    case "Dart":
      print("Dart is my favorite");
      break;
    case "Java":
      print("Java is my favorite");
      break;
    case "Python":
      print("Python is my favorite");
      break;
    default:
      print("None");
  }

  switch(language){
    Test:
    case "Dart":
      print("Dart is my favorite");
      break;
    case "Java":
      print("Java is my favorite");
      continue Test;
//      break;
    case "Python":
      print("Python is my favorite");
      break;
    default:
      print("None");
  }
}
