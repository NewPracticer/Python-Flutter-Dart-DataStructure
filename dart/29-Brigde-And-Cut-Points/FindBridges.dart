import 'Graph.dart';
import 'Edge.dart';
import 'dart:io';
import 'dart:math';

/**
 * 查找桥
 */
class FindBridges {
  Graph? _G;

  List? _visited;

  List? _ord;

  List? _low;

  int cnt = 0;

  List? res;

  FindBridges(Graph G) {
    this._G = G;
    _visited = List.filled(G.V()!, false, growable: true);

    res = List.filled(0, Edge, growable: true);
    _ord = List.filled(G.V()!, 0, growable: true);
    _low = List.filled(G.V()!, 0, growable: true);
    cnt = 0;

    for (int v = 0; v < _G!.V()!; v++) {
      if (!_visited![v]) {
        _dfs(v, v);
      }
    }
  }

  _dfs(int v, int parent) {
    _visited![v] = true;
    _ord![v] = cnt;
    _low![v] = _ord![v];
    cnt++;
//    print("循环：${_G!.adj(v)}");
    for (int w in _G!.adj(v))
      if (!_visited![w]) {
        _dfs(w, v);
        _low![v] = [(_low![v] as int), (_low![w] as int)].reduce(min);
//        print(" 最小值：${_low![v]}");
        if (_low![w] > _ord![v]) {
          res!.add(Edge(v, w));
        }
      } else if (w != parent) {
        _low![v] = [(_low![v] as int), (_low![w] as int)].reduce(min);
      }
  }

  result() {
    return res;
  }
}

void main() async {
  File content = File("g.txt");
  List<String> list = await content.readAsLines();
  //读取到文件的顶点数量以及
  int v = int.parse(list[0].split(" ")[0]);
  int e = int.parse(list[0].split(" ")[1]);
  Graph graph = Graph(v, e, list);

  FindBridges fb = new FindBridges(graph);
  print("Bridges in g : " + fb.result().toString());

  File content2 = File("g2.txt");
  List<String> list2 = await content2.readAsLines();
  //读取到文件的顶点数量以及
  int v2 = int.parse(list2[0].split(" ")[0]);
  int e2 = int.parse(list2[0].split(" ")[1]);
  Graph graph2 = Graph(v2, e2, list2);
  FindBridges fb2 = new FindBridges(graph2);
  print("Bridges in g2 : " + fb2.result().toString());

  File content3 = File("g3.txt");
  List<String> list3 = await content3.readAsLines();
  //读取到文件的顶点数量以及
  int v3 = int.parse(list3[0].split(" ")[0]);
  int e3 = int.parse(list3[0].split(" ")[1]);
  Graph graph3 = Graph(v3, e3, list3);
  FindBridges fb3 = new FindBridges(graph3);
  print("Bridges in g3 : " + fb3.result().toString());

  File content4 = File("g4.txt");
  List<String> list4 = await content4.readAsLines();
  //读取到文件的顶点数量以及
  int v4 = int.parse(list4[0].split(" ")[0]);
  int e4 = int.parse(list4[0].split(" ")[1]);
  Graph graph4 = Graph(v4, e4, list4);
  FindBridges fb4 = new FindBridges(graph4);
  print("Bridges in g4 : " + fb4.result().toString());

  File content5 = File("tree.txt");
  List<String> list5 = await content5.readAsLines();
  //读取到文件的顶点数量以及
  int v5 = int.parse(list5[0].split(" ")[0]);
  int e5 = int.parse(list5[0].split(" ")[1]);
  Graph graph5 = Graph(v5, e5, list5);
  FindBridges fb_tree = new FindBridges(graph5);
  print("Bridges in tree : " + fb_tree.result().toString());
}
