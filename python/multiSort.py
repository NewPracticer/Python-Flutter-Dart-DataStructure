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

#快速排序
def quickSort(sortList,left,right):
    if left<right:
        q = partition(sortList,left,right)
        quickSort(sortList,left,q-1)
        quickSort(sortList, q+1, right)

def partition(sortList,left,right):
    i = left-1
    pivot  = sortList[right]
    for j in range(left,right):
        if sortList[j] <= pivot:
            i +=1
            sortList[i],sortList[j] = sortList[j],sortList[i]
    sortList[i+1],sortList[right] = sortList[right],sortList[i+1]
    return i +1    

# 归并排序
def merge(arr1, arr2): 
    result = []
    while arr1 and arr2:
        if arr1[0] < arr2[0]:
            result.append(arr1.pop(0))
        else:
            result.append(arr2.pop(0))
    if arr1:
        result += arr1
    if arr2:
        result += arr2
    return result

def merge_sort(arr):
    if len(arr) <= 1:
        return arr
    mid = len(arr) // 2
    return merge(merge_sort(arr[:mid]), merge_sort(arr[mid:]))

# 计算结果，计算时间
def caculateResultAndTime(name,fuction,randomseed):
    print("--------------------",name,'\n')
    random.seed(randomseed)
    sortList = [random.randint(0,100) for _ in range(30)]
    print("原始数据：",sortList)
    startTime = time.perf_counter()
    fuction(sortList)
    endTime = time.perf_counter()
    print("排序结果:",sortList,'\n花费时间：',endTime-startTime)
    print("-------------------- 结束\n")

if __name__ == '__main__':
    caculateResultAndTime("希尔排序",shellSort,88)
    caculateResultAndTime("插入排序",insertionSort,89)
    caculateResultAndTime("冒泡排序",bubble_sort,90)
    caculateResultAndTime("选择排序",selectionSort,91)
    caculateResultAndTime("归并排序",selectionSort,93)

    print("--------------------快速排序")
    random.seed(92)
    sortList = [random.randint(0,100) for _ in range(15)]
    print("原始数据：",sortList)
    startTime = time.perf_counter()
    quickSort(sortList, 0, len(sortList)-1)
    endTime = time.perf_counter()
    print("排序结果:",sortList,' 花费时间：',endTime-startTime)
    print("-------------------- 结束\n")


    
        
    



