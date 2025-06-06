//
//  ProductsScreen.swift
//  ExcersicePLPLVP
//
//  Created by Juan Diego Garcia Serrano on 05/06/25.
//

import SwiftUI

struct ProductsScreen: View {
    @StateObject private var viewModel: PProductsViewModel = PProductsViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0.0) {
                    ZStack {
                        Color.purpleLvp
                        PHeaderView(
                            viewLeft: {
                                NavigationLink {
                                    ContentView()
                                } label: {
                                    HStack {
                                        Image(systemName: "chevron.left")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20.0, height: 20.0, alignment: .leading)
                                            .foregroundStyle(Color.whiteLvp)
                                        
                                        Text("Atrás")
                                            .font(.system(size: 18.0,weight: .bold, design: .rounded))
                                            .foregroundStyle(Color.whiteLvp)
                                    }
                                }
                            }, viewCenter: {
                                Text("Productos")
                                    .font(.system(size: 20.0,weight: .bold, design: .rounded))
                                    .foregroundStyle(Color.whiteLvp)
                            }, viewRight: {
                                Button { [weak viewModel] in
                                    viewModel?.orderProducts()
                                } label: {
                                    ZStack {
                                        Color.whiteLvp.opacity(0.002)
                                        
                                        Text("Ordenar")
                                            .font(.system(size: 18.0,weight: .bold, design: .rounded))
                                            .foregroundStyle(Color.whiteLvp)
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                                .fixedSize()
                                
                            }, viewBottom: {
                                HStack(alignment: .center) {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20.0, height: 20.0, alignment: .center)
                                        .foregroundStyle(Color.whiteLvp)
                                    
                                    TextField("", text: $viewModel.searchText)
                                        .padding(8.0)
                                        .background(Color.whiteLvp)
                                        .cornerRadius(8.0)
                                        .frame(minWidth: geo.size.width / 2, alignment: .center)
                                }
                            }
                        )
                        .padding()
                    }
                    .frame(minWidth: 100.0)
                    .scaledToFit()
                    
                    if viewModel.products.isEmpty {
                        VStack {
                            Spacer()
                            Text("¡SIN PRODUCTOS!")
                                .font(.system(size: 20.0, weight: .bold, design: .rounded))
                                .foregroundStyle(Color.purpleLvp)
                                .font(.system(.callout))
                            
                            Spacer()
                        }
                    } else {
                        ScrollView(showsIndicators: false) {
                            LazyVStack {
                                ForEach(viewModel.filterProducts.indices, id: \.self) { element in
                                   UCardView(
                                        nameImage: viewModel.filterProducts[element].lgImage,
                                        nameProduct: viewModel.filterProducts[element].productDisplayName,
                                        originalPrice: viewModel.filterProducts[element].listPrice,
                                        discountedPrice: viewModel.filterProducts[element].promoPrice,
                                        availableColors: viewModel.filterProducts[element].variantsColor?.compactMap({ $0.colorHex })
                                    )
                                    Rectangle()
                                        .frame(maxWidth: .infinity, maxHeight: 0.9)
                                        .foregroundStyle(.gray.opacity(0.8))
                                }
                            }
                            .padding(.top)
                        }
                    }
                    
                }
                .onAppear { [weak viewModel] in
                    viewModel?.callGetProductsService()
                }
                .onDisappear { [weak viewModel] in
                    viewModel?.resetValues()
                }
                .fullScreenCover(isPresented: $viewModel.showLottie) {
                    ProgressView {
                        Text("...")
                            .foregroundStyle(Color.purpleLvp)
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
    ProductsScreen()
}
