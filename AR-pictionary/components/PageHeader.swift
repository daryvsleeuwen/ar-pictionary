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
                        Text("D").font(Font.custom("AvenirNext-DemiBold", size: 22)).foregroundColor(.white)
                    }
                    Text("Level \(playerLevel)").font(Font.custom("AvenirNext-DemiBold", size: 19)).foregroundColor(Color("pBlack"))
                }
                Spacer()
                HStack{
                    ZStack{
                        Circle().fill(.white).frame(width: 26, height: 26)
                        Text("€").font(Font.custom("AvenirNext-DemiBold", size: 15)).foregroundColor(Color("pOrange"))
                    }
                    Text("\(currentCoins)").font(Font.custom("AvenirNext-DemiBold", size: 17)).foregroundColor(.white)
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


