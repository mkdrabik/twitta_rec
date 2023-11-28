//
//  Tweet.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import Foundation

struct Tweet: Identifiable{
    let id = UUID()
    let authorName: String
    let authorUsername: String
    let timestampText: String
    let text: String
    let numberOfReplies: Int
    let numberOfRetweets: Int
    let numberOfLikes: Int
}
