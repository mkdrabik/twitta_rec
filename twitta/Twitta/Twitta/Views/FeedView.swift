//
//  FeedView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

struct FeedView: View{
    let tweets: [Tweet]
    @Binding var cs: ColorScheme
    @Binding var settings: Bool
    @Binding var pushed: Bool
    
    var body: some View{
        NavigationView{
            List(tweets){tweet in
                TweetView(tweet: tweet)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Twitter", displayMode: .inline)
            .navigationBarItems(
                leading:
                    Button(action:{
                        settings.toggle()
                    }){
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

#Preview {
    FeedView(tweets: [.example], cs: .constant(.light), settings: .constant(false), pushed: .constant(true))
}
