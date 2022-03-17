/**
 * 选择排序
 *
 * 选择最小的
 */
void main(){

  var list = [2, 4, 6, 3, 1, 5];
  var list2 = ["2","4","6","3","1","5"];
  var list3 = [new Student("xiaoming", 90),new Student("xiaoli", 70),new Student("xiaowang", 80),new Student("skyl", 100),];
  selectionSort(list2);
  selectionSort(list3);
  list3.forEach((element) {print(element.name);print(element.score);});
}
void selectionSort(List arr){
  print("---------------------选择排序");
  for(int i = 0; i < arr.length; i ++){
    int minIndex = i;
    for(int j = i; j < arr.length; j ++){
      if(arr[j].compareTo(arr[minIndex]) < 0)
        minIndex = j;
    }
    swap(arr, i, minIndex);
  }
  arr.forEach((element) {print(element);});
}

void swap(arr, int i, int j) {
  var t = arr[i];
  arr[i] = arr[j];
  arr[j] = t;
}

class Student {

  String? name;
  num? score;

  Student(this.name,this.score);

  @override
  num? compareTo(other) {
    return  this.score! - other.score;
  }
}