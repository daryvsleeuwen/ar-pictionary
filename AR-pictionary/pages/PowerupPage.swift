import SwiftUI

struct PowerupPage: View {
    @State var currentAmount: Int = 0
    private let Powerups: [Powerup] = Powerup.dummyData
    
    func renderPowerup(index: Int) -> some View{
        return PowerupBuyCard(icon: Powerups[index].icon, cost: Powerups[index].cost, name: Powerups[index].name, currentAmount: $currentAmount)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            PageHeader(currentCoins: 136, playerLevel: 23)
            CText(text: "Powerup Winkel", font: "Bold", size: 32, color: "pBlack").padding(.bottom, 20)
            VStack{
                GeometryReader { reader in
                    VStack{
                        HStack(spacing: 0){
                            renderPowerup(index: 0).frame(width: (reader.size.width - 50) / 2, height: (reader.size.width - 50) / 2).padding()
                            Spacer()
                            renderPowerup(index: 1).frame(width: (reader.size.width - 50) / 2, height: (reader.size.width - 50) / 2).padding()
                        }
                        HStack(spacing: 0){
                            renderPowerup(index: 2).frame(width: (reader.size.width - 50) / 2, height: (reader.size.width - 50) / 2).padding()
                            Spacer()
                            renderPowerup(index: 3).frame(width: (reader.size.width - 50) / 2, height: (reader.size.width - 50) / 2).padding()
                        }
                        
                    }.offset(x: -17)
                }
            }
            Spacer()
        }.padding(20)
    }
}

struct PowerupPage_Previews: PreviewProvider {
    static var previews: some View {
        PowerupPage()
    }
}
