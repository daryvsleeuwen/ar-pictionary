//
//  ContentView.swift
//  ArAppPoc
//
//  Created by Niels de Vreede on 09/12/2021.
//

import SwiftUI
import RealityKit
import ARKit

struct ArView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    let arView = ARView(frame: .zero)
    
    func makeCoordinator() -> Coordinator {
        Coordinator(arView: arView)
    }
    
    func makeUIView(context: Context) -> ARView {
        
        //
        //        let config = ARWorldTrackingConfiguration()
        //        config.isAutoFocusEnabled = true
        //
        //
        arView.session.delegate = context.coordinator
        //        arView.session.run(config, options: [])
        
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    class Coordinator: NSObject, ARSessionDelegate {
        
        let arView: ARView!
        
        init(arView: ARView){
            self.arView = arView
            
            let anchor = AnchorEntity(plane: .horizontal)
            let box = MeshResource.generateBox(size: 0.3) // Generate mesh
            let material = SimpleMaterial(color: .red, roughness: 0, isMetallic: true)
            let entity = ModelEntity(mesh: box, materials: [material]) // Create an entity from mesh
            anchor.addChild(entity)
            print(anchor.position)
            arView.scene.addAnchor(anchor)
            print("adding anchor")
        }
        
        
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            print("added anchor somehow")
            print(anchors)
        }
        
    }
    
}

#if DEBUG
struct ArView_Preview : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
