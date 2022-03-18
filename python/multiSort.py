'''
    线性查找
    冒泡排序
    选择排序
    插入排序
    希尔排序
'''
import random
import time
# 线性查找算法
def liner_search(list,value):
    for item in range(len(list)):
        if(list[item] == value):
            return item;
    return -1;    
print("---------------------线性查找");
testList = [1,2,3,4,5,6,7,8,9]
start = time.perf_counter()
print(liner_search(testList, 8))
end = time.perf_counter()
print("时间：", end-start)

# 选择排序
def selectionSort(sortList):
  for i in range(len(sortList)):
      minIndex = i ;
      for j in range(i,len(sortList)):
          if sortList[minIndex]>sortList[j]:
              minIndex=j
      sortList[i],sortList[minIndex] = sortList[minIndex],sortList[i]
  return sortList


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

# 插入排序
def insertionSort(sortList):
    for i in range(1,len(sortList)):
        currentValue = sortList[i]
        currentPosition = i 
        while currentPosition>0 and sortList[currentPosition-1]>currentValue:
            sortList[currentPosition] = sortList[currentPosition-1]
            currentPosition = currentPosition-1
        sortList[currentPosition] = currentValue
    return sortList

#希尔排序
def shellSort(sortList):
    length = len(sortList)
    dist = length // 2
    
    while dist > 0 :
        for i in range(dist,length):
            j = i 
            while j >= dist and sortList[j-dist] > sortList[j] :
                sortList[j-dist],sortList[j] = sortList[j],sortList[j-dist]
                j = j- dist
        dist = dist//2
    return sortList
# 计算结果，计算时间
def caculateResultAndTime(name,fuction,randomseed):
    print("--------------------",name)
    random.seed(randomseed)
    sortList = [random.randint(0,100) for _ in range(10)]
    print("原始数据：",sortList)
    startTime = time.perf_counter()
    fuction(sortList)
    endTime = time.perf_counter()
    print("排序结果:",sortList,' 花费时间：',endTime-startTime)

if __name__ == '__main__':
    caculateResultAndTime("希尔排序",shellSort,88)
    caculateResultAndTime("插入排序",insertionSort,89)
    caculateResultAndTime("冒泡排序",bubble_sort,90)
    caculateResultAndTime("选择排序",selectionSort,91)
        
    



