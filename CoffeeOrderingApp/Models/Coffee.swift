//
//  Coffee.swift
//  CoffeeOrderingApp
//
//  Created by Иван Соколовский on 01.04.2020.
//  Copyright © 2020 Ivan Sokolovskii. All rights reserved.
//

import Foundation

struct Coffee {
    let name: String
    let imageUrl: String
    let price: Double
}

extension Coffee {
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuchino", imageUrl: "Cappuchino", price: 5.0),
            Coffee(name: "Espresso", imageUrl: "Espresso", price: 2.0),
            Coffee(name: "Americano", imageUrl: "Americano", price: 7.0)
        ]
    }
}
