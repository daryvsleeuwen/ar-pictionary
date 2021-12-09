import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack{
            Text("HomePage")
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
