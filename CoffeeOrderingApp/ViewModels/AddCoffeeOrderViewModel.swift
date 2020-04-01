//
//  AddCoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Иван Соколовский on 02.04.2020.
//  Copyright © 2020 Ivan Sokolovskii. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var coffeeService: CoffeeService
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.coffeeService = CoffeeService()
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        let order = Order(name: self.name, coffeeName: self.coffeeName, total: self.total, size: self.size)
        print(order)
        self.coffeeService.createCoffeeOrder(order: order) { _ in
            
        }
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeViewModel = coffeeList.first { $0.name == coffeeName }
        if let coffeeViewModel = coffeeViewModel {
            return coffeeViewModel.price + priceForSize()
        } else {
            return 0.0
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[self.size]!
    }
}
