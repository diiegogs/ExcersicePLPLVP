//
//  ContentView.swift
//  ExcersicePLPLVP
//
//  Created by Juan Diego Garcia Serrano on 05/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                Color.purpleLvp
                VStack {
                    ZStack {
                        Color.white.opacity(0.002)
                        NavigationLink {
                            ProductsScreen()
                        } label: {
                            HStack {
                                Text("Obtén productos")
                                    .font(.system(size: 20.0, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white)
                                ZStack {
                                    Circle()
                                        .foregroundStyle(.white)
                                        .frame(width: 40.0, height: 40.0, alignment: .center)
                                    
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(Color.purpleLvp)
                                        .frame(width: 20.0, height: 100.0, alignment: .center)
                                }
                            }
                        }
                    }
                }
                
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

#Preview {
    ContentView()
}
