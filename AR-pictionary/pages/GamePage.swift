import SwiftUI

struct GamePage: View {
    @State private var opponentFounded: Bool = false;
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

    }
    
    func cancelGame(){
        
    }
    
    func renderGameScreen() -> some View{
        return VStack{
            CText(text: "Tegenstander gevonden", font: "Bold", size: 32, color: "pOrange", alignment: .center)
        }
    }
    
    var body: some View {
        VStack(){
            switch opponentFounded {
            case true: renderGameScreen()
            case false: renderLoadingScreen()
            }
            Spacer()
        }.padding(20)
    }
}

struct GamePage_Previews: PreviewProvider {
    static var previews: some View {
        GamePage(gameID: UUID())
    }
}
