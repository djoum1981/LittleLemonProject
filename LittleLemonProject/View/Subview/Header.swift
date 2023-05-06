//
//  Header.swift
//  LittleLemonProject
//
//  Created by Julien Laurent on 5/6/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
            
            Image("Profile")
                .resizable()
                .frame(width: 60, height: 60)
        }
        .padding(.horizontal)
    }
}


struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
