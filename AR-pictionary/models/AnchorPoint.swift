//
//  AnchorPoint.swift
//  AR-pictionary
//
//  Created by Niels de Vreede on 12/01/2022.
//

import Foundation

struct AnchorPoint: Identifiable, Codable {
    let id: UUID
    var x: Float
    var y: Float
    var z: Float
    init(id: UUID = UUID(), x: Float, y: Float, z: Float ) {
        self.id = id
        self.x = x
        self.y = y
        self.z = z
    }
}
