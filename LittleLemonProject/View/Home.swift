//
//  Home.swift
//  LittleLemon
//
//  Created by Julien Laurent on 4/24/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
                Menu()
                .tabItem {
                    Label {
                        Text("Menu")
                    } icon: {
                        Image(systemName: "list.dash")
                    }
                }
                
                UserProfile()
                .tabItem {
                    Label {
                        Text("Profile")
                    } icon: {
                        Image(systemName: "square.and.pencil")
                    }
                }
        }
        .toolbarColorScheme(.light, for: .tabBar)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
