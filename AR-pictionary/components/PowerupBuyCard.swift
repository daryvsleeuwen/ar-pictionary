import SwiftUI

struct PowerupBuyCard: View {
    @ObservedObject var powerupData: Powerup
    var padding: CGFloat = 0
 
    
    var body: some View {
        GeometryReader { reader in
            VStack{
                VStack(alignment: .center, spacing: 0){
                    Image(powerupData.icon).padding(.bottom, 15).padding(.trailing, padding)
                    CText(text: powerupData.name, font: "Bold", size: 15, color: "pBlack", alignment: .center).fixedSize(horizontal: false, vertical: true).padding(.leading, 14).padding(.trailing, 15)
                }.frame(maxHeight: .infinity)
                Spacer()
                Button(action: {
                    //TODO - Decrease current user coins.
                    powerupData.currentAmount += 1
                }, label: {
                    HStack(spacing: 0){
                        CText(text: String(powerupData.cost), font: "XBold", size: 18, color: "pWhite").padding(.top, 5).padding(.trailing, 5)
                        Image("add_circle").resizable().frame(width: 20, height: 20)
                    }.frame(maxWidth:  .infinity, maxHeight: 48)
                    
                    
                }).background(BackgroundGradient).cornerRadius(12)
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.white).cornerRadius(12).shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 2).overlay(
                ZStack(alignment: .center){
                    Circle().fill(Color("pBlack")).frame(maxWidth: 34, maxHeight: 34)
                    CText(text: String(powerupData.currentAmount), font: "Bold", size: 16, color: "pWhite").padding(.top, 4)
                }.position(x: reader.size.width, y: 0)
            )
        }
        
    }
}
