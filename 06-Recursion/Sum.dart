/**
 * 递归
 */
class Sum{

  static int sum(List arr){
    return sumRecurison(arr,0);
  }
  static int sumRecurison(List arr,int l){
    if(l == arr.length){
      return 0;
    }
      return arr[l]+sumRecurison(arr,l+1);
  }
}

void  main(){
  List nums = [1,2,3,4,5,6,7,8];
  int result = Sum.sum(nums);
  print("结果：$result");
}
