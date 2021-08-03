/**
 *
 *  泛型
 * @/10/31
 */
void main() {
  var list = <int>[];
  list.add(1);


  var utils = new Utils();
  utils.put<int>(1);
}

class Utils{

   void put<T>(T element){
    print(element);
  }

//  void putString(String element){
//    this.elementStr = element;
//  }
}
