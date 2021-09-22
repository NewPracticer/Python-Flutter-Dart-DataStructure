import 'AdjMatrix.dart';
import 'dart:io';

/**
 * 邻接矩阵的深度遍历
 */
class AdjMatrixDFS {
  AdjMatrix? G;

  List? visited;

  List? preList;

  List? postList;

  AdjMatrixDFS(AdjMatrix G) {
    this.G = G;
    visited = List.filled(G.V()!, false, growable: true);
    preList = List.filled(0, 0, growable: true);
    postList = List.filled(0, 0, growable: true);
    for (int v = 0; v < G.V()!; v++) {
      if (!(visited![v])) {
        _dfs(v);
      }
    }
  }

  _dfs(int v) {
    visited![v] = true;
    preList!.add(v);
    for (int w in G!.adj(v)) {
      if (!visited![w]) {
        _dfs(w);
      }
    }
    postList!.add(v);
  }

  pre() {
    return preList;
  }

  post() {
    return postList;
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
  AdjMatrix adjList = AdjMatrix(v, e, list);
  AdjMatrixDFS graphDFS = new AdjMatrixDFS(adjList);
  print("DFS preOrder :  ${graphDFS.pre()}");
  print("DFS postOrder : ${graphDFS.post()}");
}
