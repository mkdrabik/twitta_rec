//
//  ContentView.swift
//  Twitter Recreation
//
//  Created by Mason Drabik on 11/20/23.
//

import SwiftUI

struct Tweet: Identifiable {
    var id = UUID()
    var username: String
    var message: String
}

struct ContentView: View {
    @State private var tweets: [Tweet] = [
        Tweet(username: "JohnDoe", message: "Just posted a new SwiftUI tutorial! #SwiftUI"),
        Tweet(username: "JaneSmith", message: "Excited to learn more about Swift at the upcoming conference! #iOSDev"),
        // Add more tweets as needed
    ]

    var body: some View {
        NavigationView {
            List(tweets) { tweet in
                TweetView(tweet: tweet)
            }
            .navigationBarTitle("Twitter", displayMode: .inline)
        }
    }
}

struct TweetView: View {
    var tweet: Tweet

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(tweet.username)
                .font(.headline)
            Text(tweet.message)
                .font(.body)
        }
        .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
