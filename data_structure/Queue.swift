//
//  queue.swift
//  prueba_command
//
//  Created by Asiel Cabrera on 7/5/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct QueueArray<T>: Queue {
    private var array: [T] = []
    public init(){}
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var peek:T? {
        return array.first
    }
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}


public class QueueLinkedList<T> : Queue {
    private var list = LinkedList<T>()
    public init(){}
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    public func dequeue() -> T? {
        guard !list.isEmpty else {
            return nil
        }
        return list.pop()
    }
    public var peek: T?{
        return list.head?.value
    }
    public var isEmpty: Bool {
        return list.isEmpty
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}

public struct QueueStack<T> {
  
  private var leftStack: [T] = []
  private var rightStack: [T] = []
  
  public init() {}
  
  public var isEmpty: Bool {
    leftStack.isEmpty && rightStack.isEmpty
  }
  
  public var peek: T? {
    !leftStack.isEmpty ? leftStack.last : rightStack.first
  }
  
  @discardableResult public mutating func enqueue(_ element: T) -> Bool {
    rightStack.append(element)
    return true
  }
  
  public mutating func dequeue() -> T? {
    if leftStack.isEmpty {
      leftStack = rightStack.reversed()
      rightStack.removeAll()
    }
    return leftStack.popLast()
  }
}
