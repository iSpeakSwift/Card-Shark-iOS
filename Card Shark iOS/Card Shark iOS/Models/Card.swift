//
//  Card.swift
//  Card Shark iOS
//
//  Created by Brandon on 4/9/18.
//  Copyright © 2018 Brandon. All rights reserved.
//

import Foundation

struct Card: Decodable, Comparable{
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit < rhs.suit
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit
    }
    
    let image: String
    let value: String
    let code: String
    let images: Images
    var suit: String
    
}
