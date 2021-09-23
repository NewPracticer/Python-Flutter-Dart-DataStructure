import 'Graph.dart';
import 'dart:collection';
import 'dart:math';
import 'dart:io';

/**
 * 查找割点
 */
class FindCutPoints {
  Graph? _G;

  List? _visited;

  List? _ord;

  List? _low;

  int _cnt = 0;

  HashSet<int>? res;

  FindCutPoints(Graph G) {
    this._G = G;
    _visited = List.filled(_G!.V()!, false, growable: true);

    res = HashSet();
    _ord = List.filled(_G!.V()!, 0, growable: true);
    _low = List.filled(_G!.V()!, 0, growable: true);
    _cnt = 0;

    for (int v = 0; v < _G!.V()!; v++) if (!_visited![v]) _dfs(v, v);
  }

  _dfs(int v, int parent) {
    _visited![v] = true;
    _ord![v] = _cnt;
    _low![v] = _ord![v];
    _cnt++;

    int child = 0;

    for (int w in _G!.adj(v))
      if (!_visited![w]) {
        _dfs(w, v);
        _low![v] = [(_low![v] as int), (_low![w] as int)].reduce(min);

        if (v != parent && _low![w] >= _ord![v]) res!.add(v);

        child++;
        if (v == parent && child > 1) res!.add(v);
      } else if (w != parent)
        _low![v] = [(_low![v] as int), (_low![w] as int)].reduce(min);
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
  FindCutPoints fc = new FindCutPoints(graph);
  print("Cut Points in g : " + fc.result().toString());

  File content2 = File("g2.txt");
  List<String> list2 = await content2.readAsLines();
  //读取到文件的顶点数量以及
  int v2 = int.parse(list2[0].split(" ")[0]);
  int e2 = int.parse(list2[0].split(" ")[1]);
  Graph graph2 = Graph(v2, e2, list2);
  FindCutPoints fc2 = new FindCutPoints(graph2);
  print("Cut Points in g2 : " + fc2.result().toString());

  File content3 = File("g3.txt");
  List<String> list3 = await content3.readAsLines();
  //读取到文件的顶点数量以及
  int v3 = int.parse(list3[0].split(" ")[0]);
  int e3 = int.parse(list3[0].split(" ")[1]);
  Graph graph3 = Graph(v3, e3, list3);
  FindCutPoints fc3 = new FindCutPoints(graph3);
  print("Cut Points in g3 : " + fc3.result().toString());

  File content5 = File("tree.txt");
  List<String> list5 = await content5.readAsLines();
  //读取到文件的顶点数量以及
  int v5 = int.parse(list5[0].split(" ")[0]);
  int e5 = int.parse(list5[0].split(" ")[1]);
  Graph graph5 = Graph(v5, e5, list5);
  FindCutPoints fc4 = new FindCutPoints(graph5);
  print("Cut Points in tree : " + fc4.result().toString());
}
