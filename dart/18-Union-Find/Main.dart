import 'UnionFind1.dart';
import 'UnionFind2.dart';
import 'UnionFind3.dart';
import 'UnionFind4.dart';
import 'UnionFind5.dart';
import 'UnionFind6.dart';
import 'dart:math';
import 'UF.dart';

double testUF(UF uf, int m){

  int? size = uf.getSize();
  Random random = new Random();

  var now = new DateTime.now();
  num startTime = now.millisecondsSinceEpoch;


  for(int i = 0 ; i < m ; i ++){
    int a = random.nextInt(size!);
    int b = random.nextInt(size);
    uf.unionElements(a, b);
  }

  for(int i = 0 ; i < m ; i ++){
    int a = random.nextInt(size!);
    int b = random.nextInt(size);
    uf.isConnected(a, b);
  }

  var endNow = new DateTime.now();
  num endTime = endNow.millisecondsSinceEpoch;

  double time = (endTime - startTime) / 1000.0;
  return time;
}

void main(){
  int size = 10000000;
  int m = 10000000;

  UnionFind3 uf3 = new UnionFind3(size);
  print("UnionFind3 :  ${testUF(uf3, m)} s");

  UnionFind4 uf4 = new UnionFind4(size);
  print("UnionFind4 :  ${testUF(uf4, m)}  s");

  UnionFind5 uf5 = new UnionFind5(size);
  print("UnionFind5 : ${testUF(uf5, m)}  s");

  UnionFind6 uf6 = new UnionFind6(size);
  print("UnionFind6 : ${testUF(uf6, m)}  s");

}