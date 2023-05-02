//
//  CustomStyle.swift
//  LittleLemon
//
//  Created by Julien Laurent on 5/1/23.
//

import Foundation
import SwiftUI
struct CustomTextFieldStyle: TextFieldStyle{
    
    func  _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: .white))
            .foregroundColor(Color(uiColor: .darkText))
            .cornerRadius(4)
            .shadow(color: Color("littleLemonColor"), radius: 1)
    }
}

struct CustomButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration .label
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color("littleLemonColor"))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
