//
//  ContentView.swift
//  facetest2
//
//  Created by Rui Da Silva on 30/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    
    var body: some View {
        if isAuthenticated {
            // Main app content
            VStack {
                Text("Welcome to the App!")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()
                
                Text("You've successfully authenticated!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Button(action: {
                    isAuthenticated = false
                }) {
                    Text("Lock App")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
        } else {
            AuthView(isAuthenticated: $isAuthenticated)
        }
    }
}

#Preview {
    ContentView()
}
