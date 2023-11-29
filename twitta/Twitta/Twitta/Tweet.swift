//
//  Tweet.swift
//  Twitta
//
//  Created by Mason Drabik on 11/28/23.
//

import Foundation
import SwiftUI

struct Tweet: Identifiable{
    let id = UUID()
    let authorName: String
    let authorUsername: String
    let timestampText: String
    var text: String
    var numberOfReplies: Int
    var numberOfRetweets: Int
    var numberOfLikes: Int
    var pfp: String
}

extension Tweet{
    static var example: Tweet{
        Tweet(authorName: "Mason Drabik",
              authorUsername: "m_drabik",
              timestampText: "4h",
              text: "Finally.",
              numberOfReplies: 2,
              numberOfRetweets: 0,
              numberOfLikes: 0,
              pfp: "mason"
        )
    }
}
