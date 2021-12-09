import SwiftUI

struct PowerupPage: View {
    var body: some View {
        VStack(alignment: .leading){
            PageHeader(currentCoins: 136, playerLevel: 23)
            Text("Powerup Winkel").font(Font.custom("Nexa-Bold", size: 32)).foregroundColor(Color("pBlack")).padding(.bottom, 30)
            Spacer()
        }.padding()
    }
}

struct PowerupPage_Previews: PreviewProvider {
    static var previews: some View {
        PowerupPage()
    }
}
