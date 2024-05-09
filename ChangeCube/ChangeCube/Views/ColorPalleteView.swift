//
//  ColorPalleteView.swift
//  ChangeCube
//
//  Created by 홍승표 on 5/9/24.
//

import SwiftUI

struct ColorPalleteView: View {
    @Binding var cube: CubeModel
    @State private var selectedColor: Color = ColorOptions.default
    var body: some View {
        VStack(alignment: .trailing) {
            ForEach(ColorOptions.all, id: \.self) { color in
                if color == .white {
                    Circle()
                        .stroke(Color.black, lineWidth: 1)
                        .fill(color)
                        .onTapGesture {
                            selectedColor = color
                            cube.color = color
                        }
                } else {
                    Circle()
                        .foregroundStyle(color)
                        .onTapGesture {
                            selectedColor = color
                            cube.color = color
                        }
                }
            }
            .frame(width: 40)
        }
        .background(Color.clear)
    }
}

#Preview {
    ColorPalleteView(cube: .constant(CubeModel(size: 0.1, color: .red)))
}
