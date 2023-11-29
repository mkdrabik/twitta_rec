//
//  SettingsView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var settings: Bool
    var body: some View {
        VStack{
            VStack{
                Image("mason")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                Text("Mason Drabik")
                    .font(.title2.bold())
                Text("@m_drabik")
                    .font(.callout)
                
                HStack(spacing: 12){
                    Button{
                    }label:{
                        Label{
                        Text("Followers")
                        } icon: {
                            Text("1,831")
                                .fontWeight(.bold)
                        }
                    }
                    Button{
                    }label:{
                        Label{
                        Text("Following")
                        } icon: {
                            Text("1,492")
                                .fontWeight(.bold)
                        }
                    }
                }
                .foregroundColor(.primary)
                
            }
            .padding(.horizontal)
            .padding(.leading)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 45){
                    TabButton(title: "Profile", image: "person")
                    TabButton(title: "Lists", image: "list.clipboard")
                    TabButton(title: "Topics", image: "text.bubble")
                    TabButton(title: "Bookmarks", image: "bookmark")
                    TabButton(title: "Moments", image: "bolt")
                    TabButton(title: "Purchases", image: "cart")
                    TabButton(title: "Monetization", image: "dollarsign")
                }
                .padding()
                .padding(.leading)
                .padding(.top, 35)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 25) {
                    Button("Settings And Privacy"){}
                    Button("Help Center"){}
                    
                }
                .padding()
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.primary)
                
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(maxHeight: .infinity)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String)->some View{
        
        Button{
        }label:{
            HStack(spacing: 13){
                
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SettingsView(settings: .constant(true))
}
