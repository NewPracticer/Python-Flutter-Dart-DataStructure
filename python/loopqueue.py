'''
    循环队列
'''
class LoopQueue(object):

    def __init__(self, n=10):
        self.arr = [None] * (n)  
        self.front = 0
        self.tail = 0
        self.size = 0

    def getCapacity(self):
        capacity = len(self.arr) - 1;
        return capacity;

    def dequeue(self):
        if self.isEmpty() :
            raise Exception("Cannot dequeue from an empty queue")
        ret = self.arr[self.front]
        self.arr[self.front] = None
        self.front = (self.front + 1)%len(self.arr)
        self.size -=1
        if((self.size == self.getCapacity()//4)) and (self.getCapacity()/2 !=0):
            resize(self.getCapacity()//2)
        return ret

    def resize(self,newCapacity):
        newArr = [None]*(newCapacity+1)
        for i in range(0,len(self.arr)):
            newArr[i] = self.arr[(i+self.front)%len(self.arr)];
        self.arr = newArr
        self.front = 0;
        self.tail = self.size;
    
    def enqueue(self,element):
        print('当前大小:',self.size)
        if ((self.tail+1)%len(self.arr)) == self.front:
            self.resize(self.getCapacity()*2)
        self.arr[self.tail] = element
        self.tail = (self.tail +1)% len(self.arr)
        self.size += 1
        print('当前大小:',self.size)

    def getFront(self):
        if(self.isEmpty()):
            raise Exception("Queue is empty.")        
        return self.arr[self.front]

    def getSize(self):
        return len(self.arr)
    
    def isEmpty(self):
        return self.front == self.tail
        
    def __str__(self):
        return "front ["+" ".join(map(str, self.arr)) + "] tail"

if __name__ == '__main__':
    loopQueue = LoopQueue();
    for i in range(0,30):
        loopQueue.enqueue(i);
        print(loopQueue)

      
      