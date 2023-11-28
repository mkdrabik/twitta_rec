//
//  ContentView.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import SwiftUI

extension Color{
    static var twitterBlue: Color = Color(red: 29/255, green: 161/255, blue: 241/255)
}

struct ContentView: View {
    @State var tweets: [Tweet] = [
          Tweet(authorName: "Mason Drabik",
                authorUsername: "m_drabik",
                timestampText: "4h",
                text: "Finally done.",
                numberOfReplies: 2,
                numberOfRetweets: 0,
                numberOfLikes: 0, pfp: "mason"),
          Tweet(authorName: "Elon Musk",
                authorUsername: "em",
                timestampText: "15h",
                text: "I will own this app soon...",
                numberOfReplies: 589,
                numberOfRetweets: 368,
                numberOfLikes: 450, pfp: "elon"),
          Tweet(authorName: "Donald J. Trump",
                authorUsername: "realDonaldTrump",
                timestampText: "6h",
                text: "LOL",
                numberOfReplies: 2890,
                numberOfRetweets: 4565,
                numberOfLikes: 896, pfp: "don"),
          Tweet(authorName: "Mason Drabik",
                authorUsername: "m_drabik",
                timestampText: "15h",
                text: "J Chillin whats up twitta",
                numberOfReplies: 589,
                numberOfRetweets: 368,
                numberOfLikes: 450, pfp: "mason"),
          Tweet(authorName: "Lebron James",
                authorUsername: "lbj",
                timestampText: "12h",
                text: "Just a kid from Akron, man all glory to God!",
                numberOfReplies: 558,
                numberOfRetweets: 3568,
                numberOfLikes: 4350, pfp: "lebron"),
          Tweet(authorName: "Dave Portnoy",
                authorUsername: "dp",
                timestampText: "15h",
                text: "Something stupid about Boston sports",
                numberOfReplies: 589,
                numberOfRetweets: 368,
                numberOfLikes: 450, pfp: "dp"),
          Tweet(authorName: "Donald Trump",
                authorUsername: "dp",
                timestampText: "15h",
                text: "2016 Cavaliers best team in NBA history. There I said it.",
                numberOfReplies: 589,
                numberOfRetweets: 368,
                numberOfLikes: 450, pfp: "don"),

        ]

    @State private var selectedTab = 0
    @State private var cs: ColorScheme = .light
    var body: some View {
        ZStack{
            TabView(selection: $selectedTab){
                FeedView(tweets: tweets, cs: $cs).tabItem {
                    Image(systemName: "house")
                }.tag(0)
                SearchView(cs: $cs).tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
                Text("Tab Content 1").tabItem {
                    Image(systemName: "bell")
                }.tag(2)
                Text("Tab Content 1").tabItem {
                    Image(systemName: "envelope")
                }.tag(3)
            }
            .accentColor(.twitterBlue)
            .environment(\.colorScheme, cs)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    NewTweetButton()
                        .padding(.bottom, 65)
                        .padding(.trailing)
                }
            }
        }
    }
}

struct NewTweetButton: View {
    var body: some View {
        Button(action:{}){
            Image(systemName: "pencil")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
        }
        .background(Color.twitterBlue)
        .mask(Circle())
        .shadow(radius: 5)
    }
}



#Preview {
    ContentView()
}

