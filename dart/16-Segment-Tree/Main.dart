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
//  NewMerger<num> selfMerger = NewMerger<num>();
//  SegmentTree segTree = SegmentTree(nums, selfMerger);
  SegmentTree segmentTreeSec = SegmentTree(nums, new NewMerger());
  print(segmentTreeSec.toString());
}


