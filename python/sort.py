'''
    线性查找
    冒泡排序
    选择排序
    插入排序
    希尔排序
'''
import random
# 线性查找算法
def liner_search(list,value):
    for item in range(len(list)):
        if(list[item] == value):
            return item;
    return -1;    
print("---------------------线性查找");
testList = [1,2,3,4,5,6,7,8,9]
print(liner_search(testList, 8))

# 选择排序
def selectionSort(sortList):
  print(sortList);
  for i in range(len(sortList)):
      minIndex = i ;
      for j in range(i,len(sortList)):
          if sortList[minIndex]>sortList[j]:
              minIndex=j
      sortList[i],sortList[minIndex] = sortList[minIndex],sortList[i]
  return sortList
print("---------------------选择排序");
random.seed(54)
sortList = [random.randint(0,100) for _ in range(10)]
print("原始数据：", sortList)
selectionSort(sortList)
print("选择排序结果：", sortList)


 # 冒泡排序
def bubble_sort(sortList):
      for i in range(len(sortList)):
          isSwap = False; #设置标志位，若已排序好，则不排序
          for j in range(len(sortList)-i-1):
              if sortList[j] > sortList[j + 1]:
                    sortList[j], sortList[j + 1] = sortList[j + 1], sortList[j]
                    isSwap = True
          if not isSwap:
            break
print("---------------------冒泡排序");
random.seed(54)
sortList = [random.randint(0,100) for _ in range(10)]
print("原始数据：", sortList)
bubble_sort(sortList)
print("冒泡排序结果：", sortList)
