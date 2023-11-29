//
//  NotificationView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

struct NotificationView: View {
    let tweet: Tweet
    var body: some View {
        VStack{
            HStack{
                Image(tweet.pfp)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.leading)
                    .foregroundColor(.twitterBlue)
                Spacer()
                Image(systemName: "ellipsis")
                    .padding(.trailing)
            }
            HStack{
                Text(tweet.authorName)
                    .bold()
                    .lineLimit(1)
                    .padding(.top, 10)
                    .padding(.leading)
                Spacer()
            }
            HStack{
                Text(tweet.text)
                    .lineLimit(1)
                    .padding(.leading)
                Spacer()
            }
            }
        }
    }

#Preview {
    NotificationView(tweet: .example)
}
