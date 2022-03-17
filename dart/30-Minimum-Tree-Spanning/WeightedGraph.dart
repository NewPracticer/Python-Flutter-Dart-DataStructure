import 'dart:collection';
import 'dart:io';

/**
 * 无向有权图
 */
class WeightedGraph {
  int? _V;

  int? _E;

  List? _adj;

  WeightedGraph(V, E, List list) {
    this._V = V;
    this._E = E;

    _adj = List.generate(_V!, (_) => SplayTreeMap<int, int>(), growable: false);

    for (int i = 1; i <= E; i++) {
      int a = int.parse(list[i].split(" ")[0]);
      validateVertex(a);
      int b = int.parse(list[i].split(" ")[1]);
      validateVertex(b);
      int weight = int.parse(list[i].split(" ")[2]);

      if (a == b) throw new Exception("Self Loop is Detected!");
      if (_adj![a].containsKey(b)) {
        throw new Exception("Parallel Edges are Detected!");
      }
      _adj![a].putIfAbsent(b, () => weight);
      _adj![b].putIfAbsent(a, () => weight);
    }
  }

  validateVertex(int v) {
    if (v < 0 || v >= (_V as int)) throw new Exception("vertex $v is invalid");
  }

  int? V() {
    return _V;
  }

  int? E() {
    return _E;
  }

  bool hasEdge(int v, int w) {
    validateVertex(v);
    validateVertex(w);
    return _adj![v].containsKey(w);
  }

  adj(int v) {
    validateVertex(v);
    return (_adj![v] as SplayTreeMap).keys;
  }

  int getWeight(int v, int w) {
    if (hasEdge(v, w)) return _adj![v][w];
    throw new Exception("No edge $v-$w");
  }

  int degree(int v) {
    validateVertex(v);
    return _adj![v].size();
  }

  removeEdge(int v, int w) {
    validateVertex(v);
    validateVertex(w);
    if (_adj![v].containsKey(w)) {
      _E = _E! - 1;
    }
    ;
    _adj![v].remove(w);
    _adj![w].remove(v);
  }
  @override
  String toString(){
    StringBuffer sb = new StringBuffer();

    sb.write("V = $_V, E = $E\n");
    for(int v = 0; v < (_V as int); v ++){
      sb.write("$v : ");
      (_adj![v] as SplayTreeMap).entries.forEach((element) { sb.write("( ${element.key}:${element.value} )");});
      sb.write('\n');
    }
    return sb.toString();
  }
}

void main() async {
  File content = File("g.txt");
  List<String> list = await content.readAsLines();
  //读取到文件的顶点数量以及
  int v = int.parse(list[0].split(" ")[0]);
  int e = int.parse(list[0].split(" ")[1]);
  WeightedGraph g = new WeightedGraph(v, e, list);
  print(g);
}
