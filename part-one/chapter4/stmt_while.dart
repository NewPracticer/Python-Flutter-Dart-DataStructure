/**
 *
 *
 * @/7/15
 */
void main(){
  int count = 0;

  while(count < 5){
    print(count++);
  }

  print("---$count----");

  do{
    print(count--);
  }while(count > 0 && count < 5);


}
