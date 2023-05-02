//
//  MenuItems.swift
//  LittleLemon
//
//  Created by Julien Laurent on 5/1/23.
//

import SwiftUI

struct MenuItems: View {
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("item")
            }
            .listStyle(.plain)
            .navigationTitle("Items")
        }
    }
}

struct MenuItems_Previews: PreviewProvider {
    static var previews: some View {
        MenuItems()
    }
}
