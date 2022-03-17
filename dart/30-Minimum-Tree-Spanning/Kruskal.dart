import 'WeightedGraph.dart';
import 'WeightedEdge.dart';
import 'CC.dart';
import 'UF.dart';
import 'dart:io';
class Kruskal {
  WeightedGraph? _G;

  List? mst;

  Kruskal(WeightedGraph G) {
    this._G = G;
    mst = List.filled(0, WeightedEdge, growable: true);

    CC cc = new CC(G);
    if (cc.count() > 1) return;

    List? edges = List.filled(0, WeightedEdge, growable: true);
    for (int v = 0; v < _G!.V()!; v++)
      for (int w in G.adj(v))
        if (v < w) edges.add(new WeightedEdge(v, w, G.getWeight(v, w)));

    edges.sort();

    UF uf = new UF(G.V()!);
    for (WeightedEdge edge in edges) {
      int v = edge.getV();
      int w = edge.getW();
      if (!uf.isConnected(v, w)) {
        mst!.add(edge);
        uf.unionElements(v, w);
      }
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
  WeightedGraph g = new WeightedGraph(v,e,list);
  Kruskal kruskal = new Kruskal(g);
  print(kruskal.result());
}
