import SwiftUI

struct PowerupPage: View {
    var body: some View {
        VStack(alignment: .leading){
            PageHeader(currentCoins: 136, playerLevel: 23)
            CText(text: "Powerup Winkel", font: "Bold", size: 32, color: "pBlack").padding(.bottom, 30)
            Spacer()
        }.padding()
    }
}

struct PowerupPage_Previews: PreviewProvider {
    static var previews: some View {
        PowerupPage()
    }
}
