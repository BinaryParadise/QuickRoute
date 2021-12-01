//
//  BinaryTree.swift
//  
//
//  Created by Rake Yang on 2021/11/30.
//

import Foundation

/// 经典二叉树
class RouteNode {
    var handler: RouteHandler?
    var children: [String : RouteNode] = [:]
    
    init(_ handler: RouteHandler? = nil) {
        self.handler = handler
    }
    
    subscript(key: String) -> RouteNode {
        get {
            if let node = children[key] {
                return node
            }
            let node = RouteNode()
            children[key] = node
            return node
        }
        set {
            children[key] = newValue
        }
    }
}
