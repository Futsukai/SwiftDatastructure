//
//  LoopQueue.swift
//  SwiftDatastructure
//
//  Created by zhangwei on 2019/1/12.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

import Cocoa

class LoopQueue<E>: QueueProtocol {
    private var data: [E?]
    private var front, tail: Int
    private( set ) var size: Int
    
    init(capacity: Int) {
        data = [E?].init(repeating: nil, count: capacity + 1)
        front = 0
        tail = 0
        size = 0
    }
    
    convenience init() {
        self.init(capacity: 10)
    }
    
    func isEmpty() -> Bool {
        return front == tail
    }
    
    func enqueue(_ e: E) {
        if checkQueueIsFull() {
            resize(newCapacity: getCapacity() * 2)
        }
        data[tail] = e
        tail = (tail + 1) % data.count
        size += 1
    }
    
    func dequeue() -> E? {
        if isEmpty() {
            return nil
        }
        let ret = data[front]
        data[front] = nil
        front = (front + 1) % data.count
        size -= 1
        if size == getCapacity() / 4 {
            resize(newCapacity: getCapacity() / 2)
        }
        return ret
    }
    
    func getFront() -> E? {
        if isEmpty() {
            return nil
        }
        return data[front]
    }
    
    func getCapacity() -> Int {
        return data.count - 1
    }
    
    private func checkQueueIsFull() -> Bool {
        return (tail + 1) % data.count == front
    }
    
    private func resize(newCapacity: Int) {
        if newCapacity > data.count {
            debugPrint("up count")
        } else {
            debugPrint("down count")
        }
        if newCapacity == 0 {
            debugPrint("can't to be zero")
            return
        }
        var temp = [E?].init(repeating: nil, count: newCapacity + 1)
        for i in 0..<size {
            temp[i] = data[(i + front) % data.count]
        }
        data = temp
        front = 0
        tail = size
    }
    
    
}

extension LoopQueue: CustomStringConvertible{
    var description: String{
        var res = "<Queue: size:\(size) capacity:\(getCapacity())\nfront ["
        for var i in front..<data.count {
            res += "\(String(describing: data[i]))"
            i = (i + 1) % data.count
            if  i != tail {
                res += ","
            } else {
                break
            }
        }
        res += "] tail>"
        print("real data\n*\(data)*")
        return res
    }
}
