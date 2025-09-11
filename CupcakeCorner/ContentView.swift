//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Dmitry Kononov on 10.09.25.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    private var formDisabled: Bool {
        username.count < 5 || email.count < 5
    }
    
    
    var body: some View {
        Form {
            Section {
                TextField("User name", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Creata account") {
                    print("Creating account...")
                }
            }
            .disabled(formDisabled)
        }
    }
    
}

#Preview {
    ContentView()
}
