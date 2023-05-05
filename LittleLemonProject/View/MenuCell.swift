//
//  MenuItems.swift
//  LittleLemon
//
//  Created by Julien Laurent on 5/1/23.
//

import SwiftUI

struct MenuCell: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12){
                Text("Greek Salad")
                    .font(.title)
                    .fontWeight(.bold)
                    
                Text("The famous greek salad of crispy and lettuce, peppers, olive, and our chicago....")
                    .font(.body)
                    .lineSpacing(10)
                Text("$12.99")
                    .monospaced()
            }
            .padding(.vertical)
            Image("Greek salad")
                .resizable()
                .frame(width: 100, height: 100)
        }
        .padding(.horizontal)
    }
}

struct MenuItems_Previews: PreviewProvider {
    static var previews: some View {
        MenuCell()
    }
}
