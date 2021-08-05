class LinkedList<T>{

   late _Node _head;
   late int _size;

   LinkedList(){
      _head = new _Node.empty();
      _size = 0;
   }

   int getSize(){
      return _size;
   }

   bool isEmpty(){
      return _size == 0;
   }

   addFirst(T t){
//      _Node _node =new _Node.head(t);
//      _node.next = _head;
//      _head = _node;

      _head = new _Node.all(t, _head);
      _size++;
   }

   //在链表的index位置添加新的元素e
   add(int index,T t){
      if(index<0||index>_size){
         throw Exception("Add Failed,Illegal index");
      }
      if(index == 0){
         addFirst(t);
      }else{
         _Node prev = _head;
         for(var i =0;i<index-1;i++){
            prev = prev.next;
         }
         _Node _node = new _Node.head(t);
         _node.next = prev.next;
         prev.next = _node;
         _size++;
      }
   }

   addLast(T t){
      add(_size, t);
   }
}
//节点
class _Node<T>{
   late _Node next;
   late T t;

   _Node.empty();

   _Node.all(this.t,this.next);

   factory _Node.head(T t){
      dynamic i ;
      var result = new _Node.all(t, i);
      return result;
   }

   @override
  String toString() {
    return t.toString();
  }
}