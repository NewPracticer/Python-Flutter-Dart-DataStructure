void main(){
  var data = {24, 18, 12, 9, 16, 66, 32, 4};
  if(LinearSearch(data.toList(), 4)){
    print("搜索到数字");
  }else{
    print("没搜索到数字");
  }
}
bool search(List arr,Object target){
  return arr.contains(target);
}

bool LinearSearch(List arr,Object target){
     for(int i =0;i<arr.length;i++){
        if(arr[i] == target){
          return true;
        }
     }
     return false;
}