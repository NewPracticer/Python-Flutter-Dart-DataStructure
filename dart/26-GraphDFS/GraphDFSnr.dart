import 'Graph.dart';
import 'dart:io';
import 'Stack.dart';
import 'ArrayStack.dart';

class GraphDFSnr {
  Graph? G;

  List? visited;

  List? preList;

  GraphDFSnr(Graph G) {
    this.G = G;
    visited = List.filled(G.V()!, false, growable: true);
    preList = List.filled(0, 0, growable: true);
    for (int v = 0; v < G.V()!; v++) {
      if (!(visited![v])) {
        _dfs(v);
      }
    }
  }

  _dfs(int v) {
    ArrayStack stack = ArrayStack();
    stack.push(v);
    visited![v] = true;
    while (!stack.isEmpty()) {
      int cur = stack.pop();
      preList!.add(cur);
      for (int w in G!.adj(cur))
        if (!visited![w]) {
          stack.push(w);
          visited![w] = true;
        }
    }
  }

  pre() {
    return preList;
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
  GraphDFSnr graphDFS = new GraphDFSnr(adjList);
  print("DFS preOrder :  ${graphDFS.pre()}");
}
