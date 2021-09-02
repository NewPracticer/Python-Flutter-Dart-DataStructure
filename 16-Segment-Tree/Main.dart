import 'Segment.dart';
import 'Merger.dart';

class NewMerger<E> implements Merger{
  @override
  merge(a, b) {
    return a + b ;
  }

}

void main(){
  List nums = [-2, 0, 3, -5, 2, -1];
  Merger<num> selfMerger = NewMerger() as Merger<num>;
  SegmentTree<num> segTree = SegmentTree(nums, selfMerger);
}


