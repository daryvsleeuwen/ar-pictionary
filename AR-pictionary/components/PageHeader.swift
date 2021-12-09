import SwiftUI

struct PageHeader: View {
    @State var currentCoins: Int
    @State var playerLevel: Int
    
    var body: some View {
        HStack{
            HStack{
                HStack{
                    ZStack{
                        Circle().fill(LinearGradient(gradient: Gradient(colors: [Color("pOrange"), Color("pRed")]), startPoint: .leading, endPoint: .trailing)).frame(width: 46, height: 46)
                        Text("D").font(Font.custom("Nexa-Bold", size: 22)).foregroundColor(.white).padding(.top, 5)
                    }
                    Text("Level \(playerLevel)").font(Font.custom("Nexa-Bold", size: 19)).foregroundColor(Color("pBlack"))
                }
                Spacer()
                HStack{
                    ZStack{
                        Circle().fill(.white).frame(width: 26, height: 26)
                        Text("€").font(Font.custom("Nexa-Bold", size: 15)).foregroundColor(Color("pOrange")).padding(.top, 5)
                    }
                    Text("\(currentCoins)").font(Font.custom("Nexa-Bold", size: 17)).foregroundColor(.white)
                }.padding(8).background(LinearGradient(gradient: Gradient(colors: [Color("pOrange"), Color("pRed")]), startPoint: .leading, endPoint: .trailing)).cornerRadius(12)
            }
        }.padding(.bottom, 44)
    }
}

struct PageHeader_Previews: PreviewProvider {
    static var previews: some View {
        PageHeader(currentCoins: 136, playerLevel: 23)
    }
}


