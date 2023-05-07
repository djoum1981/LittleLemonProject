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
            Spacer()
            Spacer()
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Spacer()
            Image("Profile")
                .resizable()
                .frame(width: 50, height: 50)
        }
        .padding(.horizontal)
    }
}


struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
