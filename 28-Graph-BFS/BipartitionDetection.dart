import 'Graph.dart';
import 'dart:io';
import 'dart:collection';

/**
 * 二分图检测BFS方法
 */
class BipartitionDetection {
  Graph? _G;

  List? _visited;

  List? _colors;

  bool _isBipartite = true;

  BipartitionDetection(Graph G) {
    this._G = G;
    _visited = List.filled(_G!.V()!, false, growable: true);
    _colors = List.filled(_G!.V()!, 0, growable: true);
    for (int i = 0; i < _G!.V()!; i++) _colors![i] = -1;

    for (int v = 0; v < _G!.V()!; v++)
      if (!_visited![v]) if (!_bfs(v, 0)) {
        _isBipartite = false;
        break;
      }
  }

  bool _bfs(int v, int color) {
    ListQueue queue = ListQueue();
    queue.add(v);
    _visited![v] = true;
    _colors![v] = 0;
    while (!queue.isEmpty) {
      int v = queue.removeFirst();

      for (int w in _G!.adj(v))
        if (!_visited![w]) {
          queue.add(w);
          _visited![w] = true;
          _colors![w] = 1 - _colors![v];
        } else if (_colors![v] == _colors![w]) return false;
    }
    return true;
  }

  bool isBipartite() {
    return _isBipartite;
  }
}

void main() async {
  print("------------------txt1");
  File content = File("g.txt");
  List<String> list = await content.readAsLines();
  //读取到文件的顶点数量以及
  int v = int.parse(list[0].split(" ")[0]);
  int e = int.parse(list[0].split(" ")[1]);
//
  Graph graph = Graph(v, e, list);

  BipartitionDetection bipartitionDetection = BipartitionDetection(graph);
  print(bipartitionDetection.isBipartite());
  print("------------------txt2");
  File content2 = File("g2.txt");
  List<String> list2 = await content2.readAsLines();
  //读取到文件的顶点数量以及
  int v2 = int.parse(list2[0].split(" ")[0]);
  int e2 = int.parse(list2[0].split(" ")[1]);
//
  Graph graph2 = Graph(v2, e2, list2);

  BipartitionDetection bipartitionDetection2 = BipartitionDetection(graph2);
  print(bipartitionDetection2.isBipartite());
  print("------------------txt3");

  File content3 = File("g3.txt");
  List<String> list3 = await content3.readAsLines();
  //读取到文件的顶点数量以及
  int v3 = int.parse(list3[0].split(" ")[0]);
  int e3 = int.parse(list3[0].split(" ")[1]);
//
  Graph graph3 = Graph(v3, e3, list3);

  BipartitionDetection bipartitionDetection3 = BipartitionDetection(graph3);
  print(bipartitionDetection3.isBipartite());
}
