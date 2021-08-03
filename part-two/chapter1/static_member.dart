/**
 */
void main() {
  var page = new Page();

  Page.scrollDown();
}

class Page{

  static const int maxPage = 10;

  static int currentPage = 1;

  //下滑
  static void scrollDown(){
    currentPage = 1;
    print("ScrollDown...");
  }

  //上滑
  void scrollUp(){
    currentPage++;
    print("scrollUp...");
  }

}
