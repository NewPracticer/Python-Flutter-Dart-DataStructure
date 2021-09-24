class Solution {
  sortColors(List<int> nums) {
    List? cnt = List.filled(3, 0, growable: true);
    for (int num in nums) {
      cnt[num]++;}

    for (int i = 0; i < cnt[0]; i++) {
      nums[i] = 0;
    }
    for (int i = cnt[0]; i < cnt[0] + cnt[1]; i++) {
      nums[i] = 1;
    }
    for (int i = cnt[0] + cnt[1]; i < cnt[0] + cnt[1] + cnt[2]; i++) {
      nums[i] = 2;
    }
  }

  sortColors2(List<int> nums) {
    // 处理元素取值范围是 [0, R) 的计数排序
    int R = 3;

    List? cnt = List.filled(3, 0, growable: true);
    for (int num in nums) {
      cnt[num]++;
    }

    // [index[i], index[i + 1]) 的值为 i
    List? index = List.filled(R + 1, , int, growable: true);
    for (int i = 0; i < R; i++) {
      index[i + 1] = index[i] + cnt[i];
    }

    for (int i = 0; i + 1 < index.length; i++) {
      // [index[i], index[i + 1]) 的值为 i
      for (int j = index[i]; j < index[i + 1]; j++){
        nums[j] = i;
      }
    }
  }
}
