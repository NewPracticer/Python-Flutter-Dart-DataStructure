import 'dart:io';

/**
 * 图的邻接矩阵表示方式
 *
 * 注：
 * 先读取文件，将相应数据赋值
 */
class AdjMatrix {
  int? _V;//图的顶点数量
  int? _E;//图的边的数量
  List?  _adj;//邻接矩阵


  AdjMatrix( V,E,List list) {
    _V = V;
    _E = E ;
    if(V < 0) throw Exception("V must be non-negative");
    if(E < 0) throw Exception("E must be non-negative");
    _adj = List.generate(V, (_)=>List.generate(V,(_)=> 0),growable: false);
    for(int i =1;i<=E;i++){
      int a =  int.parse(list[i].split(" ")[0]);
      _validateVertex(a);
      int b = int.parse(list[i].split(" ")[1]);
      _validateVertex(b);
      _adj![a][b] = 1;
      _adj![b][a] = 1;
    }
  }

  _validateVertex(int v){
    if(v < 0 || v >= _V!)
      throw new Exception("vertex  $v is invalid");
  }

  int? V(){
    return _V;
  }

  bool hasEdge(int v, int w){
    _validateVertex(v);
    _validateVertex(w);
    return _adj![v][w] == 1;
  }

  int _degree(int v){
    return _adj![v].length;
  }

  int? E(){
    return _E;
  }

  List<int> adj(int v){
    _validateVertex(v);
    List<int> res = List.filled(_V!, 0,growable: true);
    for(int i = 0; i < _V!; i ++)
      if(_adj![v][i] == 1)
        res.add(i);
    return res;
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer();
    sb.write("V = $_V, E = $_E\n");
    for (int i = 0; i < _V!; i ++) {
      for (int j = 0; j < _V!; j ++)
        sb.write("${_adj![i][j]} ");
      sb.write('\n');
    }
    return sb.toString();
  }


}

void main() async {
  File content = File("g.txt");
  List<String> list = await content.readAsLines();
  //读取到文件的顶点数量以及
  print(list[0].split(" ")[0]);
  print(list[0].split(" ")[1]);
  int v = int.parse(list[0].split(" ")[0]) ;
  int e = int.parse(list[0].split(" ")[1]) ;
//
  AdjMatrix adjMatrix = AdjMatrix(v, e, list);
  print(adjMatrix);

}