/**
 *
 *  枚举
 * @/10/31
 */

//const spring = 0;
//const summer = 1;
//const autumn = 2;
//const winter = 3;

void main() {
  var currentSeason  = Season.winter;

  print(currentSeason.index);

  switch(currentSeason){
    case Season.spring:
      print("1-3月");
      break;
    case Season.summer:
      print("4-6月");
      break;
    case Season.autumn:
      print("7-9月");
      break;
    case Season.winter:
      print("10-12月");
      break;
  }
}

enum Season{
  spring,
  summer,
  autumn,
  winter
}
