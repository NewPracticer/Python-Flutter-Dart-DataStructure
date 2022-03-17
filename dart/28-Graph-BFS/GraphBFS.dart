import 'Graph.dart';
import 'dart:collection';
import 'dart:io';
/**
 * 图的广度优先遍历
 */
class GraphBFS {
  Graph? G;

  List? _visited;

  List? _orderList = List.filled(0,0, growable: true);

  GraphBFS(Graph G) {
    this.G = G;
    _visited = List.filled(G.V()!, false, growable: true);
    for (int v = 0; v < G.V()!; v++) {
      if (!(_visited![v])) {
        _bfs(v);
      }
    }
  }

  _bfs(int v) {
    ListQueue queue = ListQueue();
    queue.add(v);
    _visited![v] = true;
    while (!queue.isEmpty) {
      int v = queue.removeFirst();
      _orderList!.add(v);
      for (int w in G!.adj(v)) {
        if (!_visited![w]) {
          queue.add(w);
          _visited![w] = true;
        }
      }
    }
  }

  order() {
    return _orderList;
  }
}
void main() async {
  File content = File("g.txt");
  List<String> list = await content.readAsLines();
  //读取到文件的顶点数量以及
  print(list[0].split(" ")[0]);
  print(list[0].split(" ")[1]);
  int v = int.parse(list[0].split(" ")[0]);
  int e = int.parse(list[0].split(" ")[1]);
//
  Graph adjList = Graph(v, e, list);
  GraphBFS graphDFS = new GraphBFS(adjList);
  print("BFS Order :  ${graphDFS.order()}" );
}