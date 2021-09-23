class WeightedEdge implements Comparable {
  int _v = 0;
  int _w = 0;
  int _weight = 0;

  WeightedEdge(this._v, this._w, this._weight);

  @override
  int compareTo(other) {
    // TODO: implement compareTo
    return (_weight - other.getWeight()) as int;
  }

  int getV() {
    return _v;
  }

  int getW() {
    return _w;
  }

  int getWeight() {
    return _weight;
  }

  @override
  String toString() {
    // TODO: implement toString
    return ("($_v-$_w: $_weight)");
  }
}
