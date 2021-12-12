import SwiftUI

struct AccountPage: View {
    var body: some View {
        VStack{
            CText(text: "AccountPage" , font: "Bold", size: 18, color: "pWhite")
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AccountPage_Previews: PreviewProvider {
    static var previews: some View {
        AccountPage()
    }
}
