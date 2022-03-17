class Student {

  String? name;
  int? score;

  Student(this.name,this.score);

  @override
  num? compareTo(other) {
    return  this.score! - other.score;
  }

  String? getName(){
    return name;
  }

  int? getScore(){
    return score;
  }

  @override
  toString(){
    return "Student(name: $name, score: $score)";
  }
}