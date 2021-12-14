import SwiftUI

struct ContentView: View {
    @State private var selectedNavPage: String = "home"
    
    var body: some View {
        VStack{
            switch selectedNavPage {
            case "home": HomePage(playerXP: 272)
            case "powerups": PowerupPage()
            case "account": AccountPage()
            default: HomePage(playerXP: 272)
            }
            
            HStack(){
                Spacer()
                Button(action: { selectedNavPage = "home"}) {
                    VStack(spacing: 0){
                        Image("home").resizable()
                            .scaledToFit()
                            .frame(width: 34, height: 34).padding(.bottom, 5)
                        if selectedNavPage == "home" {
                            CText(text: "Home" , font: "Bold", size: 17, color: "pWhite")
                        }
                    }
                }
                Spacer()
                Button(action: { selectedNavPage = "powerups"}) {
                    VStack(spacing: 0){
                        Image("powerup").resizable()
                            .scaledToFit()
                            .frame(width: 34, height: 34).padding(.bottom, 5)
                        if selectedNavPage == "powerups" {
                            CText(text: "Powerups" , font: "Bold", size: 17, color: "pWhite")
                        }
                    }
                }
                Spacer()
                Button(action: { selectedNavPage = "account"}) {
                    VStack(spacing: 0){
                        Image("person").resizable()
                            .scaledToFit()
                            .frame(width: 34, height: 34).padding(.bottom, 5)
                        if selectedNavPage == "account" {
                            CText(text: "Account" , font: "Bold", size: 17, color: "pWhite")
                        }
                    }
                    
                }
                Spacer()
            }.padding().cornerRadius(18).background(BackgroundGradient).ignoresSafeArea()
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
