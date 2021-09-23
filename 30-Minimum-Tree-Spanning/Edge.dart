class Edge {
  int? v, w;
  Edge(int v, int w){
    this.v = v;
    this.w = w;
  }

  @override
  String toString(){
    return ("$v-$w");
  }
}