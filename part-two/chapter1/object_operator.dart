/**
 */
void main() {
//  Person person = new Person();
//  person?.name;
//  var person;
//  person = "";
//  person = new Person();

//  (person as Person).work();

//  if (person is Person){
//    person.work();
//  }

  new Person()
    ..name = "Tom"
        ..age = 20
        ..work();
}

class Person{
  String? name;
  int? age;

  void work(){
    print("Work...$name,$age");
  }
}
