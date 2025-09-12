//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Dmitry Kononov on 12.09.25.
//

import SwiftUI

struct CheckoutView: View {
    @Bindable var order: Order
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total cost is: \(order.cost, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    .font(.title)
                
                Button("Place Order", action: {})
                    .padding()
            }
        }
        .navigationTitle("Chech out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    CheckoutView(order: Order())
}
