import SwiftUI

struct GamePage: View {
    @ObservedObject var gameConfig: GameConfig
    
    init(gameID: UUID){
        gameConfig = GameConfig(gameID: gameID)
        searchOpponent()
    }
    
    func renderLoadingScreen() -> some View{
        return VStack(alignment: .center){
            CText(text: "Zoeken naar een tegenstander...", font: "Bold", size: 32, color: "pOrange", alignment: .center).lineSpacing(8).padding(.bottom, 30)
            CButton(callback: {
                print("Custom Button Clicked")
            }, label: "Annuleren", width: 250)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func searchOpponent() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            gameConfig.opponentFounded = true
        }
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
                VStack{
                    CText(text: "Score", font: "Bold", size: 22, color: "pWhite", alignment: .center).padding(.bottom, 2)
                    HStack(alignment: .bottom, spacing: 0){
                        CText(text: "Dary", font: "Regular", size: 21, color: "pWhite", alignment: .center)
                        CText(text: "2 : 7", font: "Bold", size: 26, color: "pWhite", alignment: .center).padding(.leading, 18).padding(.trailing, 18)
                        CText(text: "Niels", font: "Regular", size: 21, color: "pWhite", alignment: .center)
                    }
                    HStack(alignment: .center){
                        ZStack(alignment: .trailing){
                            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1.5).frame(maxWidth: .infinity, maxHeight: 8)
                                
                            RoundedRectangle(cornerRadius: 10).fill(Color(.white)).frame(maxWidth: 300, maxHeight: 8)
                        }
                        CText(text: "\(Int(gameConfig.timeRemaining))sec", font: "Bold", size: 16, color: "pWhite").padding(.top, 2)
                    }
                    
                }.padding().frame(maxWidth: .infinity).background(BackgroundGradient).cornerRadius(12)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
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
    static var previews: some View {
        GamePage(gameID: UUID())
    }
}
