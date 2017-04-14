//
//  Node.swift
//  emoji-data-ios
//
//  Created by Maxime Bertheau on 4/12/17.
//  Copyright © 2017 Maxime Bertheau. All rights reserved.
//

import Foundation

class Node {
  var byte: UInt8
  var emojis: [Emoji] = []
  
  var children: [Node] = []
  weak var parent: Node?
  
  init(byte: UInt8) {
    self.byte = byte
  }
  
  func add(child: Node) {
    children.append(child)
    child.parent = self
  }
}
