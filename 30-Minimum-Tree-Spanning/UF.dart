class UF{

 List? parent;

  UF(int n){
    parent = List.filled(n,0, growable: true);
    for(int i = 0 ; i < n ; i ++) {
      parent![i] = i;
    }
  }

  int find(int p){
    if( p != parent![p] )
      parent![p] = find( parent![p] );
    return parent![p];
  }

   bool isConnected(int p , int q){
    return find(p) == find(q);
  }

   unionElements(int p, int q){

    int pRoot = find(p);
    int qRoot = find(q);

    if( pRoot == qRoot )
      return;

    parent![pRoot] = qRoot;
  }
}