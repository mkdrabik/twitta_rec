//
//  TweetView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

struct TweetView: View{
    let tweet: Tweet
    
    var body: some View{
        HStack(alignment: .top){
            Image(tweet.pfp)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .font(.system(size:55))
                .padding(.top)
                .padding(.trailing, 5)
                .foregroundColor(.twitterBlue)
            VStack(alignment: .leading){
                HStack{
                    Text(tweet.authorName)
                        .bold()
                        .lineLimit(1)
                    Text("@\(tweet.authorUsername) • \(tweet.timestampText)")
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .foregroundColor(.gray)
                }
                .padding(.top, 5)
                Text(tweet.text)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                
                TweetActionsView(tweet: tweet)
                    .foregroundColor(.gray)
                    .padding([.bottom, .top], 10)
                    .padding(.trailing, 10)
            }
        }
    }
}

struct TweetActionsView: View{
    @State public var tweet: Tweet
    @State private var rt: Bool = false
    @State private var like: Bool = false
    
    var body: some View{
        HStack{
            Button(action: {}){
                Image(systemName: "message")
            }
            Text(tweet.numberOfReplies > 0 ? "\(tweet.numberOfReplies)" : "")
            Spacer()
            
            Button(action:{
                rt.toggle()
                if(rt == true){
                    tweet.numberOfRetweets += 1
                } else {
                    tweet.numberOfRetweets -= 1
                }
            }){
                Image(systemName: "arrow.2.squarepath")
                    .foregroundColor(rt ? Color.green : Color.gray)
            }.buttonStyle(BorderlessButtonStyle())
            Text(tweet.numberOfRetweets > 0 ? "\(tweet.numberOfRetweets)" : "")
            Spacer()
            
            Button(action:{
                like.toggle()
                if(like == true){
                    tweet.numberOfLikes += 1
                } else {
                    tweet.numberOfLikes -= 1
                }
            }){
                if(like){
                    Image(systemName: "heart.fill")
                        .foregroundColor(like ? Color.red : Color.gray)
                } else {
                    Image(systemName: "heart")
                }
            }.buttonStyle(BorderlessButtonStyle())
            Text(tweet.numberOfLikes > 0 ? "\(tweet.numberOfLikes)" : "")
            Spacer()
            
            Button(action: {}){
                Image(systemName: "square.and.arrow.up")
            }
        }
    }
}

#Preview {
    TweetView(tweet: .example)
}
