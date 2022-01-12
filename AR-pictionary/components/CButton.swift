//
//  CButton.swift
//  AR-pictionary
//
//  Created by Dary van Sleeuwen on 15/12/2021.
//

import SwiftUI

struct CButton: View {
    var callback: () -> ()
    var label: String
    var width: CGFloat?
    
    var body: some View {
        Button(action: {
            callback()
        }, label: {
            Spacer()
            CText(text: label , font: "Bold", size: 18, color: "pWhite")
            Spacer()
            
        }).padding().frame(maxWidth: width != nil ? width : .infinity, maxHeight: 50).background(BackgroundGradient).cornerRadius(12)
    }
}

struct CButton_Previews: PreviewProvider {
    static var previews: some View {
        CButton(callback: {
            print("Custom Button Clicked")
        }, label: "Custom Button")
    }
}
