//
//  Item.swift
//  Rustic
//
//  Created by Ratul Hasan Ruhan on 31/5/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
