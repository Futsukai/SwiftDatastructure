//
//  Stack.swift
//  SwiftDatastructure
//
//  Created by zhangwei on 2018/12/9.
//  Copyright © 2018年 Mr.Z. All rights reserved.
//

import Cocoa

protocol StackProtocol {
    associatedtype E
    var size:Int {get}
    func isEmpty() -> Bool
    func push(_ e:E)
    func pop() -> E?
    func peek() -> E?
}

class Stack<T>: StackProtocol,CustomDebugStringConvertible {
    var debugDescription: String{
        var res = "Stack: ["
        for (index,value) in arr.enumerated() {
            res += "\(value)"
            if index != arr.count - 1 {
                res += ", "
            }
        }
        res += "] top"
        return res
    }
    
    typealias E = T
    
    var size: Int {
        return 0
    }
    
    private var arr:[T] = []
    
    func isEmpty() -> Bool {
        return arr.isEmpty
    }
    
    func push(_ e: T) {
        arr.append(e)
    }
    
    func pop() -> T? {
        return arr.popLast()
    }
    
    func peek() -> T? {
        return arr.last
    }
    
    

}
