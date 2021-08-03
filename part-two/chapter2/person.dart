/**
 *
 *
 * @/10/30
 */

class Person {
  String? name;
  int? age;
  String? _birthday;

  bool get isAdult => age! > 18;

  void run(){
    print("Person run...");
  }

  @override
  String toString() {
    return "Name is $name,Age is $age";
  }
}
