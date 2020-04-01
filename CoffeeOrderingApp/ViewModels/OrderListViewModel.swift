//
//  OrderListViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Иван Соколовский on 01.04.2020.
//  Copyright © 2020 Ivan Sokolovskii. All rights reserved.
//

import Foundation

class OrderListViewModel: ObservableObject {
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        CoffeeService().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}
