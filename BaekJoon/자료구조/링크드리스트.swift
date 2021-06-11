//
//  링크드리스트.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/09.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func 링크드리스트구현() {
    class Node<T> {
        var value: T
        var next: Node<T>?
        
        init(value: T, next: Node<T>?) {
            self.value = value
            self.next = next
        }
    }
    
    class LinkedList<T> {
        var head: Node<T>?
        var tail: Node<T>?
        
        init(head: Node<T>?) {
            self.head = head
            self.tail = head
        }
        
        func append(node: Node<T>) {
            if tail == nil {
                head = node
                tail = node
                return
            }
            
            tail?.next = node
            tail = node
        }
        
        func removeLast() {
            if head == nil {
                return
            }
            
            if head?.next == nil {
                head = nil
                return
            }
            
            var temp = head
            while temp?.next?.next != nil {
                temp = temp?.next
            }
            
            temp?.next = nil
            tail = temp
        }
    }
    
    let linkedList = LinkedList<Int>(head: nil)
    for i in 0..<10 {
        linkedList.append(node: Node(value: i, next: nil))
    }
    
    linkedList.removeLast()
    linkedList.removeLast()
    linkedList.removeLast()
    
    var temp = linkedList.head
    while temp != nil {
        print(temp?.value)
        temp = temp?.next
    }
    
    print(linkedList.tail?.value)
}
//링크드리스트구현()
