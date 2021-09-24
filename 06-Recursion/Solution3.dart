import 'ListNode.dart';
class Solution3{

  static ListNode? removeElements(ListNode head,int val){
    ListNode dummyHead = new ListNode(-1);
    dummyHead.next = head;

    ListNode prev = dummyHead;
    while(prev.next!=null){
      if(prev.next!.val == val){
        prev.next = prev.next!.next;
      }else{
        prev = prev.next!;
      }
    }
    return dummyHead.next;
//    if(head == null){
//      return head;
//    }
//    ListNode? res = removeElements(head.next!, val);
//    if(head.val == val){
//      return res;
//    }else{
//      head.next = res;
//      return head;
//    };

  }
}
void main(){
  var nums = [1,2,6,3,4,5,6];
  ListNode listNode =ListNode.withArray(nums);
  print(listNode);
  
  ListNode? res = Solution3.removeElements(listNode, 6);
  print(res);

}