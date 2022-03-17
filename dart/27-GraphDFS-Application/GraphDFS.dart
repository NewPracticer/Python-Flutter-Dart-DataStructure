import 'Graph.dart';
import 'dart:io';

/**
 * 图的深度遍历
 */
class GraphDFS {
  Graph? G;

  List? _visited;

  List? _preList;

  List? _postList;

  GraphDFS(Graph G) {
    this.G = G;
    _visited = List.filled(G.V()!, false, growable: true);
    _preList = List.filled(0, 0, growable: true);
    _postList = List.filled(0, 0, growable: true);
    for (int v = 0; v < G.V()!; v++) {
      if (!(_visited![v])) {
        _dfs(v);
      }
    }
  }

  _dfs(int v) {
    _visited![v] = true;
    _preList!.add(v);
    for (int w in G!.adj(v)) {
      if (!_visited![w]) {
        _dfs(w);
      }
    }
    _postList!.add(v);
  }

  pre() {
    return _preList;
  }

   post() {
    return _postList;
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
  GraphDFS graphDFS = new GraphDFS(adjList);
  print("DFS preOrder :  ${graphDFS.pre()}" );
  print("DFS postOrder : ${graphDFS.post()}");
}
