//
//  FeedView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

struct FeedView: View{
    let tweets: [Tweet]
    @State var pushed = false
    @Binding var cs: ColorScheme
    
    var body: some View{
        NavigationView{
            List(tweets){tweet in
                TweetView(tweet: tweet)
            }
            .listStyle(PlainListStyle())
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

#Preview {
    FeedView(tweets: [.example], pushed: false, cs: .constant(.light))
}
