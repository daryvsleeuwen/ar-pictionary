import SwiftUI

struct PowerupPage: View {
    @State var currentAmount: Int = 0
    private let Powerups: [Powerup] = Powerup.dummyData
    
    var body: some View {
        VStack(alignment: .leading){
            PageHeader(currentCoins: 136, playerLevel: 23)
            CText(text: "Powerup Winkel", font: "Bold", size: 32, color: "pBlack").padding(.bottom, 30)
            VStack{
                GeometryReader { reader in
                    VStack{
                        ForEach(Powerups){powerup in
                            PowerupBuyCard(icon: powerup.icon, cost: powerup.cost, name: powerup.name, currentAmount: $currentAmount).frame(width: 170, height: 170).padding()
                        }
                    }
                }
            }
            Spacer()
        }.padding()
    }
}

struct PowerupPage_Previews: PreviewProvider {
    static var previews: some View {
        PowerupPage()
    }
}
