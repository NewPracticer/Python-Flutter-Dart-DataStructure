/**
 *
 *
 * @/7/9
 */
void main(){
  var map1 = {"first":"Dart",1:true,true:"2"};
  print(map1);

  print(map1["first"]);
  print(map1[true]);
  map1[1] = false;
  print(map1);

  var map2 = const {1:"Dart",2:"Java"};
//  map2[1] = "Python";

  var map3 = new Map();

  var map = {"first":"Dart","second":"Java","third":"Python"};
  print(map.length);
//  map.isEmpty;

  print(map.keys);
  print(map.values);

  print(map.containsKey("first"));
  print(map.containsValue("C"));

  map.remove("third");
  print(map);

  map.forEach(f);

  var list = ["1","2","3"];
  print(list.asMap());
}

void f(key,value){
  print("key=$key,value=$value");
}
