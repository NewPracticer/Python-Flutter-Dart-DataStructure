class ListNode{

  int? val;
  ListNode? next;

  ListNode(this.val);

  ListNode.withArray(List arr){
    if(arr == null || arr.length == 0){
      throw Exception("arr cannot be empty");
    }
    this.val = arr[0];
    ListNode cur = this;
    for(var i = 1;i<arr.length;i++){
      cur.next = ListNode(arr[i]);
      cur = cur.next!;
    }
  }
  @override
  String toString() {
    StringBuffer s = new StringBuffer();
    ListNode cur =this;
    while(cur !=null){
      s.write("${cur.val} ->");
      if(cur.next !=null){
        cur = cur.next!;
      }else{
        break;
      }
    }
    s.write("NULL");
    return s.toString();
  }


}