import SwiftUI
import SocketIO
import RealityKit
import ARKit
import FocusEntity


let manager = SocketManager(socketURL: URL(string: "http://192.168.178.61:1080")!, config: [.log(false), .compress])
let socket = manager.defaultSocket
let ArContainerView = ARViewContainer()

struct GamePage: View {
    @ObservedObject var user: User
    @Binding var currentNav: String
    @ObservedObject var gameConfig: GameConfig = GameConfig()
    @State var started: Bool = false
    @State var currentDrawColor: Color = Color.black
    @State var currentTool: String = "pencil"
    let decoder = JSONDecoder()
    
    
    init(user: User, currentNav: Binding<String>){
        self.user = user
        self._currentNav = currentNav
        initSocketEvents()
    }
    
    func initSocketEvents(){
        socket.on(clientEvent: .connect) {data, ack in
            socket.emit("search_opponent", [user.name, user.id.uuidString])
        }
        
        socket.on("game_created") {data, ack in
            guard let json = data[0] as? String else { return }
            
            if let jsonString = json.data(using: .utf8){
                do{
                    let gameData = try decoder.decode(StarterGameConfig.self, from: jsonString)
                    let opponent: Player = gameData.players[0].name == user.name ? gameData.players[1] : gameData.players[0]
                    gameConfig.parseStarterData(data: gameData, opp: opponent)
                }
                catch{
                    print(error)
                }
            }
        }
        
        socket.on("time_decrease") { data, ack in
            guard let timeRemaining = data[0] as? Int else { return }
            gameConfig.timeRemaining = Double(timeRemaining)
        }
        
        socket.on("game_deleted") { data, ack in
            print("Player disconnected or leaved. Routing back to home")
            currentNav = "home"
        }
        
        socket.connect()
    }
    
    func renderLoadingScreen() -> some View{
        return VStack(alignment: .center){
            CText(text: "Zoeken naar een tegenstander...", font: "Bold", size: 32, color: "pOrange", alignment: .center).lineSpacing(8).padding(.bottom, 30).frame(width: 300)
            CButton(callback: {
                //Remove user from game  queue in backend and route back to HomePage
                currentNav = "home"
            }, label: "Annuleren", width: 250)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func renderGameScreen() -> some View{
        return ZStack{
            VStack{
                ArContainerView
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack{
                VStack(spacing: 8){
                    CText(text: "Score", font: "Bold", size: 22, color: "pWhite", alignment: .center).padding(.bottom, 2)
                    HStack(alignment: .bottom, spacing: 0){
                        CText(text: user.name, font: "Regular", size: 21, color: "pWhite", alignment: .center)
                        CText(text: "\(gameConfig.userScore) : \(gameConfig.opponentScore)", font: "Bold", size: 26, color: "pWhite", alignment: .center).padding(.leading, 18).padding(.trailing, 18)
                        //                        CText(text: gameConfig.opponent!.name, font: "Regular", size: 21, color: "pWhite", alignment: .center)
                    }
                    HStack(alignment: .center){
                        GeometryReader(){ reader in
                            let timerWidth = CGFloat(gameConfig.timeRemaining / gameConfig.timeLimitInSeconds * reader.size.width)
                            
                            ZStack(alignment: .trailing){
                                RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1.5)
                                RoundedRectangle(cornerRadius: 10).fill(Color(.white)).frame(width: timerWidth, height: 6)
                            }
                        }.frame(maxWidth: .infinity, maxHeight: 6)
                        CText(text: "\(Int(gameConfig.timeRemaining))sec", font: "Bold", size: 16, color: "pWhite").padding(.top, 2)
                    }
                }.padding().frame(maxWidth: .infinity).background(BackgroundGradient).cornerRadius(12)
                Spacer()
                VStack{
                    if let turn = gameConfig.currentPlayerTurn {
                        if(turn == user.id.uuidString){
                            //Render draw bottom controls
                            VStack( alignment: .leading, spacing: 0){
                                CText(text: "Teken een \(gameConfig.guessableWord)", font: "Bold", size: 21, color: "pWhite").padding(.bottom, 15)
                                HStack{
                                    HStack(spacing: 8){
                                        ForEach(0..<6){index in
                                            let color = gameConfig.drawColors[index]
                                            
                                            Button(action: {
                                                currentDrawColor = color
                                            }, label: {
                                                if(color == currentDrawColor){
                                                    ZStack{
                                                        Circle().fill(Color("pBlack")).frame(width: 34, height: 34)
                                                        Circle().strokeBorder(Color.white, lineWidth: 2).background(Circle().fill(color)).frame(width: 30, height: 30)
                                                    }
                                                }
                                                else{
                                                    Circle().fill(color).frame(width: 30, height: 30)
                                                }
                                            })
                                        }
                                    }.padding(10).background(Color.white).cornerRadius(12)
                                    Spacer()
                                    HStack{
                                        let pencilIndicatorWidth: CGFloat = currentTool == "pencil" ? 25: 0
                                        let eraserIndicatorWidth: CGFloat = currentTool == "eraser" ? 25: 0
                                        
                                        VStack{
                                            Button(action: {
                                                currentTool = "pencil"
                                            }, label: {
                                                Image("brush")
                                            })
                                            Spacer()
                                            RoundedRectangle(cornerRadius: 10).fill(Color.white).frame(width: pencilIndicatorWidth, height: 3).animation(Animation.timingCurve(0.09, 0.66, 0.26, 0.88, duration: 0.3), value: pencilIndicatorWidth)
                                        }.frame(height: 42).padding(.trailing, 6)
                                        
                                        VStack{
                                            Button(action: {
                                                currentTool = "eraser"
                                            }, label: {
                                                Image("eraser")
                                            })
                                            
                                            Spacer()
                                            RoundedRectangle(cornerRadius: 10).fill(Color.white).frame(width: eraserIndicatorWidth, height: 3).animation(Animation.timingCurve(0.09, 0.66, 0.26, 0.88, duration: 0.3), value: eraserIndicatorWidth)
                                        }.frame(height: 42)
                                        
                                    }
                                }
                            }
                        }else{
                            //Render guess bottom controls
                            VStack(spacing: 0){
                                
                            }
                        }
                    }
                }.padding().frame(maxWidth: .infinity).background(BackgroundGradient).cornerRadius(12)
            }.frame(maxWidth: .infinity, maxHeight: .infinity).padding(.top, 60).padding(.bottom, 30).padding(.leading, 30).padding(.trailing, 30)
        }
    }
    
    var body: some View {
        VStack(){
            if(gameConfig.started){
                renderGameScreen()
            }
            else{
                renderLoadingScreen()
            }
            Spacer()
        }.ignoresSafeArea()
    }
}

struct ARViewContainer: UIViewRepresentable {
    let arView = ARView(frame: .zero)
    
    func makeCoordinator() -> Coordinator {
        Coordinator(arView: arView)
    }
    
    func makeUIView(context: Context) -> ARView {
        print("Making UIView...")
        arView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        
        arView.session.delegate = context.coordinator
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    class Coordinator: NSObject, ARSessionDelegate {
        
        let arView: ARView!
        var focusEntity: FocusEntity?
        let jsonEncoder = JSONEncoder()
        
        init(arView: ARView){
            self.arView = arView
            
            //            let anchor = AnchorEntity()
            //            let box = ModelEntity(
            //                  mesh: MeshResource.generateBox(size: 0.05),
            //                  materials: [SimpleMaterial(color: .red, isMetallic: true)]
            //                )
            //
            //            anchor.addChild(box)
            //            arView.scene.addAnchor(anchor)
            //            box.transform.translation = [0, 0, -1]
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
            //newEntity.position = focusEntity.position
            
            let anchorPoint = AnchorPoint(x: newEntity.position.x, y: newEntity.position.y, z: newEntity.position.z)
            let jsonData = try! jsonEncoder.encode(anchorPoint)
            let json = String(data: jsonData, encoding: .utf8)
            socket.emit("new_anchor", [json])
            
            anchor.addChild(newEntity)
        }
    }
}

//struct GamePage_Previews: PreviewProvider {
//    static var user = User(name: "Dary", amountOfCoins: 136, currentLevel: 23, currentXp: 272)
//    static var previews: some View {
//        GamePage(user: user)
//    }
//}
