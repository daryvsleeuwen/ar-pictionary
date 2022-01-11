//
//  ContentView.swift
//  ArAppPoc
//
//  Created by Niels de Vreede on 09/12/2021.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

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
        arView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        
        arView.session.delegate = context.coordinator
        //        arView.session.run(config, options: [])
        
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    class Coordinator: NSObject, ARSessionDelegate {
        
        let arView: ARView!
        var focusEntity: FocusEntity?
        
        init(arView: ARView){
            self.arView = arView
            
            let anchor = AnchorEntity()
            let box = ModelEntity(
                  mesh: MeshResource.generateBox(size: 0.05),
                  materials: [SimpleMaterial(color: .red, isMetallic: true)]
                )
            
            anchor.addChild(box)
            arView.scene.addAnchor(anchor)
            box.transform.translation = [0, 0, -1]

            
            let anchor2 = AnchorEntity(.camera)
            let box2 = MeshResource.generateBox(size: 0.01) // Generate mesh
            let material2 = SimpleMaterial(color: .blue, roughness: 0, isMetallic: true)
            let entity2 = ModelEntity(mesh: box2, materials: [material2]) // Create an entity from mesh
            anchor2.position.y = 1
            anchor.addChild(entity2)
            arView.scene.addAnchor(anchor2)
        }
        
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            print(anchors)
            self.focusEntity = FocusEntity(on: arView, style: .classic(color: .yellow))
        }
        
        
        @objc func handleTap() {
            guard let view = self.arView, let focusEntity = self.focusEntity else { return }

            // Create a new anchor to add content to
            let anchor = AnchorEntity()
            view.scene.anchors.append(anchor)

            // Add a Box entity with a blue material
            let box = MeshResource.generateSphere(radius: 0.01)
            let material = SimpleMaterial(color: .blue, isMetallic: true)
            let newEntity = ModelEntity(mesh: box, materials: [material])
            newEntity.position = focusEntity.position

            anchor.addChild(newEntity)
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
