import 'WeightedGraph.dart';
import 'WeightedEdge.dart';
import 'CC.dart';
import 'dart:collection';
import 'dart:io';

/**
 * Prim算法中
 * 需要使用到优先级队列
 * 而dart中无优先级队列
 */
class Prim {
  WeightedGraph? G;

  List? mst;

  Prim(WeightedGraph G) {
    this.G = G;
    mst = List.filled(0, WeightedEdge, growable: true);

    CC cc = new CC(G);
    if (cc.count() > 1) return;

    List? _visited = List.filled(G.V()!, false, growable: true);
    _visited[0] = true;
    Queue pq = ListQueue();

    for (int w in G.adj(0)) {
      pq.add(new WeightedEdge(0, w, G.getWeight(0, w)));
    }

    while (!pq.isEmpty) {
      WeightedEdge minEdge = pq.removeFirst();
      if (_visited[minEdge.getV()] && _visited[minEdge.getW()]){
        continue;
      }
      print("${minEdge.getV()}  ${minEdge.getW()} ${minEdge.getWeight()}");
      mst!.add(minEdge);

      int newv = _visited[minEdge.getV()] ? minEdge.getW() : minEdge.getV();
      _visited[newv] = true;
      for (int w in G.adj(newv))
        if (!_visited[w])
          pq.add(new WeightedEdge(newv, w, G.getWeight(newv, w)));
    }
  }

  result() {
    return mst;
  }
}

void main() async {
  File content = File("g.txt");
  List<String> list = await content.readAsLines();
  //读取到文件的顶点数量以及
  int v = int.parse(list[0].split(" ")[0]);
  int e = int.parse(list[0].split(" ")[1]);
  WeightedGraph g = new WeightedGraph(v, e, list);
  Prim prim = new Prim(g);
  print(prim.result());
}
