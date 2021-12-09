import SwiftUI

struct HomePage: View {
    @State var playerXP: Int
    private let neededXPForLevelUp: Int = 400
    private let DailyChallenges: [DailyChallenge] = DailyChallenge.data
    
    var body: some View {
        VStack(alignment: .leading){
            PageHeader(currentCoins: 136, playerLevel: 23)
            VStack{
                Text("Je bent bijna level 24!").font(Font.custom("AvenirNext-Bold", size: 22)).foregroundColor(.white).padding(.bottom, 15)
                Circle()
                    .trim(from: 0, to: 1)
                    .fill(.white)
                    .frame(width: 140, height: 140)
                    .overlay(
                        ZStack{
                            Circle().fill(Color("pBlack")).frame(width: 120, height: 120)
                            Text("Nog \(neededXPForLevelUp - playerXP)xp").font(Font.custom("AvenirNext-DemiBold", size: 16)).foregroundColor(.white)
                        }
                    ).padding(.bottom, 15)
                
                Button(action: {
                    //TODO: route to new game screen
                }, label: {
                    Spacer()
                    Text("Start een nieuwe game").font(Font.custom("AvenirNext-DemiBold", size: 18))
                        .foregroundColor(Color("pBlack"))
                    Spacer()
                    
                }).padding().frame(maxWidth: .infinity).background(Color.white).cornerRadius(12)
            }.frame(
                maxWidth: .infinity
            ).padding(20).background(LinearGradient(gradient: Gradient(colors: [Color("pOrange"), Color("pRed")]), startPoint: .leading, endPoint: .trailing)).cornerRadius(18).padding(.bottom, 30)
            Text("Dagelijkse Challenges").font(Font.custom("AvenirNext-DemiBold", size: 22))
                .foregroundColor(Color("pBlack")).padding(.bottom, 10)
            ScrollView(.horizontal) {
                HStack{
                    ForEach(DailyChallenges) {challenge in
                        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color("pOrange"), Color("pRed")]), startPoint: .leading, endPoint: .trailing)).cornerRadius(18).frame(
                            width: 215,
                            height: 112
                        ).overlay(
                            VStack(alignment: .leading){
                                Text("\(challenge.title)").font(Font.custom("AvenirNext-DemiBold", size: 20)).foregroundColor(Color("pBlack")).padding(.bottom, 1)
                                    .lineLimit(2)
                                HStack(spacing: 0){
                                    Text("Beloning: ").font(Font.custom("AvenirNext-DemiBold", size: 14)).foregroundColor(Color("pBlack"))
                                    Text("\(challenge.xpReward)xp").font(Font.custom("AvenirNext-Bold", size: 14)).foregroundColor(Color("pOrange"))
                                }
                            }.padding(10).frame(
                                width: 208,
                                height: 105
                            ).background(Color.white).cornerRadius(15)
                        ).padding(.trailing, 20)
                    }
                }
            }
            Spacer()
        }.padding()
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(playerXP: 272)
    }
}
