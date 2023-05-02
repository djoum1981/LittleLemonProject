//
//  Menu.swift
//  LittleLemon
//
//  Created by Julien Laurent on 4/24/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300)

                Text("Chicago")
                .font(.title)
                .padding()
                Text("this is a short descricription of the restaurant")
                .font(.body)
                
           
            MenuItems()
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
