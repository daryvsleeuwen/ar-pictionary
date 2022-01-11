import SwiftUI

struct HomePage: View {
    @EnvironmentObject var user: User
    private let neededXPForLevelUp: Int = 400
    private let DailyChallenges: [DailyChallenge] = DailyChallenge.dummyData
    
    var body: some View {
        VStack(alignment: .leading){
            PageHeader()
            VStack{
                CText(text: "Je bent bijna level 24!" , font: "XBold", size: 22, color: "pWhite").padding(.bottom, 15)
                Circle()
                    .trim(from: 0, to: 1)
                    .fill(.white)
                    .frame(width: 140, height: 140)
                    .overlay(
                        ZStack{
                            Circle().fill(Color("pBlack")).frame(width: 120, height: 120)
                            CText(text: "Nog \(neededXPForLevelUp - user.currentXp)xp" , font: "XBold", size: 16, color: "pWhite")
                        }
                    ).padding(.bottom, 15)
                
               
                    Button(action: {
                        //TODO: route to new game screen
                    }, label: {
                        Spacer()
                        CText(text: "Start een nieuwe game" , font: "Bold", size: 18, color: "pBlack")
                        Spacer()
                        
                    }).padding().frame(maxWidth: .infinity).background(Color.white).cornerRadius(12)
                
            }.frame(
                maxWidth: .infinity
            ).padding(20).background(BackgroundGradient).cornerRadius(18).padding(.bottom, 30)
            CText(text: "Dagelijkse Challenges" , font: "Bold", size: 22, color: "pBlack").padding(.bottom, 10)
            ScrollView(.horizontal) {
                HStack{
                    ForEach(DailyChallenges) {challenge in
                        Rectangle().fill(BackgroundGradient).cornerRadius(18).frame(
                            width: 215,
                            height: 112
                        ).overlay(
                            VStack(alignment: .leading){
                                CText(text: "\(challenge.title)" , font: "Bold", size: 20, color: "pBlack").padding(.bottom, 1)
                                    .lineLimit(2)
                                HStack(spacing: 0){
                                    CText(text: "Beloning: " , font: "Bold", size: 14, color: "pBlack")
                                    CText(text: "\(challenge.xpReward)xp" , font: "XBold", size: 14, color: "pOrange")
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
        }.padding(20)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
