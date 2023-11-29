//
//  DMView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

struct DMView: View {
    @State var pushed = false
    @Binding var cs: ColorScheme
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Welcome to your inbox!")
                        .bold()
                        .font(.system(size: 25))
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.bottom, 5)
                HStack{
                    Text("Drop a line, share posts and more with private converstations between you and others on twitter.")
                        .font(.system(size: 15))
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.bottom, 40)
                HStack {
                    Button(action:{}){
                        ZStack {
                            Color.blue
                                .frame(width: 180, height:50)
                                .cornerRadius(40)
                            Text("Write a message")
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                        }
                    }
                    Spacer()
                }
                .padding(.leading)
            }
            .padding(.bottom, 400)
                .navigationBarTitle("Messages", displayMode: .inline)
                .navigationBarItems(
                    leading:
                        Button(action:{}){
                            Image(systemName: "person.crop.circle.fill")
                                .foregroundColor(.twitterBlue)
                        },
                    trailing: Button(action: {
                        pushed.toggle()
                        if(pushed){
                            cs = .dark
                        } else {
                            cs = .light
                        }
                    }){
                        Image(systemName: "moon.stars")
                            .foregroundColor(.twitterBlue)
                    })
        }
    }
}

#Preview {
    DMView(cs: .constant(.dark))
}
