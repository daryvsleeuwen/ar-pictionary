import SwiftUI

struct GamePage: View {
    @ObservedObject var user: User
    @ObservedObject var gameConfig: GameConfig
    @State var currentDrawColor: Color = Color.black
    
    init(user: User){
        self.user = user
        self.gameConfig = GameConfig()
        searchOpponent()
    }
    
    func renderLoadingScreen() -> some View{
        return VStack(alignment: .center){
            CText(text: "Zoeken naar een tegenstander...", font: "Bold", size: 32, color: "pOrange", alignment: .center).lineSpacing(8).padding(.bottom, 30)
            CButton(callback: {
                //Remove user from game  queue in backend and route back to HomePage
                print("Custom Button Clicked")
            }, label: "Annuleren", width: 250)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func searchOpponent() {
        //Get new gameID from backend with according opponent user
        let gameID = UUID()
        
        //Get from backend queue instead of hardcoded new User
        let searchedOpponent = User(name: "Niels")
        
        //Determine random player starter by selecting random value from array
        let starter = [user.id, searchedOpponent.id].randomElement()!
        
        gameConfig.gameID = gameID
        gameConfig.opponent = searchedOpponent
        
        //Always using current user.id as starter for development purposes. Later use random starter variable
        gameConfig.currentPlayerTurn = user.id //Use starter var in production
        gameConfig.opponentFounded = true
        //Pick random word from array of game words. Now setting to static word
        gameConfig.guessableWord = "Boerderij"
    }
    
    func cancelGame(){
        //TODO - route back to main screen/home
    }
    
    func renderGameScreen() -> some View{
        return ZStack{
            //VStack for ARView replacement for testing purposes
            VStack{
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color(.white))
            VStack{
                VStack(spacing: 8){
                    CText(text: "Score", font: "Bold", size: 22, color: "pWhite", alignment: .center).padding(.bottom, 2)
                    HStack(alignment: .bottom, spacing: 0){
                        CText(text: user.name, font: "Regular", size: 21, color: "pWhite", alignment: .center)
                        CText(text: "\(gameConfig.userScore) : \(gameConfig.opponentScore)", font: "Bold", size: 26, color: "pWhite", alignment: .center).padding(.leading, 18).padding(.trailing, 18)
                        CText(text: gameConfig.opponent?.name ?? "Tegenstander", font: "Regular", size: 21, color: "pWhite", alignment: .center)
                    }
                    HStack(alignment: .center){
                        ZStack(alignment: .trailing){
                            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1.5).frame(maxWidth: .infinity, maxHeight: 6)
                            
                            RoundedRectangle(cornerRadius: 10).fill(Color(.white)).frame(maxWidth: 300, maxHeight: 6)
                        }
                        CText(text: "\(Int(gameConfig.timeRemaining))sec", font: "Bold", size: 16, color: "pWhite").padding(.top, 2)
                    }
                }.padding().frame(maxWidth: .infinity).background(BackgroundGradient).cornerRadius(12)
                Spacer()
                VStack{
                    if let turn = gameConfig.currentPlayerTurn {
                        if(turn == user.id){
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
                                        Button(action: {}, label: {
                                            Image("brush")
                                        })
                                        Button(action: {}, label: {
                                            Image("eraser")
                                        })
                                    }
                                    Spacer()
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
            if(gameConfig.opponentFounded){
                renderGameScreen()
            }
            else{
                renderLoadingScreen()
            }
            Spacer()
        }.ignoresSafeArea()
    }
}

struct GamePage_Previews: PreviewProvider {
    static var user = User(name: "Dary", amountOfCoins: 136, currentLevel: 23, currentXp: 272)
    static var previews: some View {
        GamePage(user: user)
    }
}
