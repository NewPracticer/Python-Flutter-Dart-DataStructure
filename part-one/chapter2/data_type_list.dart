/**
 *
 *
 * @/7/9
 */
void main(){
  var list1 = [1,2,3,"Dart",true];
  print(list1);
  print(list1[2]);
  list1[1] = "Hello";
  print(list1);

  var list2 = const [1,2,3];
//  list2[0] = 5;

  var list3 = new List.empty();

  var list = ["hello","dart"];
  print(list.length);
  list.add("New");
  print(list);

  list.insert(1, "Java");
  print(list);

  list.remove("Java");
  print(list);

//  list.clear();
//  print(list);

  print(list.indexOf("dart1"));
  list.sort();
  print(list);

  print(list.sublist(1));

  list.forEach(print);
}
