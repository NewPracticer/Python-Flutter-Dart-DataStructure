class Node(object):
    
    def __init__(self,value):
        self.value = value;
        self.next = None;
    
    def __str__(self):
        return self.value;

'''
    链表
'''
class LinkedList(object):

    def __init__(self):
        self.head = None
        self.size = 0
        
    def getSize(self):
        return self.size
    
    def isEmpty(self):
        return self.size == 0;
    
    #头部添加元素
    def add(self, value):
        node = Node(value)
        node.next = self.head
        self.head = node
        self.size +=1

    # 尾部添加元素
    def append(self, value):
        node = Node(value)
        if self.isEmpty():
            self.head = node
        else:
            cur = self.head
            while cur.next != None:
                cur = cur.next
            cur.next = node
        self.size +=1
    
    # 指定位置添加元素
    def insert(self, pos, value):
        if pos <= 0:
            self.add(value)
        elif pos > self.size:
            self.append(value)
        else:
            node = Node(value)
            count = 0
            pre = self.head
            while count < (pos-1):
                count += 1
                pre = pre.next
            node.next = pre.next
            pre.next = node
            self.size +=1 
    
    # 删除节点
    def remove(self,value):
        cur = self.head
        pre = None
        isFind = False
        while cur != None:
            if cur.value == value:
                if not pre:
                    self.head = cur.next
                else:
                    pre.next = cur.next
                self.size -=1
                isFind = True
                break
            else:
                pre = cur
                cur = cur.next
        return isFind

    # 查找节点是否存在     
    def search(self,value):
        cur = self.head
        while cur != None:
            if cur.value == value:
                return True
            cur = cur.next
        return False

        








