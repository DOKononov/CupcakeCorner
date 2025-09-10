//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Dmitry Kononov on 10.09.25.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results: [Result] = []
    
    var body: some View {
        List(results, id: \.trackId ) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalide url")
            return
        }
        
        do {
            let (data, _ ) = try await URLSession.shared.data(from: url)
            
            do {
                let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                results = decodedResponse.results
            } catch {
                print("❌ Ошибка декодирования: \(error)")
            }
            
        } catch {
            print("Invalide data")
        }
    }
}

#Preview {
    ContentView()
}
