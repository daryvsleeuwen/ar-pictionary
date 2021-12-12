import SwiftUI

struct PowerupBuyCard: View {
    @Binding var currentAmount: Int
    var icon: String, cost: Int, name: String, padding: CGFloat = 0
    
    init(icon: String, cost: Int, name: String, currentAmount: Binding<Int>){
        self.icon = icon
        self.cost = cost
        self.name = name
        self._currentAmount = currentAmount
        
        if (icon == "time_increase_buy" || icon == "time_decrease_buy") {
            padding = 20
        }
    }
    
    var body: some View {
        GeometryReader { reader in
            VStack{
                VStack(alignment: .center, spacing: 0){
                    Image(icon).padding(.bottom, 15).padding(.trailing, padding)
                    CText(text: name, font: "Bold", size: 15, color: "pBlack", alignment: .center).fixedSize(horizontal: false, vertical: true)
                }.frame(maxHeight: .infinity)
                Spacer()
                Button(action: {
                    //TODO - Increase currentAmount and decrease current user coins.
                    currentAmount += 1
                }, label: {
                    HStack(spacing: 0){
                        CText(text: String(cost), font: "XBold", size: 18, color: "pWhite").padding(.top, 5).padding(.trailing, 5)
                        Image("add_circle").resizable().frame(width: 20, height: 20)
                    }.frame(maxWidth:  .infinity, maxHeight: 48)
                    
                    
                }).background(BackgroundGradient).cornerRadius(12)
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.white).cornerRadius(12).shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 2).overlay(
                ZStack(alignment: .center){
                    Circle().fill(Color("pBlack")).frame(maxWidth: 30, maxHeight: 30)
                    CText(text: String(currentAmount), font: "Bold", size: 16, color: "pWhite").padding(.top, 4)
                }.position(x: reader.size.width, y: 0)
            )
        }
        
    }
}
