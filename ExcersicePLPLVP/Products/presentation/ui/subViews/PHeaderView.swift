//
//  PHeaderView.swift
//  ExcersicePLPLVP
//
//  Created by Juan Diego Garcia Serrano on 05/06/25.
//

import SwiftUI

struct PHeaderView
    <ContentLeft: View,
     ContentCenter: View,
     ContentRight: View,
     ContentBottom: View>: View {
    var viewLeft: () -> ContentLeft
    var viewCenter: () -> ContentCenter
    var viewRight: () -> ContentRight
    var viewBottom: () -> ContentBottom
    
    init(viewLeft: @escaping () -> ContentLeft, viewCenter: @escaping () -> ContentCenter, viewRight: @escaping () -> ContentRight, viewBottom: @escaping () -> ContentBottom) {
        self.viewLeft = viewLeft
        self.viewCenter = viewCenter
        self.viewRight = viewRight
        self.viewBottom = viewBottom
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 20.0) {
                HStack(spacing: 0.0) {
                    viewLeft()
                        .frame(width: geo.size.width / 3, alignment: .leading)
                    viewCenter()
                        .frame(width: geo.size.width / 3, alignment: .center)
                    viewRight()
                        .frame(width: geo.size.width / 3, alignment: .trailing)
                }
                
                viewBottom()
            }
            .frame(maxWidth: geo.size.width, maxHeight: .infinity)
            .fixedSize()
        }
    }
}

#Preview {
    PHeaderView(
        viewLeft: {
            Text("LEFT")
        },
        viewCenter: {
            Text("CENTER")
        }, viewRight: {
            Text("RIGHT ")
        }, viewBottom: {
            Text("BOTTOM")
        }
    )
}
