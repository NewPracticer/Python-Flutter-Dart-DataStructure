import 'person.dart';
/**
 *
 *  继承
 * @/10/30
 */
void main() {
//  var student = new Student();
//  student.study();
//
//  student.name = "Tom";
//  student.age = 16;
//
//  print(student.isAdult);
//
//  student.run();

  Person person = new Student();
  person.name = "Tom";
  person.age = 18;

  if(person is Student){
    person.study();
  }

  print(person);
}

class Student extends Person{

  void study(){
    print("Student study...");
  }

  @override
  bool get isAdult => age! > 15;


  @override
  void run() {
    print("Student run...");
  }

}
