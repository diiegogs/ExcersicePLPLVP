//
//  UCardView.swift
//  ExcersicePLPLVP
//
//  Created by Juan Diego Garcia Serrano on 05/06/25.
//

import SwiftUI

public struct UCardView: View {
    private var nameImage: String
    private var nameProduct: String
    private var originalPrice: Double
    private var discountedPrice: Double?
    private var availableColors: [String]?
    
    public init(
        nameImage: String,
        nameProduct: String,
        originalPrice: Double,
        discountedPrice: Double? = nil,
        availableColors: [String]? = nil) {
            self.nameImage = nameImage
            self.nameProduct = nameProduct
            self.originalPrice = originalPrice
            self.discountedPrice = discountedPrice
            self.availableColors = availableColors
        }
    
    public var body: some View {
        HStack(spacing: 6.0) {
            VStack(alignment: .leading, spacing: 0.0) {
                
                AsyncImage(url: URL(string: nameImage)) { phase in
                    if let img = phase.image {
                        img
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100.0, height: 100.0)
                    } else if let _ = phase.error {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80.0, height: 100.0)
                            .foregroundStyle(.gray.opacity(0.8))
                            .padding()
                    } else {
                        ProgressView()
                            .scaledToFit()
                            .frame(width: 100.0, height: 100.0)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 0.0) {
                Text(nameProduct)
                    .font(.system(size: 18.0, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.black)
                    .fixedSize(horizontal: false, vertical: true)
                
                if let discountedPrice, (discountedPrice < originalPrice) {
                    ZStack {
                        Rectangle()
                            .frame(height: 1.0)
                            .foregroundStyle(.gray)
                            .offset(y: 1.0)
                        
                        Text(originalPrice, format: .currency(code: "MXN"))
                            .font(.system(size: 12.0, weight: .bold, design: .rounded))
                            .foregroundStyle(.gray)
                    }
                    .fixedSize()
                    
                    Text(discountedPrice, format: .currency(code: "MXN"))
                        .font(.system(size: 12.0, weight: .bold, design: .rounded))
                        .foregroundStyle(.red)
                        .padding(.top)
                } else {
                    Text(originalPrice, format: .currency(code: "MXN"))
                        .font(.system(size: 12.0, weight: .bold, design: .rounded))
                        .foregroundStyle(.red)
                        .padding(.top)
                }
                
                if let colors = availableColors, availableColors?.isEmpty == false {
                    HStack(spacing: 6.0) {
                        ForEach(colors.indices, id: \.self) { color in
                            Ellipse()
                                .fill(Color(hex: colors[color]) ?? Color.black)
                                .frame(width: 15.0, height: 12.0)
                                .overlay{
                                    Ellipse()
                                        .stroke(.black, lineWidth: 1.0)
                                }
                        }
                    }
                    .padding(.all, 5.0)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .scaledToFit()
    }
}

#Preview {
    UCardView(
        nameImage: "https://ss423.liverpool.com.mx/sm/1177646331.jpg",
        nameProduct: "Protector solar FPS 50+ fotoprotector invisible stick Isdin 10 g",
        originalPrice: 14_899.8,
        discountedPrice: 14_899.2,
        availableColors: ["pinkLvp"]
    )
}
