//
//  AddCoffeeOrderView.swift
//  CoffeeOrderingApp
//
//  Created by Иван Соколовский on 02.04.2020.
//  Copyright © 2020 Ivan Sokolovskii. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderViewModel = AddCoffeeOrderViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter name", text: self.$addCoffeeOrderViewModel.name)
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        ForEach(addCoffeeOrderViewModel.coffeeList, id:\.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderViewModel.coffeeName)
                        }
                    }
                    
                    Section(header: Text("SELECT SIZE").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderViewModel.total)) {
                        Picker("", selection: self.$addCoffeeOrderViewModel.size) {
                            Text("Small")
                                .tag("Small")
                            Text("Medium")
                                .tag("Medium")
                            Text("Large")
                                .tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack {
                    Button("Place order") {
                        self.addCoffeeOrderViewModel.placeOrder()
                        self.isPresented = false
                    }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                        .foregroundColor(.white)
                        .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}
