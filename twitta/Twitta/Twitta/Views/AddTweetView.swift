//
//  AddTweetView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

struct AddTweetView: View {
    @Binding var tweets: [Tweet]
    @Binding var plus: Bool
    @State var txt: String = ""
    @State var tweet = Tweet(authorName: "Mason Drabik",
                             authorUsername: "m_drabik",
                             timestampText: "Now",
                             text: "",
                             numberOfReplies: 0,
                             numberOfRetweets: 0,
                             numberOfLikes: 0,
                             pfp: "mason"
                       )
    var body: some View {
        NavigationStack{
            HStack{
                Image("mason")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .font(.system(size:55))
                    .padding(.top)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                    .foregroundColor(.twitterBlue)
                TextField("Whats Happening?", text: $txt)
            }
            Spacer()
                .navigationBarItems(
                    leading:
                        Button(action:{
                            plus = false
                        }){
                            Text("Cancel")
                                .foregroundColor(.twitterBlue)
                                .font(.system(size: 20))
                        },
                    trailing: Button(action: {
                        tweet.text = txt
                        tweets.insert(tweet, at: 0)
                        plus = false
                    }){
                       Text("Post")
                            .foregroundColor(.twitterBlue)
                            .font(.system(size: 20))
                    })
        }
    }
}

#Preview {
    AddTweetView(tweets: .constant([.example]), plus: .constant(true))
}
