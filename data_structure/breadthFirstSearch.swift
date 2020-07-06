//
//  breadthFirstSearch.swift
//  prueba_command
//
//  Created by Asiel Cabrera on 7/6/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

extension Graph where Element: Hashable {
  
  func breadthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
    var queue = QueueStack<Vertex<Element>>()
    var enqueued: Set<Vertex<Element>> = []
    var visited: [Vertex<Element>] = []
    
    queue.enqueue(source)
    enqueued.insert(source)
    
    while let vertex = queue.dequeue() {
      visited.append(vertex)
      let neighborEdges = edges(from: vertex)
      neighborEdges.forEach { edge in
        if !enqueued.contains(edge.destination) {
          queue.enqueue(edge.destination)
          enqueued.insert(edge.destination)
        }
      }
    }
    
    return visited
  }
}
