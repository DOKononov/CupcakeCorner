//
//  Order.swift
//  CupcakeCorner
//
//  Created by Dmitry Kononov on 12.09.25.
//

import Foundation

@Observable
final class Order {
    static let types = ["Vanilla", "Chocolate", "Strawberry", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specilaRequestEnabled = false {
        didSet {
            if specilaRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
