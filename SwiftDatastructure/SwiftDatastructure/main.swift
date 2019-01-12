//
//  main.swift
//  SwiftDatastructure
//
//  Created by zhangwei on 2018/10/24.
//  Copyright © 2018年 Mr.Z. All rights reserved.
//

import Foundation

func testOne() {
    let testList = LinkedList<Int>()
    testList.addAtHead(val: 1)
    testList.addAtTail(val: 3)
    for i in 0..<100{
        _ = testList.addAtIndex(index: i, val: i)
    }
    print(testList)
    for i in 0..<100{
        testList.deleteAtIndex(index: i)
    }
    print(testList)
}

func testStack() {
    
    let stack = Stack<String>()
    
    for i in 0..<10 {
        stack.push(String(i))
    }
    print(stack)
    
    
}



func testQueue() {
    
    let queue = Queue<String>()
    
    for i in 0..<10 {
        queue.enqueue(String(i))
    }
    print(queue)
    
}


func testLoopQueue() {
    let loopQueue = LoopQueue<String>()

    for i in 0..<11 {
        loopQueue.enqueue(String(i))
    }
    for _ in 0..<6 {
        _  = loopQueue.dequeue()
    }
    for i in 0..<11 {
        loopQueue.enqueue(String(i))
    }
    print(loopQueue)
    
}

testLoopQueue()
