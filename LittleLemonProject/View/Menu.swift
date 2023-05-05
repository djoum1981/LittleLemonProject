//
//  Menu.swift
//  LittleLemon
//
//  Created by Julien Laurent on 4/24/23.
//

import SwiftUI

struct Menu: View {
    @State var search: String = ""
    var body: some View {
        VStack{
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
            
            
            VStack(alignment: .leading)  {
                Text("Little Lemon")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Chicago")
                            .foregroundColor(Color.theme.customPrimary2)
                            .font(.title)
                        
                        
                        Text("we are a familly owned mediterenean restaurant, focused on traditional recipes served with a moderntwist")
                            .lineSpacing(20)
                            .multilineTextAlignment(.leading)
                            .font(.body)
                            .padding(.trailing)
                            .foregroundColor(Color.white)
                    }
                    Image("Hero image")
                        .resizable()
                        .frame(width: 130, height: 160)
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.theme.customPrimary1)
            
            VStack(spacing: 20){
                HStack {
                    Text("Order for delivery")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10) {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Starters")
                                .padding(8)
                        }
                        .buttonStyle(.bordered)
                        
                        Button {
                            
                        } label: {
                            Text("Main")
                                .padding(8)
                        }
                        .buttonStyle(.bordered)
                        
                        Button {
                            
                        } label: {
                            Text("Desserts")
                                .padding(8)
                        }
                        .buttonStyle(.bordered)
                        
                        Button {
                            
                        } label: {
                            Text("Sides")
                                .padding(8)
                        }
                        .buttonStyle(.bordered)
                        
                    }
                    
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            
            ScrollView{
                ForEach(1..<5){ item in
                   MenuCell()
                    
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.theme.customSecondary5)
            
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

