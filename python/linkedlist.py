class __Node(object):
    
    def __init__(self,value=None,next=None):
        self.value = value;
        self.next = next;
    
    def __str__(self):
        return self.value;

class LinkedList(object):

    def __init__(self):
        self.__head = None
        self.__size = 0
        
    def getSize(self):
        return self.__size
    
    def isEmpty(self):
        return self.__size == 0;

    def remove(self,index):
        if index<0 or index> self.__size:
            raise Exception("Remove Failed,Illegal index")
        prev = self.__head
        for i in range(0,index):
            prev = prev.next
        




















# class LinkedList<T> {
#   remove(int index){
#     
#     _Node? prev = _dummyHead;
#     for(var i =0;i<index ;i++){
#       prev = prev?.next;
#     }
#     _Node? retNode = prev!.next;
#     prev.next = retNode!.next;
#     retNode.next = null;
#     _size --;
#     return retNode.t;
#   }

#   //从链表中删除第一个元素，返回删除元素
#   T? removeFirst(){
#     remove(0);
#   }
#   //从链表中删除第一个元素，返回删除元素
#   T? removeLast(){
#     remove(_size -1);
#   }


#   //在链表的index位置添加新的元素e
#   add(int index, T t) {
#     if (index < 0 || index > _size) {
#       throw Exception("Add Failed,Illegal index");
#     }
# //      if(index == 0){
# //         addFirst(t);
# //      }else{
#     _Node? prev = _dummyHead;
#     for (var i = 0; i < index; i++) {
#       prev = prev?.next;
#     }
#     _Node _node = new _Node.wihtHead(t);
#     _node.next = prev?.next;
#     prev?.next = _node;
#     _size++;
# //      }
#   }

#   addLast(T t) {
#     add(_size, t);
#   }

#   addFirst(T t) {
# //      _Node _node =new _Node.head(t);
# //      _node.next = _head;
# //      _head = _node;
#     add(0, t);
#   }

#   //获取链表第index位置的元素
#   T get(int index){
#     if (index < 0 || index > _size) {
#       throw Exception("Get Failed,Illegal index");
#     }
#     _Node? cur = _dummyHead!.next;
#     for(var i=0;i<index;i++){
#       cur = cur!.next;
#     }
#     return cur!.t;
#   }

#   T getFirst(){
#     return get(0);
#   }
#   T getLast(){
#     return get(_size-1);
#   }
#   set(int index,T t){
#     if (index < 0 || index > _size) {
#       throw Exception("Set Failed,Illegal index");
#     }
#     _Node? cur = _dummyHead!.next;
#     for(var i =0;i<index;i++){
#       cur = cur!.next;
#     }
#     cur!.t= t;
#   }

#   bool contains(T t){
#     _Node? cur = _dummyHead!.next;
#     for(var i =0;i<_size-1;i++){
#       if(cur!.t.compareTo(t)){
#         return true;
#       }
#       cur = cur.next;
#     }
#     return false;
#   }

#   @override
#   String toString() {
#     StringBuffer res =new StringBuffer();
#     for(_Node? cur = _dummyHead!.next ; cur != null ; cur = cur.next){
#       res.write(cur);
#       res.write("->");
#     }
#     res.write("NULL");
#     return res.toString();
#   }
# }


