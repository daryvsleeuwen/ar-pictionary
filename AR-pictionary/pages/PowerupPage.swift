import SwiftUI

struct PowerupPage: View {
    @ObservedObject var user: User
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                PageHeader(user: user)
                CText(text: "Powerup Winkel", font: "Bold", size: 32, color: "pBlack").padding(.bottom, 20)
                VStack{
                    GeometryReader { reader in
                        VStack{
                            HStack(spacing: 0){
                                PowerupBuyCard(powerupData: Powerups[0], user: user).frame(width: (reader.size.width - 50) / 2, height: (reader.size.width - 50) / 2).padding()
                                Spacer()
                                PowerupBuyCard(powerupData: Powerups[1], user: user).frame(width: (reader.size.width - 50) / 2, height: (reader.size.width - 50) / 2).padding()
                            }
                            HStack(spacing: 0){
                                PowerupBuyCard(powerupData: Powerups[2], user: user).frame(width: (reader.size.width - 50) / 2, height: (reader.size.width - 50) / 2).padding()
                                Spacer()
                                PowerupBuyCard(powerupData: Powerups[3], user: user).frame(width: (reader.size.width - 50) / 2, height: (reader.size.width - 50) / 2).padding()
                            }
                            
                        }.offset(x: -17)
                    }
                }
                Spacer()
            }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 20).padding(.bottom, 50)
        }
    }
}

//struct PowerupPage_Previews: PreviewProvider {
//    static var previews: some View {
//        PowerupPage()
//    }
//}
