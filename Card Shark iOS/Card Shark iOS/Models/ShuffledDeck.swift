//
//  ShuffledDeck.swift
//  Card Shark iOS
//
//  Created by Brandon on 4/9/18.
//  Copyright © 2018 Brandon. All rights reserved.
//

import Foundation

struct ShuffledDeck: Decodable{
    
    let remaining: Int
    let cards: [Card]
    
}
