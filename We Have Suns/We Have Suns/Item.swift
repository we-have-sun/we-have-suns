//
//  Item.swift
//  We Have Suns
//
//  Created by Natalia Terlecka on 18/02/2024.
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
