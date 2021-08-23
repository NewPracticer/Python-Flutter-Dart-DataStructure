/**
 * 最大堆
 */
class MaxHeap<E extends Comparable<E>>{

    List? data ;

    MaxHeap.withCapacity(int capacity){
      data = List.filled(capacity, E, growable: true);
    }

    MaxHeap.withEmpty(){
      data = List.empty(growable: true);
    }

    // 返回堆中的元素个数
    int? size(){
      return data!.length;
    }

    // 返回一个布尔值, 表示堆中是否为空
    bool isEmpty(){
      return data!.isEmpty;
    }

    int _parent(int index){
      if(index == 0){
        throw Exception("index-0 doesn't have parent.");
      }
      return ((index - 1) / 2).toInt();
    }

    // 返回完全二叉树的数组表示中，一个索引所表示的元素的左孩子节点的索引
    int _leftChild(int index){
      return index * 2 + 1;
    }

    // 返回完全二叉树的数组表示中，一个索引所表示的元素的右孩子节点的索引
    int _rightChild(int index){
      return index * 2 + 2;
    }

    // 向堆中添加元素
    add(E e){
      data!.add(e);
      siftUp(data!.length - 1);
    }

    siftUp(int k){
      while(k > 0 && data![_parent(k)].compareTo(data![k]) < 0 ){
        _swap(k, _parent(k));
        k = _parent(k);
      }
    }

    // 看堆中的最大元素
    E findMax(){
      if(data!.length == 0)
        throw new Exception("Can not findMax when heap is empty.");
      return data![0];
    }

    // 取出堆中最大元素
    E extractMax(){

      E ret = findMax();
      _swap(0, data!.length - 1);
      data!.removeLast();
      siftDown(0);

      return ret;
    }

    siftDown(int k){
      while(_leftChild(k) < data!.length){
        int j = _leftChild(k); // 在此轮循环中,data[k]和data[j]交换位置
        if( j + 1 < data!.length &&
            data![j+1].compareTo(data![j]) > 0 )
          j ++;
        // data[j] 是 leftChild 和 rightChild 中的最大值
        if(data![k].compareTo(data![j]) >= 0 )
          break;
        _swap(k, j);
        k = j;
      }
    }

    _swap(int i, int j){
      if(i < 0 || i >= data!.length || j < 0 || j >= data!.length)
        throw new Exception("Index is illegal.");

      E t = data![i];
      data![i] = data![j];
      data![j] = t;
    }

}