/**
 * 常量对象
 */
void main() {
    const person = const Person("Tom",20,"Male");

    person.work();

}

class Person{
  final String name;
  final int age;

  final String gender;

  const Person(this.name,this.age,this.gender);

  void work(){
    print("Work...");
  }
}
