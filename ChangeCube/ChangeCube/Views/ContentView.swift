//
//  ContentView.swift
//  ChangeCube
//
//  Created by 홍승표 on 5/9/24.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State private var cubeModel = CubeModel(size: 0.1)
    var body: some View {
            ZStack {
                ARViewContainer(cube: $cubeModel)
                HStack {
                       Spacer()
                       ColorPalleteView(cube: $cubeModel)
                           .padding(.horizontal)
                   }
            }
        Slider(value: $cubeModel.size, in: 0.05...0.2, step: 0.01)
            .padding()
    }
}



#Preview {
    ContentView()
}
