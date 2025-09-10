//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Dmitry Kononov on 10.09.25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
        
    }
    
}

#Preview {
    ContentView()
}
