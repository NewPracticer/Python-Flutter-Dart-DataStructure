/**
 */
void main() {
    var person = new Person("Tom",20);
    new Person.withName("John");
    new Person.withAge(20);
}

class Person{
  String? name;
  int? age;

  Person(this.name,this.age);

  Person.withName(String name){
    this.name = name;
  }

  Person.withAge(this.age);

  void work(){
    print("Work...");
  }
}
