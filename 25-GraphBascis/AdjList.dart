import 'dart:collection';
import 'dart:io';

/**
 * 图的邻接表
 * 因为dart自带的LinkedList的LinkedList比较特殊，它不是一个带泛型集合，
 * 因为它泛型类型上界是LinkedListEntry,
 * 内部的数据结构实现是一个双链表，
 * 链表的结点是LinkedListEntry的子类，
 * 且内部维护了_next和_previous指针。
 * 它并没有实现List接口
 * 所以无法在链表的结点是LinkedListEntry的子类中实现List 完成图的邻接表表示方法
 * 编译器直接报错
 *
 */
class AdjList{
  int? _V;//图的顶点数量
  int? _E;//图的边的数量
  List?  _adj;//邻接矩阵
  LinkedList? _linkedList;

  AdjList( V,E,List list) {
    _V = V;
    _E = E ;
    if(V < 0) throw Exception("V must be non-negative");
    if(E < 0) throw Exception("E must be non-negative");
    _adj = List.generate(V, (_)=>List.generate(V,(_)=> 0),growable: false);
//    _linkedList = LinkedList<LinkedListEntryImpl>();

    for(int i =1;i<E;i++){
      int a =  int.parse(list[i].split(" ")[0]);
      _validateVertex(a);
      int b = int.parse(list[i].split(" ")[1]);
      _validateVertex(b);
      (_linkedList!.elementAt(a) as List)[b] =1;
      _adj![a][b] = 1;
      _adj![b][a] = 1;
//    _linkedList!.toList(growable: true);
    }
  }

  _validateVertex(int v){
    if(v < 0 || v >= _V!)
      throw new Exception("vertex  $v is invalid");
  }

  int? V(){
    return _V;
  }

  bool hasEdge(int v, int w){
    _validateVertex(v);
    _validateVertex(w);
    return _adj![v][w] == 1;
  }

  int _degree(int v){
    return _adj![v].length;
  }

  int? E(){
    return _E;
  }

  List<int> adj(int v){
    _validateVertex(v);
    List<int> res = List.filled(_V!, 0,growable: true);
    for(int i = 0; i < _V!; i ++)
      if(_adj![v][i] == 1)
        res.add(i);
    return res;
  }

  @override
  String toString() {

    StringBuffer sb = new StringBuffer();
    sb.write("V = $_V, E = $_E\n");
    for (int i = 0; i < _V!; i ++) {
      for (int j = 0; j < _V!; j ++)
        sb.write("${_adj![i][j]} ");
      sb.write('\n');
    }
    return sb.toString();
  }
}

void main() async {
  File content = File("g.txt");
  List<String> list = await content.readAsLines();
  //读取到文件的顶点数量以及
  print(list[0].split(" ")[0]);
  print(list[0].split(" ")[1]);
  int v = int.parse(list[0].split(" ")[0]) ;
  int e = int.parse(list[0].split(" ")[1]) ;
//
  AdjList adjList= AdjList(v, e, list);
  print(adjList);

}
//class LinkedListEntryImpl<List> extends LinkedListEntry<LinkedListEntryImpl<List>> {
//   List? value;
//
//  LinkedListEntryImpl(int length){
//    value= List.filled(length,0, growable:false);
//  }
//
//  @override
//  String toString() {
//    return "value is $value";
//  }
//}