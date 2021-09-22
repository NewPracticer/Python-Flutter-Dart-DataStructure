import 'dart:collection';
import 'dart:io';

/**
 * 图
 */
class Graph{
  int? _V; //图的顶点数量
  int? _E; //图的边的数量
  List? _treeSet;

  Graph(V, E, List list) {
    _V = V;
    _E = E;
    if (V < 0) throw Exception("V must be non-negative");
    if (E < 0) throw Exception("E must be non-negative");
    _treeSet = List.generate(V, (_) => SplayTreeSet<int>(), growable: false);

    for (int i = 1; i <= E; i++) {
      int a = int.parse(list[i].split(" ")[0]);
      validateVertex(a);
      int b = int.parse(list[i].split(" ")[1]);
      validateVertex(b);
      (_treeSet![a] as SplayTreeSet).add(b);
      (_treeSet![b] as SplayTreeSet).add(a);
    }
  }

  validateVertex(int v) {
    if (v < 0 || v >= _V!) throw new Exception("vertex  $v is invalid");
  }

  int? V() {
    return _V;
  }

  bool hasEdge(int v, int w) {
    validateVertex(v);
    validateVertex(w);
    return (_treeSet![v] as SplayTreeSet).contains(w);
  }

  int _degree(int v) {
    return _treeSet![v].length;
  }

  int? E() {
    return _E;
  }

  adj(int v) {
    validateVertex(v);
    return _treeSet![v];
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer();
    sb.write("V = $_V, E = $_E\n");
    for (int j = 0; j < _V!; j++) {
      sb.write("节点：$j ");
      sb.write("${_treeSet![j].toString()} ");
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
  Graph adjList= Graph(v, e, list);
  print(adjList);

}
