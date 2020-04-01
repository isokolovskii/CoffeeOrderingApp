//
//  CoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Иван Соколовский on 02.04.2020.
//  Copyright © 2020 Ivan Sokolovskii. All rights reserved.
//

import Foundation

struct CoffeeViewModel {
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var imageUrl: String {
        return self.coffee.imageUrl
    }
    
    var price: Double {
        return self.coffee.price
    }
}
