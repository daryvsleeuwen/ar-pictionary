import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack{
            PageHeader(currentCoins: 136, playerLevel: 23)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).padding()
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
