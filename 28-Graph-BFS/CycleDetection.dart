import 'Graph.dart';
import 'dart:io';
import 'dart:collection';

/**
 * 无向图的环检测BFS问题
 */
class CycleDetection {
  Graph? _G;

  List? _visited;

  bool _hasCycle = false;

  List? _pre;

  CycleDetection(Graph G) {
    this._G = G;
    _visited = List.filled(_G!.V()!, false, growable: true);
    _pre = List.filled(_G!.V()!, 0, growable: true);
    for (int i = 0; i < _G!.V()!; i++) {
      _pre![i] = -1;
    }
    for (int v = 0; v < _G!.V()!; v++) {
      if (!_visited![v]) {
        if (_bfs(v, v)) {
          _hasCycle = true;
          break;
        }
      }
    }
  }

  // 从顶点 v 开始，判断图中是否有环
  bool _bfs(int v, int parent) {
    ListQueue queue = ListQueue();
    queue.add(v);
    _visited![v] = true;
    _pre![v] = v;
    while (!queue.isEmpty) {
      int v = queue.removeFirst();

      for (int w in _G!.adj(v))
        if (!_visited![w]) {
          queue.add(w);
          _visited![w] = true;
          _pre![w] = v;
        } else if (_pre![v] != w) return true;
    }

    return false;
  }

  bool hasCycle() {
    return _hasCycle;
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

  CycleDetection cycleDetection = CycleDetection(graph);
  print(cycleDetection.hasCycle());

  File content2 = File("g2.txt");
  List<String> list2 = await content2.readAsLines();
  //读取到文件的顶点数量以及
  int v2 = int.parse(list2[0].split(" ")[0]);
  int e2 = int.parse(list2[0].split(" ")[1]);
//
  Graph graph2 = Graph(v2, e2, list2);

  CycleDetection cycleDetection2 = CycleDetection(graph2);
  print(cycleDetection2.hasCycle());
}
