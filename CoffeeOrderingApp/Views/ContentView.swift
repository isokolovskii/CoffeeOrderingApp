//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Иван Соколовский on 01.04.2020.
//  Copyright © 2020 Ivan Sokolovskii. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListViewModel = OrderListViewModel()
    @State private var showModal = false
    
    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListViewModel.orders)
            
            .navigationBarTitle("Coffee Orders")
            .navigationBarItems(leading: Button(action: reloadOrders) {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.white)
            }, trailing: Button(action: showAddCoffeeOrderView) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
            })
            .sheet(isPresented: $showModal, onDismiss: reloadOrders) {
                AddCoffeeOrderView(isPresented: self.$showModal)
            }
        }
    }
    
    private func reloadOrders() {
        self.orderListViewModel.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
