//
//  CoffeeCellView.swift
//  CoffeeOrderingApp
//
//  Created by Иван Соколовский on 02.04.2020.
//  Copyright © 2020 Ivan Sokolovskii. All rights reserved.
//

import SwiftUI

struct CoffeeCellView: View {
    var coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageUrl)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
                .padding([.leading], 8)
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "")
                .padding(8)
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}

struct CoffeeCellView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeCellView(coffee: CoffeeViewModel(coffee: Coffee(name: "Espresso", imageUrl: "Espresso", price: 5.0)), selection: .constant("Espresso"))
    }
}
