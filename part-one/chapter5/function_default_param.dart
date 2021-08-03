/**
 *
 *
 * @/7/15
 */
void main(){

  printPerson("李四");
  printPerson("李四",age: 20);
  printPerson("李四",gender: "Male");
}

printPerson(String name,{int age = 30,String gender = "Female"}){
  print("name=$name,age=$age,gender=$gender");
}

