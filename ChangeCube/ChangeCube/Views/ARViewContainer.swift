//
//  ARViewContainer.swift
//  ChangeCube
//
//  Created by 홍승표 on 5/9/24.
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var cube: CubeModel
 
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let mesh = MeshResource.generateBox(size: Float(cube.size), cornerRadius: 0.005)
        let material = SimpleMaterial(color: UIColor(cube.color), roughness: 0.15, isMetallic: true)
        let model = ModelEntity(mesh: mesh, materials: [material])
        model.transform.translation.y = 0.05
        
        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
        anchor.children.append(model)
        
        arView.scene.anchors.append(anchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
        let mesh = MeshResource.generateBox(size: Float(cube.size), cornerRadius: 0.005)
        uiView.scene.anchors.first?.children.first?.components[ModelComponent.self]?.mesh = mesh
        
        uiView.scene.anchors.first?.children.first?.components[ModelComponent.self]?.materials[0] = SimpleMaterial(color: UIColor(cube.color), roughness: 0.15, isMetallic: true)
        
        uiView.scene.anchors.first?.children.first?.transform.translation.y = 0.05
        
        
    }
}

#Preview {
    ARViewContainer(cube: .constant(CubeModel(size: 0.1, color: .red)))
}
