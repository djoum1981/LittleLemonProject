//
//  CustomTextfieldStyle.swift
//  LittleLemon
//
//  Created by Julien Laurent on 4/26/23.
//

import Foundation
import SwiftUI
struct CustomTextfieldStyle: TextFieldStyle{
    func _body(configuration: TextField<Self ._Label>) -> some View {
        configuration
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: .systemGray6))
            .cornerRadius(4)
            .shadow(radius: 2)
    }
    
    
}
