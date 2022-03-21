'''
    队列
'''
class Queue(object):

    # 初始化 
    def __init__(self):
        self.__list = []

    #添加元素
    def push(self,element):
        self.__list.append(element)

    # 弹出元素
    def pop(self):
       if self.isEmpty():
           return None
       else:
           return self.__list.pop(0)

    #是否为空
    def isEmpty(self):
        return len(self.__list) == 0
    
    def getSize(self):
        return len(self.__list)
    
    def __str__(self):
       return " ".join(map(str, self.__list))

if __name__ == '__main__':
    testQueue = Queue();
    testQueue.push(1)
    testQueue.push(2)
    testQueue.push(3)
    testQueue.push(4)
    print(testQueue)  
    testQueue.pop()
    print(testQueue)  


    
        

