//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by Иван Соколовский on 01.04.2020.
//  Copyright © 2020 Ivan Sokolovskii. All rights reserved.
//

import Foundation

struct Order: Codable {
    let name: String
    let coffeeName: String
    let total: Double
    let size: String
}
