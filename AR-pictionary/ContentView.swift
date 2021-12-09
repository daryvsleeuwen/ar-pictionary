import SwiftUI

struct ContentView: View {
    @State private var selectedNavPage: String = "home"
    
    var body: some View {
        VStack{
            switch selectedNavPage {
            case "home": HomePage()
            case "powerups": PowerupPage()
            case "account": AccountPage()
            default: HomePage()
            }
            
            HStack(){
                Spacer()
                Button(action: { selectedNavPage = "home"}) {
                    VStack(spacing: 0){
                        Image("home").resizable()
                            .scaledToFit()
                            .frame(width: 34, height: 34)
                        if selectedNavPage == "home" {
                            Text("Home").font(Font.custom("AvenirNext-Bold", size: 17)).foregroundColor(.white)
                        }
                    }
                }
                Spacer()
                Button(action: { selectedNavPage = "powerups"}) {
                    VStack(spacing: 0){
                        Image("powerup").resizable()
                            .scaledToFit()
                            .frame(width: 34, height: 34)
                        if selectedNavPage == "powerups" {
                            Text("Powerups").font(Font.custom("AvenirNext-Bold", size: 17)).foregroundColor(.white)
                        }
                    }
                }
                Spacer()
                Button(action: { selectedNavPage = "account"}) {
                    VStack(spacing: 0){
                        Image("person").resizable()
                            .scaledToFit()
                            .frame(width: 34, height: 34)
                        if selectedNavPage == "account" {
                            Text("Account").font(Font.custom("AvenirNext-Bold", size: 17)).foregroundColor(.white)
                        }
                    }
                    
                }
                Spacer()
            }.padding().cornerRadius(18).background(LinearGradient(gradient: Gradient(colors: [Color("pOrange"), Color("pRed")]), startPoint: .leading, endPoint: .trailing)).ignoresSafeArea()
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
