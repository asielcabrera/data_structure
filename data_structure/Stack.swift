//
//  Stack.swift
//  prueba_command
//
//  Created by Asiel Cabrera on 7/5/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

public struct Stack<Element> {
    private var storage: [Element] = []
    public init(){}
    public init(_ elements: [Element]){
        storage = elements
    }
    public mutating func push(_ element: Element){
        storage.append(element)
    }
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    public var isEmpty: Bool {
        return peek() == nil
    }
}

extension Stack: CustomStringConvertible, ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...){
        storage = elements
    }
    
    public var description: String {
        let topDivider = "------top------\n"
        let bottomDivider = "\n------------------"
        let stactElements = storage
            .map{ "\($0)"}
        .reversed()
        .joined(separator: "\n")
        
        return topDivider + stactElements + bottomDivider
    }
    
}
