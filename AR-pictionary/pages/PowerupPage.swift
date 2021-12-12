import SwiftUI

struct PowerupPage: View {
    @State private var currentAmount: Int = 0
    
    var body: some View {
        VStack(alignment: .leading){
            PageHeader(currentCoins: 136, playerLevel: 23)
            CText(text: "Powerup Winkel", font: "Bold", size: 32, color: "pBlack").padding(.bottom, 30)
            PowerupBuyCard(icon: "time_increase_buy", cost: 10, name: "Krijg 5 seconden extra tijd", currentAmount: $currentAmount).frame(width: 170, height: 170)
            Spacer()
        }.padding()
    }
}

struct PowerupPage_Previews: PreviewProvider {
    static var previews: some View {
        PowerupPage()
    }
}
