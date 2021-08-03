/**
 *
 *
 */
void main(){

  printPerson("李四");
  printPerson("李四",age: 20);
  printPerson("李四",age: 20,gender: "Male");
  printPerson("李四",gender: "Male");

  printPerson2("张三");
  printPerson2("张三",18);
  printPerson2("张三",18,"Female");
}

printPerson(String name,{int? age,String? gender}){
  print("name=$name,age=$age,gender=$gender");
}

printPerson2(String name,[int? age,String? gender]){
  print("name=$name,age=$age,gender=$gender");
}
