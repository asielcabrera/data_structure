// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class Prim<T: Hashable> {
  
  public typealias Graph = AdjacencyList<T>
  public init() {}
  
  public func produceMinimumSpanningTree(for graph: Graph) -> (cost: Double, mst: Graph) {
    var cost = 0.0
    let mst = Graph()
    var visited: Set<Vertex<T>> = []
    var priorityQueue = PriorityQueue<Edge<T>>(sort: {
      $0.weight ?? 0.0 < $1.weight ?? 0.0
    })

    mst.copyVertices(from: graph)
    
    guard let start = graph.vertices.first else {
      return (cost: cost, mst: mst)
    }
    
    visited.insert(start)
    addAvailableEdges(for: start, in: graph, check: visited, to: &priorityQueue)
    
    while let smallestEdge = priorityQueue.dequeue() {
      let vertex = smallestEdge.destination
    
      guard !visited.contains(vertex) else {
        continue
      }
      
      visited.insert(vertex)
      cost += smallestEdge.weight ?? 0.0
      mst.add(.undirected, from: smallestEdge.source, to: smallestEdge.destination, weight: smallestEdge.weight)
    
      addAvailableEdges(for: vertex, in: graph, check: visited, to: &priorityQueue)
    }
    
    return (cost: cost, mst: mst)
  }

  internal func addAvailableEdges(for vertex: Vertex<T>,
                                  in graph: Graph,
                                  check visited: Set<Vertex<T>>,
                                  to priorityQueue: inout PriorityQueue<Edge<T>>) {
    for edge in graph.edges(from: vertex) {
      if !visited.contains(edge.destination) {
        priorityQueue.enqueue(edge)
      }
    }
  }
}


//var graph = AdjacencyList<Int>()
//let one = graph.createVertex(data: 1)
//let two = graph.createVertex(data: 2)
//let three = graph.createVertex(data: 3)
//let four = graph.createVertex(data: 4)
//let five = graph.createVertex(data: 5)
//let six = graph.createVertex(data: 6)
//
//graph.add(.undirected, from: one, to: two, weight: 6)
//graph.add(.undirected, from: one, to: three, weight: 1)
//graph.add(.undirected, from: one, to: four, weight: 5)
//graph.add(.undirected, from: two, to: three, weight: 5)
//graph.add(.undirected, from: two, to: five, weight: 3)
//graph.add(.undirected, from: three, to: four, weight: 5)
//graph.add(.undirected, from: three, to: five, weight: 6)
//graph.add(.undirected, from: three, to: six, weight: 4)
//graph.add(.undirected, from: four, to: six, weight: 2)
//graph.add(.undirected, from: five, to: six, weight: 6)
//
//let (cost,mst) = Prim().produceMinimumSpanningTree(for: graph)
//print("cost: \(cost)")
//print("mst:")
//print(mst)

