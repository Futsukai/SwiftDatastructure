//
//  Queue.swift
//  SwiftDatastructure
//
//  Created by zhangwei on 2019/1/6.
//  Copyright © 2019年 Mr.Z. All rights reserved.
//

import Cocoa


protocol QueueProtocol {
    associatedtype E
    var size:Int {get}
    func isEmpty() -> Bool
    func enqueue(_ e:E)
    func dequeue() -> E?
    func getFront() -> E?
}

//FIFO 先进先出
class Queue<T>: QueueProtocol, CustomDebugStringConvertible {
    
    var debugDescription: String{
        var res = "Queue: front ["
        for (index,value) in array.enumerated() {
            res += "\(value)"
            if index != array.count - 1 {
                res += ", "
            }
        }
        res += "] tail"
        return res
    }
    
    private var array:[T] = []
    
    typealias E = T
    
    var size: Int {
        return array.count
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    func enqueue(_ e: T) {
        array.append(e)
    }
    
    func dequeue() -> T? {
        return array.removeFirst()
    }
    
    func getFront() -> T? {
        return array.first
    }
    
}

