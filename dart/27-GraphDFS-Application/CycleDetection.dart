import 'Graph.dart';
import 'dart:io';
/**
 * 无向图的环检测
 */
class CycleDetection {
  Graph? _G;

  List? _visited;

  bool _hasCycle = false;

  CycleDetection(Graph G) {
    this._G = G;
    _visited = List.filled(_G!.V()!, false, growable: true);
    for (int v = 0; v < _G!.V()!; v++)
      if (!_visited![v]) if (_dfs(v, v)) {
        _hasCycle = true;
        break;
      }
  }

  // 从顶点 v 开始，判断图中是否有环
  bool _dfs(int v, int parent) {
    _visited![v] = true;
    for (int w in _G!.adj(v))
      if (!_visited![w]) {
        if (_dfs(w, v)) return true;
      } else if (w != parent) return true;
    return false;
  }

  bool hasCycle() {
    return _hasCycle;
  }
}

void main () async{

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


