/**
 *
 *  继承中的构造方法
 * @/10/30
 */

void main() {
  var student = new Student("Tom","Male");

  print(student.name);
}

class Person{
  String? name;

  Person(this.name);

  Person.withName(this.name);
}

class Student extends Person{
  int? age;

  final String gender;

  Student(String name,String g) : gender = g, super.withName(name);
}
