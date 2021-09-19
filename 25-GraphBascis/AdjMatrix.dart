import 'dart:io';

/**
 * 图的邻接矩阵表示方式
 *
 * 注：
 * 由于原构造方法需要读取文件
 * dart语言中读取文件是异步方法
 * dart语言中构造方法是不允许异步
 *
 * 所以无法按照原有格式实现，故更换方式
 *
 * 先读取文件，将相应数据赋值
 */
class AdjMatrix {
  int? _V;//图的顶点数量
  int? _E;//图的边的数量
  List?  _adj;//邻接矩阵


  AdjMatrix( V,E,List list) {
    _V = V;
    _E = E ;

    _adj = List.generate(V, (_)=>List.generate(V,(_)=> 0),growable: false);
    for(int i =1;i<E;i++){
      int a =  int.parse(list[i].split(" ")[0]);
      int b = int.parse(list[i].split(" ")[1]);
      _adj![a][b] = 1;
      _adj![b][a] = 1;
    }
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