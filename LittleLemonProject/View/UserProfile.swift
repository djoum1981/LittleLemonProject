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
    
    @State var orderStatus: Bool = true
    @State var specialOffer: Bool = true
    @State var passwordChanges: Bool = false
    @State var newLetter: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Image("Logo")
            
            Image("Profile")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
            List{
                Section {
                    Text(firstName ?? "")
                    
                } header: {
                    Text("First Name")
                        .font(.caption)
                }
                
                Section {
                    Text(lastName ?? "")
                    
                    
                }header: {
                    Text("Last Name")
                        .font(.caption)
                }
                
                Section {
                    Text(email ?? "")
                }header: {
                    Text("Email")
                        .font(.caption)
                }
                Section {
                    Text("(305) 521 3454")
                } header: {
                    Text("Phone number")
                        .font(.caption)
                }
                
                Section {
                    
                    Toggle(isOn: $orderStatus) {
                        Text("Order status")
                    }
                    Toggle(isOn: $specialOffer) {
                        Text("Special offer")
                    }
                    Toggle(isOn: $passwordChanges) {
                        Text("Password changes")
                    }
                    
                    Toggle(isOn: $newLetter) {
                        Text("Newsletter")
                    }
                    
                }header: {
                    Text("Email notification")
                        .font(.headline)
                }
            }
            
            
            Group{
                Button {
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    dismiss()
                } label: {
                    Text("Logout")
                    
                }
                .buttonStyle(CustomButtonStyle())
                HStack{
                    Button {
                        
                    } label: {
                        Text("Discard Changes")
                            .foregroundColor(Color.primary)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.theme.customPrimary1, lineWidth: 2))
                    }
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("save Changes")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.theme.customPrimary1)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
            }
            .padding(8)
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        //NavigationView{
        UserProfile()
        //}
    }
}
