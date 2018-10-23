//
//  LinkedList.swift
//  SwiftDatastructure
//
//  Created by zhangwei on 2018/10/24.
//  Copyright © 2018年 Mr.Z. All rights reserved.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?
    init(data: T) {
        self.data = data
    }
}

// CustomStringConvertible 自定义对象的输出协议
class LinkedList<T>: CustomStringConvertible{
    var head: Node<T>?
    var tail: Node<T>?
    var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.data)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }

    
    func addAtHead(val: T){
        if head == nil{
            head = Node(data: val)
            tail = head
        }else{
            let temp = Node(data: val)
            temp.next = head
            head = temp
        }
    }
    
    func addAtTail(val: T){
        if tail == nil {
            tail = Node(data: val)
            head = tail
        }else{
            tail?.next = Node(data: val)
            tail = tail?.next
        }
    }
    
    func addAtIndex(index:Int,val:T) -> Bool {
        var j = 0
        if index == j {
            addAtHead(val: val)
            return true
        }
        let addNode = Node(data: val)
        var tempNode = head
        while tempNode != nil{
            if j == index - 1{
                addNode.next = tempNode?.next
                tempNode?.next = addNode
                return true
            }
            tempNode = tempNode?.next
            j += 1
        }
        if  j == index {
            addAtTail(val: val)
            return true
        }
        return false
    }
    
    func get(index:Int) -> T? {
        var temp = head
        var j = 0
        while temp != nil && j < index{
            temp = temp?.next
            j += 1
        }
        if temp == nil || j > index{
            return nil
        }
        return (temp?.data)!
    }
    
    func deleteAtIndex(index:Int){
        var temp = head
        var j = 0
        if index == 0 {
            head = temp?.next
        }else{
            while temp != nil && j < index - 1{
                temp = temp?.next
                j += 1
            }
            if temp != nil {
                let delNode = temp?.next
                temp?.next = delNode?.next
            }
        }
    }
}


