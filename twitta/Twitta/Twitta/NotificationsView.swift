//
//  NotificationsView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

struct NotificationsView: View {
    @State var pushed = false
    @Binding var cs: ColorScheme
    
    var body: some View {
        NavigationView{
            Text("HI")
                .navigationBarTitle("Twitter", displayMode: .inline)
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

#Preview{
    NotificationsView(cs: .constant(.dark))
}
