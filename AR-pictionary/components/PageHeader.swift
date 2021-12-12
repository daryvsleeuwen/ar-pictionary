import SwiftUI

struct PageHeader: View {
    @State var currentCoins: Int
    @State var playerLevel: Int
    
    var body: some View {
        HStack{
            HStack{
                HStack{
                    ZStack{
                        Circle().fill(BackgroundGradient).frame(width: 46, height: 46)
                        CText(text: "D", font: "Bold", size: 22, color: "pWhite").padding(.top, 5)
                    }
                    CText(text: "Level \(playerLevel)", font: "Bold", size: 19, color: "pBlack")
                }
                Spacer()
                HStack{
                    ZStack{
                        Circle().fill(.white).frame(width: 26, height: 26)
                        CText(text: "€", font: "Bold", size: 15, color: "pOrange").padding(.top, 5)
                    }
                    CText(text: String(currentCoins), font: "Bold", size: 17, color: "pWhite")
                }.padding(8).background(BackgroundGradient).cornerRadius(12)
            }
        }.padding(.bottom, 44)
    }
}

struct PageHeader_Previews: PreviewProvider {
    static var previews: some View {
        PageHeader(currentCoins: 136, playerLevel: 23)
    }
}


