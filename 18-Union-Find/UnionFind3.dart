import 'UF.dart';

/**
 * 第三版 并查集
 */
class UnionFind3 extends UF {
  List? parent; // parent[i]表示第一个元素所指向的父节点
  List? sz; // sz[i]表示以i为根的集合中元素个数

  // 构造函数
  UnionFind3(int size) {
    parent = List.filled(size, num, growable: false);
    sz = List.filled(size, num, growable: false);

    // 初始化, 每一个parent[i]指向自己, 表示每一个元素自己自成一个集合
    for (int i = 0; i < size; i++) {
      parent![i] = i;
      sz![i] = 1;
    }
  }

  @override
  int? getSize() {
    return parent!.length;
  }

  // 查找过程, 查找元素p所对应的集合编号
  // O(h)复杂度, h为树的高度
  int find(int p) {
    if (p < 0 || p >= parent!.length) {
      throw new Exception("p is out of bound.");
    }

    // 不断去查询自己的父亲节点, 直到到达根节点
    // 根节点的特点: parent[p] == p
    while (p != parent![p]) {
      p = parent![p];
    }
    return p;
  }

  // 查看元素p和元素q是否所属一个集合
  // O(h)复杂度, h为树的高度
  @override
  bool isConnected(int p, int q) {
    return find(p) == find(q);
  }

  // 合并元素p和元素q所属的集合
  // O(h)复杂度, h为树的高度
  @override
  unionElements(int p, int q) {
    int pRoot = find(p);
    int qRoot = find(q);

    if (pRoot == qRoot) return;

    // 根据两个元素所在树的元素个数不同判断合并方向
    // 将元素个数少的集合合并到元素个数多的集合上
    if (sz![pRoot] < sz![qRoot]) {
      parent![pRoot] = qRoot;
      sz![qRoot] += sz![pRoot];
    } else {
      // sz[qRoot] <= sz[pRoot]
      parent![qRoot] = pRoot;
      sz![pRoot] += sz![qRoot];
    }
  }
}
