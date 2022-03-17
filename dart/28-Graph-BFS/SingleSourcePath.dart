import 'Graph.dart';
import 'dart:io';
import 'dart:collection';

/**
 * 单源路径BFS问题
 *
 */
class SingleSourcePath {
  Graph? _G;

  int? _s;

  List? pre;

  List? _visited;

  SingleSourcePath(Graph G, int s) {
    this._G = G;
    this._s = s;
    pre = List.filled(_G!.V()!, 0, growable: true);
    _visited = List.filled(G.V()!, false, growable: true);
    for (int i = 0; i < pre!.length; i++) {
      pre![i] = -1;
    }
    _bfs(s);
  }

  _bfs(int v) {
    ListQueue queue = ListQueue();
    queue.add(v);
    _visited![v] = true;
    pre![v] = v;
    while (!queue.isEmpty) {
      int v = queue.removeFirst();

      for (int w in _G!.adj(v))
        if (!_visited![w]) {
          queue.add(w);
          _visited![w] = true;
          pre![w] = v;
        }
    }
  }

  bool isConnectedTo(int t) {
    _G!.validateVertex(t);
    return pre![t] != -1;
  }

  path(int t) {
    List res = List.filled(0, 0, growable: true);
    if (!isConnectedTo(t)) return res;

    int cur = t;
    while (cur != _s) {
      res.add(cur);
      cur = pre![cur];
    }
    res.add(_s);
    var result = res.reversed;
    return result;
  }
}

void main() async {
  File content = File("g.txt");
  List<String> list = await content.readAsLines();
  //读取到文件的顶点数量以及
  int v = int.parse(list[0].split(" ")[0]);
  int e = int.parse(list[0].split(" ")[1]);
//
  Graph graph = Graph(v, e, list);
  SingleSourcePath sspath = new SingleSourcePath(graph, 0);

  print("0 -> 6 : ${sspath.path(6)}");
}
