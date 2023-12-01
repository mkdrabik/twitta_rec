//
//  NotificationsView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

struct NotificationsView: View {
    let notifications: [Tweet]
    @Binding var cs: ColorScheme
    @Binding var pushed: Bool
    
    var body: some View {
        NavigationView{
            List(notifications){tweet in
                NotificationView(tweet: tweet)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Notifications", displayMode: .inline)
                .navigationBarItems(
                    leading:
                        Button(action:{}){
                            Image("mason")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
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

#Preview{
    NotificationsView(notifications: [.example, .example], cs: .constant(.dark), pushed: .constant(true))
}
