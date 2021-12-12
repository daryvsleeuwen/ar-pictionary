import SwiftUI

struct CText: View {
    var text: String
    var font: String = "Bold"
    var size: CGFloat = 18
    var color: String = "pBlack"
    var alignment: TextAlignment = .leading
    
    var body: some View {
        Text(text).font(Font.custom("Nexa-\(font)", size: size)).foregroundColor(Color(color)).multilineTextAlignment(alignment)
    }
}

struct CText_Previews: PreviewProvider {
    static var previews: some View {
        CText(text: "Text Component", font: "Bold", size: 18, color: "pOrange")
    }
}
