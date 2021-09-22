import 'Graph.dart';
import 'dart:io';
import 'dart:collection';

/**
 * 图的联通分量BFS
 */
class CC {
  Graph? _G;

  List? _visited;

  int _cccount = 0;

  CC(Graph G) {
    this._G = G;
    _visited = List.filled(G.V()!, 0, growable: true);

    for (int i = 0; i < _visited!.length; i++) _visited![i] = -1;

    for (int v = 0; v < G.V()!; v++) {
      if (_visited![v] == -1) {
        _bfs(v, _cccount);
        _cccount++;
      }
    }
  }

  _bfs(int v, int ccid) {
    ListQueue queue = ListQueue();
    queue.add(v);
    _visited![v] = ccid;
    while (!queue.isEmpty) {
      int v = queue.removeFirst();

      for (int w in _G!.adj(v)) {
        if (_visited![w] == -1) {
          queue.add(w);
          _visited![w] = ccid;
        }
      }
    }
  }

  int count() {
    return _cccount;
  }

  bool isConnected(int v, int w) {
    _G!.validateVertex(v);
    _G!.validateVertex(w);
    return _visited![v] == _visited![w];
  }

  components() {
    List? res = List.generate(_cccount, (_) => List.generate(0, (_) => 0),
        growable: true);
    for (int v = 0; v < _G!.V()!; v++) res[_visited![v]].add(v);
    return res;
  }
}

void main() async {
  File content = File("g.txt");
  List<String> list = await content.readAsLines();
  //读取到文件的顶点数量以及
  int v = int.parse(list[0].split(" ")[0]);
  int e = int.parse(list[0].split(" ")[1]);
//
  Graph adjList = Graph(v, e, list);
  CC cc = new CC(adjList);
  print(cc.count());

  print(cc.isConnected(0, 6));
  print(cc.isConnected(5, 6));

  List comp = cc.components();
  for (int ccid = 0; ccid < comp.length; ccid++) {
    print("$ccid  :: ");
    for (int w in comp[ccid]) {
      print("$w ");
    }
    print("");
  }
}
