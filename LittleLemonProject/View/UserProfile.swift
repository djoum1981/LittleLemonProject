//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Julien Laurent on 5/1/23.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults().string(forKey: kFirstName)
    let lastName = UserDefaults().string(forKey: kLastName)
    let email = UserDefaults().string(forKey: kEmail)
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            NavigationView{
                
                GeometryReader{ proxy in
                    VStack{
                       
                        VStack{
                            
                            Image("Profile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250)
                            
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.40)
                        .background(Color("littleLemonColor"))
                       
                        
                        
                        List{
                            Section {
                                Text(firstName ?? "")
                                    .font(.title)
                                    .fontWeight(.ultraLight)
                                    .padding(.leading)
                                    .padding(.vertical, 8)
                            } header: {
                                Text("First Name")
                                    .font(.caption)
                            }
                            
                            Section {
                                Text(lastName ?? "")
                                    .font(.title)
                                    .fontWeight(.ultraLight)
                                    .padding(.leading)
                                    .padding(.vertical, 8)
                                
                            }header: {
                                Text("Last Name")
                                    .font(.caption)
                            }
                            
                            Section {
                                Text(email ?? "")
                                    .font(.title)
                                    .fontWeight(.ultraLight)
                                    .padding(.leading)
                                    .padding(.vertical, 8)
                            }header: {
                               
                                Text("Email")
                                    .font(.caption)
                            }
                        }
                        .listStyle(.plain)
                    }
                }
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                            dismiss()
                        } label: {
                            Text("Logout")
                                .foregroundColor(.white)
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Profile")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                })
                .navigationBarTitleDisplayMode(.inline)
            }
            
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
