//
//  main.swift
//  SwiftDatastructure
//
//  Created by zhangwei on 2018/10/24.
//  Copyright © 2018年 Mr.Z. All rights reserved.
//

import Foundation

var testList = LinkedList<Int>()
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

