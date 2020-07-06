//
//  PriorityQueue.swift
//  prueba_command
//
//  Created by Asiel Cabrera on 7/6/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

struct PriorityQueue<Element: Equatable>: Queue {
  
  private var heap: Heap<Element>
  
  init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
    heap = Heap(sort: sort, elements: elements)
  }
  
  var isEmpty: Bool {
    heap.isEmpty
  }
  
  var peek: Element? {
    heap.peek()
  }
  
  mutating func enqueue(_ element: Element) -> Bool {
    heap.insert(element)
    return true
  }
  
  mutating func dequeue() -> Element? {
    heap.remove()
  }
}

//var priorityQueue = PriorityQueue(sort: >, elements: [1,12,3,4,1,6,8,7])
//while !priorityQueue.isEmpty {
//  print(priorityQueue.dequeue()!)
//}
