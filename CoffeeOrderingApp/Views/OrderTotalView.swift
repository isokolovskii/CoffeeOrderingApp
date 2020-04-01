//
//  OrderTotalView.swift
//  CoffeeOrderingApp
//
//  Created by Иван Соколовский on 02.04.2020.
//  Copyright © 2020 Ivan Sokolovskii. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "%.2f$", self.total))
                .font(.title)
                .foregroundColor(.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.67)
    }
}
