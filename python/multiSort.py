'''
    线性查找
    冒泡排序
    选择排序
    插入排序
    希尔排序
    快速排序
    归并排序
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
def merge(sortList1, sortList2): 
    result = []
    while arr1 and arr2:
        if sortList1[0] < sortList2[0]:
            result.append(sortList1.pop(0))
        else:
            result.append(sortList2.pop(0))
    if sortList1:
        result += sortList1
    if sortList2:
        result += sortList2
    return result

def merge_sort(sortList):
    if len(sortList) <= 1:
        return arr
    mid = len(sortList) // 2
    return merge(merge_sort(sortList[:mid]), merge_sort(sortList[mid:]))

# 二分搜索
def binarySearch(sortList,left,right,x):
    if right >= left :
        mid = int(left + (right-left)/2)
        if sortList[mid] == x:
            return mid
        elif sortList[mid] >x:
            return binarySearch(sortList, left, mid-1, x) 
        else:
            return binarySearch(sortList, mid+1, right, x)
    else:
        return -1 


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

    print("--------------------二分搜索")
    sortList = list(range(15))
    print("原始数据：",sortList)
    startTime = time.perf_counter()
    result = binarySearch(sortList, 0, len(sortList)-1,10)
    endTime = time.perf_counter()
    print("查找结果:",result,' 花费时间：',endTime-startTime)
    print("-------------------- 结束\n")


    
        
    



