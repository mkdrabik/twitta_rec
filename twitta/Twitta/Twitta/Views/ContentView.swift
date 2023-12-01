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
          Tweet(authorName: "Elon Musk",
                authorUsername: "em",
                timestampText: "4h",
                text: "Finally done with the CyberTruck.",
                numberOfReplies: 2,
                numberOfRetweets: 2000,
                numberOfLikes: 50000, pfp: "elon"),
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
          Tweet(authorName: "Dave Portnoy",
                authorUsername: "dp",
                timestampText: "15h",
                text: "J Chillin whats up twitta",
                numberOfReplies: 589,
                numberOfRetweets: 368,
                numberOfLikes: 450, pfp: "dp"),
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
          Tweet(authorName: "Lebron James",
                authorUsername: "lbj",
                timestampText: "12h",
                text: "I agree with Donald.",
                numberOfReplies: 558,
                numberOfRetweets: 3568,
                numberOfLikes: 4350, pfp: "lebron"),
          Tweet(authorName: "Donald Trump",
                authorUsername: "dp",
                timestampText: "15h",
                text: "Michael Jordan > Lebron James",
                numberOfReplies: 589,
                numberOfRetweets: 368,
                numberOfLikes: 450, pfp: "don"),
          Tweet(authorName: "Lebron James",
                authorUsername: "lbj",
                timestampText: "12h",
                text: "NVM.",
                numberOfReplies: 558,
                numberOfRetweets: 3568,
                numberOfLikes: 4350, pfp: "lebron"),
          Tweet(authorName: "Elon Musk",
                authorUsername: "em",
                timestampText: "15h",
                text: "Aliens are the best basketball players.",
                numberOfReplies: 589,
                numberOfRetweets: 368,
                numberOfLikes: 450, pfp: "elon")

        ]
    
    @State private var selectedTab = 0
    @State private var cs: ColorScheme = .light
    @State private var pushed: Bool = false
    @State private var plus = false
    @State private var settings: Bool = false
    
    var body: some View {
        ZStack{
            TabView(selection: $selectedTab){
                FeedView(tweets: tweets, cs: $cs, settings: $settings, pushed: $pushed).tabItem {
                    Image(systemName: "house")
                }.tag(0)
                SearchView(cs: $cs, pushed: $pushed).tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
                NotificationsView(notifications: tweets, cs: $cs, pushed: $pushed).tabItem {
                    Image(systemName: "bell")
                }.tag(2)
                DMView(cs: $cs, pushed: $pushed).tabItem {
                    Image(systemName: "envelope")
                }.tag(3)
            }
            .accentColor(.twitterBlue)
            .environment(\.colorScheme, cs)
            .sheet(isPresented: $plus){
                AddTweetView(tweets: $tweets, plus: $plus)
            }
            .sheet(isPresented: $settings){
                SettingsView(settings: $settings)
            }
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    NewTweetButton(plus: $plus)
                        .padding(.bottom, 65)
                        .padding(.trailing)
                }
            }
        }
    }
}

struct NewTweetButton: View {
    @Binding var plus: Bool
    
    var body: some View {
        Button(action:{
            plus = true
        }){
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

