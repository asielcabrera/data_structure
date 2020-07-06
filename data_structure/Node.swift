//
//  Node.swift
//  prueba_command
//
//  Created by Asiel Cabrera on 7/5/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//


public class Node <Value> {
    
    var value: Value
    
    var next: Node?
    
    weak var previous: Node?
    
    public init(value: Value, next:Node? = nil) {
        self.value = value
        self.next = next
    }
    
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value)" + String(describing: next) + " "
    }
}
